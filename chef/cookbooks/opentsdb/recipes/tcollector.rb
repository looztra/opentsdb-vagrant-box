log 'Installing tcollector if needed'
execute "git clone tcollector" do
	cwd "#{node['opentsdb']['tcollector_installdir']}"
	command "git clone #{node['opentsdb']['tcollector_repo']}"
	creates "#{node['opentsdb']['tcollector_installdir']}/tcollector"
end
