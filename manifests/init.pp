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
    include cupsd::install
}
