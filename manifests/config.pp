#
# == Class: cupsd::config
#
# Configure cupsd
#
class cupsd::config
(
    $listen,
    $server_allow,
    $admin_allow,
    $config_allow

) inherits cupsd::params
{

    file { 'cupsd-cupsd.conf':
        ensure  => present,
        name    => $::cupsd::params::cupsd_conf,
        content => template('cupsd/cupsd.conf.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0644',
        require => Class['cupsd::install'],
        notify  => Class['cupsd::service'],
    }
}
