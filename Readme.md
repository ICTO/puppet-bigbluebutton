# Puppet bigbluebutton

Install bigbluebutton 0.90 and configure various parameters needed for setting quality etc.

## Requirements

### Ubuntu 14.04 Server
* [Puppetlabs apt module]

## Usage

class {'bigbluebutton':
    salt => 'secureserversalt';
}

See the bigbluebutton class for more parameters to use for configuration of the server.

[puppetlabs apt module]: https://github.com/puppetlabs/puppetlabs-apt
