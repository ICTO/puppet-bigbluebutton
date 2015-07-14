class bigbluebutton::install {

  $preseed_file = '/var/cache/debconf/bigbluebutton.preseed'

  file {
    $preseed_file:
    ensure => present,
    source => 'puppet:///modules/bigbluebutton/bigbluebutton.preseed',
  }

  package { 'ffmpeg':
    ensure => installed
  }

  package { 'bigbluebutton':
    ensure       => installed,
    responsefile => $preseed_file,
    require      => File[$preseed_file];
  }

  package { 'bbb-demo':
    ensure => $::bigbluebutton::install_bbb_demo
  }

  package { 'bbb-check':
    ensure => $::bigbluebutton::install_bbb_check
  }
}
