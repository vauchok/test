class profile::minecraft {
  class {'minecraft':
  minecraft_dir => '/srv/minecraft',
  }
  class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
  }
}
