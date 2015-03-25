#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Recipe:: default
#

include_recipe "apt"
include_recipe 'php::install'
include_recipe 'php::pear'

if node['php']['fpm']['install']
  include_recipe 'php::fpm'
end

include_recipe 'php::config'