# == Class: freeradius::modules::ldap
#
# Set up the LDAP module configuration.
#
# == Authors
#
# * Trevor Vaughan <tvaughan@onyxpoint.com>
#
class freeradius::modules::ldap {
  include 'freeradius'

  if $::operatingsystem in ['RedHat', 'CentOS'] {
    if defined('$::radius_version') and ($::radius_version != 'unknown') {
      if (versioncmp($::radius_version, '3') >= 0) {
        include '::freeradius::v3::modules::ldap'
      }
      else {
        include '::freeradius::v2::modules::ldap'
      }
    }
    else {
      warning('FreeRADIUS does not yet appear to be installed. Please install FreeRADIUS and then continue.')
    }
  }
  else {
    warning("${::operatingsystem} not yet supported. Current options are RedHat and CentOS")
  }
}
