#
# Cookbook Name:: opentsdb
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

hbase_home = "#{node['opentsdb']['hbase_installdir']}/hbase"

["nc","htop","sysstat","gnuplot","git"].each do |pkg|
	package pkg
end

service "iptables" do
	action [:disable, :stop]
end

directory node['opentsdb']['hbase_rootdir'] do
	action :create
end

directory node['opentsdb']['tsd_tmpdir'] do
	action :create
end


directory node['opentsdb']['tgz_rootdir'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

remote_file "#{node['opentsdb']['tgz_rootdir']}/hbase-#{node['opentsdb']['hbase_version']}.tar.gz" do
  source "http://www.apache.org/dist/hbase/hbase-#{node['opentsdb']['hbase_version']}/hbase-#{node['opentsdb']['hbase_version']}.tar.gz"
  action :create_if_missing
end

execute "tar" do
	cwd "#{node['opentsdb']['hbase_installdir']}"
	command "tar xzf #{node['opentsdb']['tgz_rootdir']}/hbase-#{node['opentsdb']['hbase_version']}.tar.gz"
	creates "#{node['opentsdb']['hbase_installdir']}/hbase-#{node['opentsdb']['hbase_version']}"
end

link "#{hbase_home}" do
  to "#{node['opentsdb']['hbase_installdir']}/hbase-#{node['opentsdb']['hbase_version']}"
end

template "#{hbase_home}/conf/hbase-site.xml" do
	source "hbase-conf.erb"
	mode "0644"
end

file "/etc/profile.d/hbase-opentsdb.sh" do
  content <<-EOS
    export HBASE_HOME=#{hbase_home}
  EOS
  mode 0755
end

execute "start hbase if needed" do
	command "env HBASE_HOME=#{node['opentsdb']['hbase_installdir']}/hbase #{node['opentsdb']['hbase_installdir']}/hbase/bin/start-hbase.sh" 
	not_if "ps auxwww | grep 'org.apache.hadoop.hbase.master.HMaster start' | grep -v grep"
end

if node['opentsdb']['build_from_src']
	log 'Building OpentTSDB from source'
	execute "git clone opentsdb" do
		cwd "#{node['opentsdb']['opentsdb_installdir']}"
		command "git clone #{node['opentsdb']['opentsdb_repo']}"
		creates "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"
	end	
	execute "build opentsdb" do
		cwd "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"
		command "./build.sh"
		not_if "test -f #{node['opentsdb']['opentsdb_installdir']}/opentsdb/build/tsdb-*.jar"
	end
else
	log 'Skipping the build of OpentTSDB from source'
end


log 'Creating OpenTSDB HBase tables if needed'
execute "create OpenTSDB hbase tables" do
	cwd "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"
	command "env COMPRESSION=none HBASE_HOME=#{node['opentsdb']['hbase_installdir']}/hbase ./src/create_table.sh"
	only_if "ps auxwww | grep 'org.apache.hadoop.hbase.master.HMaster start' | grep -v grep"
	not_if "test -d #{node['opentsdb']['hbase_rootdir']}/hbase-root/hbase/tsdb && test -d #{node['opentsdb']['hbase_rootdir']}/hbase-root/hbase/tsdb-uid"
end




