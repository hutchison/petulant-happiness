exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

Exec['apt-update'] -> Package <| |>

package { ['vim', 'git', 'postgresql']:
    ensure => 'present',
}

package { 'httpd':
    name => 'apache2',
    ensure => 'present',
}

service { 'httpd':
    name => 'apache2',
    ensure => 'running',
    enable => 'true',
}

Package['httpd'] -> Service['httpd']

service { 'postgresql':
    ensure => 'running',
    enable => 'true',
}

Package['postgresql'] -> Service['postgresql']
