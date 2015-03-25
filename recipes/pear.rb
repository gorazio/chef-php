# update the main channels
php_pear_channel 'pear.php.net' do
  action :update
end

php_pear_channel 'pecl.php.net' do
  action :update
end

node['php']['pecl-packages'].each do |pkg|
  php_pear pkg do
    package_name pkg
    action :install
  end
end
