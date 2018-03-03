class my_module (
  $env_param = $settings::environment,
  $msg1_param = "msg1",
  $msg2_param = "msg2"
) {
  file { 'content file':
    path => '/tmp/content.txt',
    ensure => file,
    content => "${env_param}\n${msg1_param}\n${msg2_param}\n"
  }
  $users = hiera('users')
  create_resources(user, $users, {})
}
