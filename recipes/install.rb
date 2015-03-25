#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Recipe:: ppa_ondrej
#


case node['php']['version']
  when '5.4'
    ppa           = 'ppa:ondrej/php5-oldstable'
  when '5.5'
    ppa           = 'ppa:ondrej/php5'
  when '5.6'
    ppa           = 'ppa:ondrej/php5-5.6'
  else

end


# Add apt repository
apt_repository "ondrej-php-#{node['lsb']['codename']}" do
#apt_repository default['php']['ppa'].
  uri ppa
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'E5267A6C'
  action :add
end

# Install all packages from repository
php_packages = node['php']['base-packages'] + node['php']['mod-packages']
php_packages += node['php']['fpm']['packages'] if node['php']['fpm']['install']
php_packages.each do |pkg|
  package pkg do
    action :upgrade
    options node['php']['package-options']
  end
end

#
chef_gem "inifile"


