#
# == Class: cupsd::config
#
# Configure cupsd
#
class cupsd::config
(
    String $listen,
    String $server_allow,
    String $admin_allow,
    String $config_allow

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
