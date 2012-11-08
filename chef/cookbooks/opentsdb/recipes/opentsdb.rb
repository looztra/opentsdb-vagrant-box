tsdb_home = "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"

log "Starting opentsdb if not already running"
execute "starting tsdb" do 
	cwd "#{tsdb_home}"
	command "./build/tsdb tsd --port=#{node['opentsdb']['tsdb_port']} --staticroot=build/staticroot --cachedir=/tmp --auto-metric> /var/log/tsdb.log 2>&1 &"
	not_if "ps auxwww | grep 'net.opentsdb.tools.TSDMain' | grep -v grep"	
end


