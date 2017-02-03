# Puppet module: ntp
-----------
This module was designed for Pupper version 4.

### Setup
```
class { 'ntp': }
```

### Usage
```
class { 'ntp':
  server => [ 'tock.stdtime.gov.tw', 'watch.stdtime.gov.tw', 'time.stdtime.gov.tw'],
}
```
