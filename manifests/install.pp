#
# == Class: cupsd::install
#
# Install cupsd
#
class cupsd::install inherits cupsd::params {

    package { 'cups':
        name => $::cupsd::params::package_name,
        ensure => installed,
    }
}
