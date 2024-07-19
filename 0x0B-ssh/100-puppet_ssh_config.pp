#!/usr/bin/env bash
# using puppet to make change in configuration file

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => @("EOF"),
    #ssh client configuration
    Host *
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
    | EOF
}
