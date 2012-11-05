#
# Cookbook Name:: opentsdb
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["htop","sysstat","gnuplot","git"].each do |pkg|
	package pkg
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

link "#{node['opentsdb']['hbase_installdir']}/hbase" do
  to "#{node['opentsdb']['hbase_installdir']}/hbase-#{node['opentsdb']['hbase_version']}"
end

template "#{node['opentsdb']['hbase_installdir']}/hbase/conf/hbase-site.xml" do
	source "hbase-conf.erb"
	mode "0644"
end

file "/etc/profile.d/hbase-opentsdb.sh" do
  content <<-EOS
    export HBASE_HOME=#{node['opentsdb']['hbase_installdir']}/hbase
  EOS
  mode 0755
end

execute "git clone opentsdb" do
	cwd "#{node['opentsdb']['opentsdb_installdir']}"
	command "git clone git://github.com/OpenTSDB/opentsdb.git"
	not_if "test -d #{node['opentsdb']['opentsdb_installdir']}/opentsdb"
end

execute "build opentsdb" do
	cwd "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"
	command "./build.sh"
	not_if "test -f #{node['opentsdb']['opentsdb_installdir']}/opentsdb/build/tsdb-*.jar"
end
