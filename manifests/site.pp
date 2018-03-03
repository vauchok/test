node 'puppet2' {
  include role::hiera('role_value')
}
