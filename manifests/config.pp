# == Class: bigbluebutton::config
#
# This class manages the configuration of bigbluebutton
#

class bigbluebutton::config {

  $help_url = $::bigbluebutton::help_url
  $enable_skin = $::bigbluebutton::enable_skin
  $theme_skin = $::bigbluebutton::theme_skin
  $translation_on = $::bigbluebutton::translation_on
  $translation_enabled = $::bigbluebutton::translation_enabled
  $private_chat = $::bigbluebutton::private_chat
  $allow_kick_user = $::bigbluebutton::allow_kick_user
  $phone_auto_join = $::bigbluebutton::phone_auto_join
  $phone_skip_check = $::bigbluebutton::phone_skip_check
  $video_quality = $::bigbluebutton::video_quality
  $presenter_share_only = $::bigbluebutton::presenter_share_only
  $resolutions = $::bigbluebutton::resolutions
  $cam_mode_fps = $::bigbluebutton::cam_mode_fps
  $cam_quality_bandwith = $::bigbluebutton::cam_quality_bandwith
  $cam_quality_picture = $::bigbluebutton::cam_quality_picture
  $enable_h264 = $::bigbluebutton::enable_h264

  exec {
    'sethostname':
      command => "/usr/bin/bbb-conf --setip ${::fqdn}",
      unless  => "/usr/bin/bbb-conf --check | /bin/grep -q ${::fqdn}";
    'setsalt':
      command => "/usr/bin/bbb-conf --salt ${bigbluebutton::salt}",
      notify  => Exec['restartbbb'],
      unless  => "/usr/bin/bbb-conf --salt | /bin/grep -q ${bigbluebutton::salt}";
    'enable-webrtc':
      command     => '/usr/bin/bbb-conf --enablewebrtc',
      refreshonly => true;
    'cleanbbb':
      command     => '/usr/bin/bbb-conf --clean',
      refreshonly => true;
    'restartbbb':
      command     => '/usr/bin/bbb-conf --restart',
      refreshonly => true;
    'startbbb':
      command     => '/usr/bin/bbb-conf --start',
      refreshonly => true;
    'stopbbb':
      command     => '/usr/bin/bbb-conf --stop',
      refreshonly => true;
  }

  file { '/var/www/bigbluebutton/client/conf/config.xml':
    ensure  => file,
    content => template('bigbluebutton/config.xml.erb'),
    notify  => Exec['restartbbb'],
    require => Package['bigbluebutton'];
  }
}
