class minecraft (
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $minecraft_dir = '/opt/minecraft',
){
  file {$minecraft_dir:
    ensure => directory,
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
