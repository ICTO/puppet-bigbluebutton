class bigbluebutton::repos {

    if $::bigbluebutton::manage_repos {
        apt::ppa {'ppa:libreoffice/libreoffice-4-3':
            ensure => present
        }

        apt::ppa {'ppa:mc3man/trusty-media':
            ensure => present
        }

        apt::key {'bigbluebutton':
            key => '328BD16D',
            key_source => 'http://ubuntu.bigbluebutton.org/bigbluebutton.asc';
        }

        apt::source {'bigbluebutton':
            ensure  => present,
            location => 'http://ubuntu.bigbluebutton.org/trusty-090/',
            release => "bigbluebutton-$::lsbdistcodename",
            repos => 'main',
            include_src => false
        }

        apt::source {'multiverse':
            ensure  => present,
            location => 'http://us.archive.ubuntu.com/ubuntu',
            release => "$::lsbdistcodename",
            repos => 'multiverse'
        }
    }
}
