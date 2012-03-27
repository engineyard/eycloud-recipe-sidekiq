#
# Cookbook Name:: sidekiq
# Recipe:: default
#

require_recipe "sidekiq::configure"
require_recipe "sidekiq::restart"
