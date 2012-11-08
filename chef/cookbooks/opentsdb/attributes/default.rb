default['opentsdb']['ifcfg'] = 'lo'
default['opentsdb']['user'] = 'root'
default['opentsdb']['tgz_rootdir'] = '/tmp/tgz'
# HBase stuff
default['opentsdb']['hbase_rootdir'] = '/tmp/tsdhbase'
default['opentsdb']['hbase_installdir'] = '/usr/local'
default['opentsdb']['hbase_version'] = '0.92.1'
default['opentsdb']['hbase_start_if_needed'] = true
# OpenTSDB stuff
default['opentsdb']['opentsdb_installdir'] = '/usr/local'
default['opentsdb']['tsd_tmpdir']='/tmp/tsd'
default['opentsdb']['build_from_src'] = true
default['opentsdb']['create_opentsdb_tables'] = true
# tcollector stuff
default['opentsdb']['tcollector_repo'] = 'https://github.com/OpenTSDB/tcollector.git'
default['opentsdb']['tcollector_installdir'] = '/usr/local'
default['opentsdb']['tcollector_installswitch'] = true

