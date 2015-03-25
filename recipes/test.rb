php_fpm_pool "www" do
  action :delete
end

php_fpm_pool "test" do
  listen "/var/run/test.sock"
  pm_max_children 30
  request_slowlog_timeout 10
  slow_log "/var/log/php5-fpm-slow.log"
  pm_start_servers 10
  pm_max_spare_servers 10
  php_ini_admin_flags ({ "log_errors" => "on", "display_startup_errors" => "off" })
  php_ini_admin_values ({ "error_log" => "/var/log/php5-fpm.log", "error_reporting" => "E_ALL", "display_errors" => "off"})
  notifies :reload, "service[#{node['php']['fpm']['service']}]", :delayed
end

php_fpm_pool "test2" do
  notifies :reload, "service[#{node['php']['fpm']['service']}]", :delayed
end

php_pear "mongo" do
  channel "pecl"
  action :install
end