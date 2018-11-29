#
# == Class: cupsd::packetfilter
#
# Manage packet filtering rules for cups
#
class cupsd::packetfilter
(
    String $allow_address_ipv4,
    String $allow_address_ipv6
)
{
    $firewall_defaults = {
        ensure   => 'present',
        chain    => 'INPUT',
        proto    => 'tcp',
        dport    => 631,
        action   => 'accept',
        tag      => 'default',
    }

    @firewall { '017 ipv4 accept cups':
        provider => 'iptables',
        source   => $allow_address_ipv4,
        *        => $firewall_defaults,
    }

    @firewall { '017 ipv6 accept cups':
        provider => 'ip6tables',
        source   => $allow_address_ipv6,
        *        => $firewall_defaults,
    }
}
