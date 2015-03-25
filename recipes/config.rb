#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Recipe:: default
#

# Configure pho.ini file
# template node['php']['cli']['ini'] do
#   source node['php']['ini-template']
#   owner 'root'
#   group 'root'
#   mode '0644'
#   variables(:directives => node['php']['directives'])
# end


php_ini node['php']['cli']['ini-file'] do
  action :update
  values node['php']['cli']['ini-defaults']
end

if node['php']['fpm']['install']
  # Configure php.ini for fpm
  php_ini node['php']['fpm']['ini-file'] do
    action :update
    values node['php']['fpm']['ini-defaults']
  end

  # Configure php-fpm.conf config file
  template node['php']['fpm']['conf-file'] do
    source 'php-fpm.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
  end
end