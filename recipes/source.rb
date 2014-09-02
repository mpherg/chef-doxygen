include_recipe 'build-essential'
include_recipe 'yum'

# --- Remove existing doxygen package ---
package 'doxygen' do
  action :remove
end

remote_file "#{Chef::Config['file_cache_path']}/doxygen-#{node['doxygen']['version']}.tar.gz" do
  source    node['doxygen']['url']
  checksum  node['doxygen']['checksum']
  mode      '0644'
  not_if "test -f #{Chef::Config['file_cache_path']}/doxygen-#{node['doxygen']['version']}.tar.gz"
end

execute "Extracting and building Doxygen #{node['doxygen']['version']} from source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    (mkdir doxygen-#{node['doxygen']['version']} && tar zxf doxygen-#{node['doxygen']['version']}.tar.gz -C doxygen-#{node['doxygen']['version']} --strip-components 1)
    (cd doxygen-#{node['doxygen']['version']} && ./configure && make && make install)
  COMMAND
  creates '/usr/local/bin/doxygen'
  not_if "doxygen --version | grep #{node['doxygen']['version']}"
end
