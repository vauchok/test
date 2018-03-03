node 'puppet2' {
  $role = hiera('role_value')
  include role::role
}
