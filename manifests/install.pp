class bigbluebutton::install {

  require bigbluebutton::params

  file {'/var/local/preseed':
    ensure => 'directory';
  }

  file {'/var/local/preseed/bigbluebutton.preseed':
    ensure  => file,
    source => 'puppet:///modules/bigbluebutton/bigbluebutton.preseed',
    require => File['/var/local/preseed'];
  }

  package { 'ffmpeg':
    ensure => installed
  }

  package { 'bigbluebutton':
    ensure       => installed,
    responsefile => '/var/local/preseed/bigbluebutton.preseed',
    require      => File['/var/local/preseed/bigbluebutton.preseed'];
  }

  package { 'bbb-demo':
    ensure => $bigbluebutton::params::install_bbb_demo
  }

  package { 'bbb-check':
    ensure => $bigbluebutton::params::install_bbb_check
  }
}
