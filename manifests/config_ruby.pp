class bigbluebutton::config_ruby {

  package {
    'ruby1.9.2':
      ensure => installed;
    'rubygems1.9.2':
      ensure => installed;
    'ruby1.9.2-dev':
      ensure => installed;
    'libopenssl-ruby1.9.2':
      ensure => installed;
  }

  if !defined(Package['make']) {
    package { 'make':
      ensure => installed;
    }
  }

  bigbluebutton::config_ruby::update_alternatives{
    'ruby1.9.2':
      path => '/usr/bin/ruby1.9.2';
    'gem1.9.2':
      path => '/usr/bin/gem1.9.2';
  }

}

define bigbluebutton::config_ruby::update_alternatives ($path)
{
  exec {
    "update-alternatives ${name}":
      command => "update-alternatives --set $name $path",
      unless  => "test /etc/alternatives/$name -ef $path";
  }
}
