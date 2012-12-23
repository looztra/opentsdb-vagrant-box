opentsdb-vagrant-box
====================

## Introduction

Work In Progress: [Vagrant](http://vagrantup.com/) box to easily get [OpenTSDB](http://opentsdb.net/ "OpenTSDB") up and running through Vagrant (with a [Chef](http://wiki.opscode.com/display/chef/Home) provisionning)

Done so far:
* installs  *HBase* as listed at [OpenTSDB/Setup HBase](http://opentsdb.net/setup-hbase.html) (recipe **opentsdb::install**)
* starts HBase if needed (recipe **opentsdb::install**)
* installs OpenTSDB from source (recipe **opentsdb::install**)
* creates OpenTSDB hbase tables (only if needed) (recipe **opentsdb::install**)
* installs tcollector (dedicated recipe opentsdb::tcollector) (recipe **opentsdb::tcollector**)
* starts a TSD process (recipe **opentsdb::opentsdb**)
* starts sample metrics gathering (recipe **opentsdb::opentsdb**)

## Requirements

* [Vagrant](http://vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)


## TIP

* The *Vagrant file* suggests to use a **centos** box but it *may* work with other linux distributions.
* The *Vagrant file* suggests an url for a centos box if you don't have any base box registred under the name *centos63*, but you should be able to use any *centos* box (see available boxes at [Vagrantbox.es](http://www.vagrantbox.es/))

## Usage

* Install [Vagrant](http://vagrantup.com/)
* Install [VirtualBox](https://www.virtualbox.org/)
* `git clone https://github.com/looztra/opentsdb-vagrant-box.git`
* `cd opentsdb-vagrant-box`
* `vagrant up`
* wait several minutes the first time (hbase downloading, opentsdb building, ...)
	* if provisionning fails, you may need to adjust according to your configuration and restart it using `vagrant provision`
* when your VM is up and provisionning is done you should be able to access the OpenTSDB UI at http://localhost:4242 (check your iptables and firewall settings if needed)

## Disclaimer

The Chef recipes provided are not relevant for a production usage ( _HBase_ installation does not use HDFS and does not run on a cluster for instance). This VM can be used to give a try to **OpenTSDB** or to developp something in the OpenTSDB ecosystem (like a new Dashboard UI or a [Metrics](http://metrics.codahale.com/) connector for instance :]).


## License and Author

Author:: Christophe Furmaniak

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.