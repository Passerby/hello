require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment

namespace :resque do
  task setup: :environment do
    require 'resque'
    require 'resque-scheduler'
    puts 'Loading Rails environment for Resque'
    ActiveRecord::Base.descendants.each { |klass|  klass.columns }
  end
end
