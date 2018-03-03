class my_module (
  $env_param = $settings::environment,
  $msg1_param = hiera('msg1_param'),
  $msg2_param = hiera('msg1_param1')
) {
  file { 'content file':
    path => '/tmp/content.txt',
    ensure => file,
    content => "${env_param}\n${msg1_param}\n${msg2_param}\n"
  }
  notify { "var1: $msg1_param, var2: $msg2_param":}
  $users = hiera('users')
  create_resources(user, $users, {})
}
