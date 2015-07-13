# == Class: bigbluebutton
#
# Install and configure bigbluebutton meeting server
#
# === Parameters:
#
# Parameters are set in bigbluebutton::params, documentation
# for parameters is found there.
#
# === Requires:
#
# - Ubuntu 10.04 LTS server
# - puppet apt module: https://github.com/camptocamp/puppet-apt
#
# === Sample Usage:
#
# -Install and configure default bigbluebutton :
#
# include bigbluebutton
#
# - Install bigbluebutton with custom configuration
#
#  class bigbluebutton::params {
#   salt        => 'uielre5654cssd',
#   resolutions => '320x480, 480x640';
#  }
#
#  include bigbluebutton
#

class bigbluebutton (
    $salt                 = $bigbluebutton::params::salt,
    $help_url             = $bigbluebutton::params::help_url,
    $enable_skin          = $bigbluebutton::params::enable_skin,
    $theme_skin           = $bigbluebutton::params::theme_skin,
    $translation_on       = $bigbluebutton::params::translation_on,
    $translation_enabled  = $bigbluebutton::params::translation_enabled,
    $private_chat         = $bigbluebutton::params::private_chat,
    $allow_kick_user      = $bigbluebutton::params::allow_kick_user,
    $phone_auto_join      = $bigbluebutton::params::phone_auto_join,
    $phone_skip_check     = $bigbluebutton::params::phone_skip_check,
    $video_quality        = $bigbluebutton::params::video_quality,
    $presenter_share_only = $bigbluebutton::params::presenter_share_only,
    $resolutions          = $bigbluebutton::params::resolutions,
    $cam_mode_fps         = $bigbluebutton::params::cam_mode_fps,
    $cam_quality_bandwith = $bigbluebutton::params::cam_quality_bandwith,
    $cam_quality_picture  = $bigbluebutton::params::cam_quality_picture,
    $enable_h264          = $bigbluebutton::params::enable_h264,
    $install_bbb_demo     = $bigbluebutton::params::install_bbb_demo,
    $install_bbb_check    = $bigbluebutton::params::install_bbb_check,
    $manage_repos         = $bigbluebutton::params::manage_repos
) inherits bigbluebutton::params {

  class{'bigbluebutton::repos':;} ~>
  class{'bigbluebutton::install':;} ~>
  class{'bigbluebutton::config':;}
}
