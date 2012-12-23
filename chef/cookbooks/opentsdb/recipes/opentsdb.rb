#
# Author:: Christophe Furmaniak
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
tsdb_home = "#{node['opentsdb']['opentsdb_installdir']}/opentsdb"

log "Starting opentsdb if not already running"
execute "starting tsdb" do 
	cwd "#{tsdb_home}"
	command "./build/tsdb tsd --port=#{node['opentsdb']['tsdb_port']} --staticroot=build/staticroot --cachedir=/tmp --auto-metric> /var/log/tsdb.log 2>&1 &"
	not_if "ps auxwww | grep 'net.opentsdb.tools.TSDMain' | grep -v grep"	
end


