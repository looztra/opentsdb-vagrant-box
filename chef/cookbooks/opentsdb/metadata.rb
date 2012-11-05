maintainer       "Christophe Furmaniak"
maintainer_email "christophe.furmaniak@gmail.com"
license          "All rights reserved"
description      "Installs/Configures opentsdb"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
depends "yum"
recipe "opentsdb", "Installs HBase and OpenTSDB from source"
%w{ centos redhat scientific fedora }.each do |os|
  supports os
end

