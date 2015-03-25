
def whyrun_supported?
  true
end

use_inline_resources

action :create do
  template php_fpm_pool_file do
    source new_resource.template_source
    cookbook new_resource.template_cookbook
    owner "root"
    group "root"
    mode "0644"
    variables(
      name:                       new_resource.name,
      pool_name:                  new_resource.pool_name,
      pool_user:                  new_resource.pool_user,
      pool_group:                 new_resource.pool_group,
      listen:                     new_resource.listen,
      listen_allowed_clients:     new_resource.listen_allowed_clients,
      listen_owner:               new_resource.listen_owner,
      listen_group:               new_resource.listen_group,
      listen_mode:                new_resource.listen_mode,
      pm:                         new_resource.pm,
      pm_max_children:            new_resource.pm_max_children,
      pm_start_servers:           new_resource.pm_start_servers,
      pm_min_spare_servers:       new_resource.pm_min_spare_servers,
      pm_max_spare_servers:       new_resource.pm_max_spare_servers,
      pm_max_requests:            new_resource.pm_max_requests,
      pm_status_path:             new_resource.pm_status_path,
      ping_path:                  new_resource.ping_path,
      ping_response:              new_resource.ping_response,
      request_slowlog_timeout:    new_resource.request_slowlog_timeout,
      request_terminate_timeout:  new_resource.request_terminate_timeout,
      slow_log:                   new_resource.slow_log,
      chdir:                      new_resource.chdir,
      chroot:                     new_resource.chroot,
      catch_workers_output:       new_resource.catch_workers_output,
      security_limit_extensions:  new_resource.security_limit_extensions,
      rlimit_files:               new_resource.rlimit_files,
      rlimit_core:                new_resource.rlimit_core,
      php_ini_flags:              new_resource.php_ini_flags,
      php_ini_values:             new_resource.php_ini_values,
      php_ini_admin_flags:        new_resource.php_ini_admin_flags,
      php_ini_admin_values:       new_resource.php_ini_admin_values,
      env_variables:              new_resource.env_variables
    )
  end
end

action :delete do
  if @current_resource.exists
    file php_fpm_pool_file do
      action :delete
    end
  end
end

def php_fpm_pool_file
  "#{ node['php']['fpm']['pool-dir'] }/#{new_resource.pool_name}.conf"
end

def load_current_resource
  @current_resource = Chef::Resource::PhpFpmPool.new(@new_resource.name)
  @current_resource.name(@new_resource.name)

  @current_resource.exists = ::File.exist?(php_fpm_pool_file)
end