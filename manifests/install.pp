#
# == Class: cupsd::install
#
# Install cupsd
#
class cupsd::install {

    package { 'cups':
        name => 'cups',
        ensure => installed,
    }
}
