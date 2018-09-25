require 'chef/log'
Chef::Log.level = :debug
script "mount_volume" do
  interpreter "bash"
  user "root"
  cwd "/home/deploy"
  environment node['deploy']['mc']['environment']
  code <<-EOH
    /srv/www/mc/current/bin/django check_algolia_index_schema
  EOH
end
