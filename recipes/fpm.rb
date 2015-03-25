# PHP-FPM

#Restart service
service_provider = nil
if node['platform'] == 'ubuntu' and node['platform_version'].to_f >= 13.10
  service_provider = ::Chef::Provider::Service::Upstart
end

service node['php']['fpm']['service'] do
  provider service_provider if service_provider
  service_name node['php']['fpm']['service']
  supports :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
  not_if "ps ax| grep php-fpm"
end

