node 'puppet2' {
  hiera_include(classes)
  class { 'apache':
    mpm_module => 'prefork',
  }
  include apache::mod::php

  class { 'postgresql::server': }

  class { 'zabbix':
    zabbix_url    => 'zabbix.example.com',
  }
}
