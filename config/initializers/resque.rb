require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(ENV['REDISCLOUD_URL']) if Rails.env.production?