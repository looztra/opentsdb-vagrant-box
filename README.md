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


