name "java"
description "Role applied to all java systems"
override_attributes(
  "java" => {
    "install_flavor" => "openjdk",
    "jdk_version" => "7"
  }
)
run_list(
  "recipe[java]"
)
