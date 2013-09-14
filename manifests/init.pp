#
# == Class: cupsd
#
# Install and configure cupsd
#
# == Parameters
#
# None at the moment
#
# == Examples
#
# include cupsd
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license
# See file LICENSE for details
#
class cupsd {

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_cupsd', 'true') != 'false' {
    include cupsd::install
}
}
