# Puppet bigbluebutton

Install bigbluebutton 0.8 and configure various parameters needed for setting quality etc.

## Requirements

### Ubuntu 14.04 Server
* [Puppetlabs apt module]

## Usage

class {'bigbluebutton::params':
    salt => 'secureserversalt';
}

include bigbluebutton

See the bigbluebutton::params class for more parameters to use for configuration of the server.

[puppetlabs apt module]: https://github.com/puppetlabs/puppetlabs-apt
