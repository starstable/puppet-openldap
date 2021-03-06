# See README.md for details.
define openldap::server::module(
  $ensure     = undef,
  $modulepath = $::openldap::server::modulepath,
) {

  if ! defined(Class['openldap::server']) {
    fail 'class ::openldap::server has not been evaluated'
  }

  if $::openldap::server::provider == 'augeas' {
    Class['openldap::server::install'] ->
    Openldap::Server::Module[$title] ~>
    Class['openldap::server::service']
  } else {
    Class['openldap::server::service'] ->
    Openldap::Server::Module[$title] ->
    Class['openldap::server']
  }

  openldap_module { $title:
    ensure     => $ensure,
    modulepath => $modulepath,
    provider   => $::openldap::server::provider,
  }
}
