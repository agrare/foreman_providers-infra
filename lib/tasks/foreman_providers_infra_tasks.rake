require 'rake/testtask'

# Tasks
namespace :foreman_providers_infra do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanProviders::Infra'
  Rake::TestTask.new(:foreman_providers_infra) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :foreman_providers_infra do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_providers_infra) do |task|
        task.patterns = ["#{ForemanProviders::Infra::Engine.root}/app/**/*.rb",
                         "#{ForemanProviders::Infra::Engine.root}/lib/**/*.rb",
                         "#{ForemanProviders::Infra::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_providers_infra'].invoke
  end
end

Rake::Task[:test].enhance ['test:foreman_providers_infra']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:foreman_providers_infra', 'foreman_providers_infra:rubocop']
end
