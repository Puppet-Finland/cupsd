#
# == Class: cupsd
#
# Install and configure cupsd
#
# == Parameters
#
# [*manage*]
#   Whether to manage cupsd using this module or not. Valid values 'yes' 
#   (default) and 'no'.
# [*manage_packetfilter*]
#   Manage packet filtering rules. Valid values are true and false (default).
# [*listen*]
#   The ip-address:port combination to listen for requests on. To listen on all 
#   interfaces use '*:port' where 'port' is the port number. For other options 
#   please refer to cupsd.conf man-page. Defaults to '127.0.0.1:631'.
# [*server_allow*]
#   Access control rule for the webserver itself. For example 'all', 'none', 
#   '*.domain.com', '@IF(br0)' or '@LOCAL'. For details see cupsd.conf man-page. 
#   Defaults to '@LOCAL'.
# [*admin_allow*]
#   Access control rule for the webserver admin pages. Defaults to 'localhost'.
# [*config_allow*]
#   Access control rule for the configuration files. Defaults to 'localhost'.
# [*allow_address_ipv4*]
#   IPv4 address/subnet from which to allow connections to cups through the firewall.
#   Defaults to '127.0.0.1'.
# [*allow_address_ipv6*]
#   IPv6 address/subnet from which to allow connections to cups through the firewall.
#   Defaults to '::1'.
#
# == Examples
#
#   include ::cupsd
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class cupsd
(
    Boolean $manage = true,
    Boolean $manage_packetfilter = false,
            $listen = '127.0.0.1:631',
            $server_allow = '@LOCAL',
            $admin_allow = 'localhost',
            $config_allow = 'localhost',
            $allow_address_ipv4 = '127.0.0.1',
            $allow_address_ipv6 = '::1'
)
{

if $manage {

    include ::cupsd::install

    class { '::cupsd::config':
        listen       => $listen,
        server_allow => $server_allow,
        admin_allow  => $admin_allow,
        config_allow => $config_allow,
    }
    include ::cupsd::service

    if $manage_packetfilter {
        class { '::cupsd::packetfilter':
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
        }
    }

}
}
