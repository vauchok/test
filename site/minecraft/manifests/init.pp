class minecraft (
  $minecraft_url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $minecraft_dir = '/opt/minecraft',
  $epel7_url = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm',
  $epel7_dir = '/tmp/epel-release-latest-7.noarch.rpm',
){
  file {$epel7_dir:
    ensure => file,
    source => $epel7_url,
  }
  package {'epel-release-7':
    provider => 'rpm',
    install_options => ['-ivh'],
    ensure => 'present',
    source => $epel7_dir,
    before => Package['java'],
  }
  file {$minecraft_dir:
    ensure => directory,
  }
  package {'java':
    ensure => present,
  }
  file {"${minecraft_dir}/minecraft_server.1.12.2.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  file {"${minecraft_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
    minecraft_dir => $minecraft_dir,
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${minecraft_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
