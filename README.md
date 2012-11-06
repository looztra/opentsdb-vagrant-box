opentsdb-vagrant-box
====================

Work In Progress: [Vagrant](http://vagrantup.com/) box to easily get [OpenTSDB](http://opentsdb.net/ "OpenTSDB") up and running through Vagrant (with a [Chef](http://wiki.opscode.com/display/chef/Home) provisionning)

Done so far:
* installation of HBase as listed at [OpenTSDB/Setup HBase](http://opentsdb.net/setup-hbase.html)
* installation of OpenTSDB from source.
* create OpenTSDB hbase tables (only if needed)
* install tcollector

Todo:
* automatically start HBase (or not?)
* start a TSD process
* start sample metrics gathering (m)