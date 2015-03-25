package "php5-geoip"

directory '/opt/cronscript'

cookbook_file "updategeoip.sh" do
  path "/opt/cronscript/updategeoip.sh"
  owner "root"
  group "root"
  mode "0755"
end

cron_d "updategeoip" do
  predefined_value '@weekly'
  command '/opt/cronscript/updategeoip.sh'
end