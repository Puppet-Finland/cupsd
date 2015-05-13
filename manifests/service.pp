# == Class: cupsd::service
#
# This class configures the cupsd service
#
class cupsd::service inherits cupsd::params {

    service { 'cupsd':
        name    => $::cupsd::params::service_name,
        enable  => true,
        require => Class['cupsd::install'],
    }
}
