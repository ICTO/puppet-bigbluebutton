class bigbluebutton::config_ruby {

  apt::ppa {"ubuntu-on-rails":
    ensure => present,
    key    => '81C0BE11',
    ppa    => 'ppa';
  }

  package {"ruby1.9.2":
    ensure => installed;
  }

}