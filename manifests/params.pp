#
# == Class: cupsd::params
#
# Defines some variables based on the operating system
#
class cupsd::params {

    include ::os::params

    case $::osfamily {
        'Debian': {
            $package_name = 'cups'
            $cupsd_conf = '/etc/cups/cupsd.conf'
            $service_name = 'cups'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
