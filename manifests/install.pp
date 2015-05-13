#
# == Class: cupsd::install
#
# Install cupsd
#
class cupsd::install inherits cupsd::params {

    package { 'cups':
        ensure => installed,
        name   => $::cupsd::params::package_name,
    }
}
