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
        name => $::cupsd::params::cupsd_conf,
        ensure => present,
        content => template('cupsd/cupsd.conf.erb'),
        owner => root,
        group => $::os::params::admingroup,
        mode => 644,
        require => Class['cupsd::install'],
        notify => Class['cupsd::service'],
    }
}
