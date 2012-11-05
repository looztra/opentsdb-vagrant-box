name "base"
description "Role applied to all systems"
default_attributes(
  "ntp" => {
    "servers" => ["time0.int.example.org", "time1.int.example.org"],
    "packages" => ["ntp", "ntpdate"]
  }
)
run_list(
  "recipe[yum]","recipe[yum::epel]","recipe[ntp]"
)