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
# [*listen*]
#   The ip-address:port combination to listen for requests on. To listen on all 
#   interfaces use '*:port' where 'port' is the port number. For other options 
#   please refer to cupsd.conf man-page. Defaults to '127.0.0.1:631'.
#
# == Examples
#
#   include cupsd
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
    $manage = 'yes',
    $listen = '127.0.0.1:631'
)
{

if $manage == 'yes' {

    include cupsd::install

    class { 'cupsd::config':
        listen => $listen,
    }

    include cupsd::service
}
}
