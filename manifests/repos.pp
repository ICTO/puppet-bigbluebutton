class bigbluebutton::repos {

    if $::bigbluebutton::manage_repos {
        apt::ppa {'ppa:libreoffice/libreoffice-4-4':
            ensure => present
        }

        apt::ppa {'ppa:mc3man/trusty-media':
            ensure => present
        }

        apt::key {'bigbluebutton':
            id => '328BD16D',
            source => 'http://ubuntu.bigbluebutton.org/bigbluebutton.asc',
            notify => exec['apt_update']
        }

        apt::source {'bigbluebutton':
            ensure  => present,
            location => 'http://ubuntu.bigbluebutton.org/trusty-090/',
            release => "bigbluebutton-$::lsbdistcodename",
            repos => 'main',
            include => {
                'src' => false
            }
        }

        apt::source {'multiverse':
            ensure  => present,
            location => 'http://us.archive.ubuntu.com/ubuntu',
            release => "$::lsbdistcodename",
            repos => 'multiverse'
        }
    }
}
