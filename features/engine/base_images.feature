@slow
Feature: various base images
  As a rebuild user
  I want to be able to create new environments on top of various base images

  Background:
    Given non-existing environment test-env-base

  Scenario Outline: create environments on top of various base images
    When I run `rbld create --base <base image> test-env-base`
    Then the output should contain "Successfully created test-env-base:initial"
    And the exit status should be 0
    When I run `rbld run test-env-base -- set`
    Then the output should contain ">>> rebuild env test-env-base-initial"
    And the output should contain ">>> set"
    And the output should match /HOSTNAME='?test-env-base-initial'?/
    And the output should contain "<<< rebuild env test-env-base-initial"
    And the stderr should contain exactly ""
    And the exit status should be 0
    When I run `rbld run test-env-base -- exit 5`
    Then the exit status should be 5

    Examples:
      | base image                          |
      | fedora:20                           |
      | fedora:21                           |
      | fedora:22                           |
      | fedora:23                           |
      | fedora:24                           |
      | fedora:25                           |
      | fedora:26                      |
      | fedora:latest                       |
      | ubuntu:12.04                        |
      | ubuntu:12.04.5                      |
      | ubuntu:14.04                        |
      | ubuntu:14.04.4                      |
      | ubuntu:14.04.5                      |
      | ubuntu:16.04                        |
      | ubuntu:16.10                        |
      | ubuntu:17.04                        |
      | ubuntu:latest                       |
      | ubuntu:devel                        |
      | alpine:3.1                          |
      | alpine:3.2                          |
      | alpine:3.3                          |
      | alpine:3.4                          |
      | alpine:3.5                          |
      | alpine:latest                       |
      | alpine:edge                         |
      | opensuse:13.2                       |
      | opensuse:42.1                       |
      | opensuse:42.2                       |
      | opensuse:latest                     |
      | debian:7                            |
      | debian:7.11                         |
      | debian:8                            |
      | debian:8.7                          |
      | debian:9.0                          |
      | debian:9                            |
      | debian:latest                       |
      | debian:stable                       |
      | debian:testing                      |
      | debian:unstable                     |
      | debian:experimental                 |
      | centos:latest                       |
      | centos:7                            |
      | centos:6                            |
      | centos:7.3.1611                     |
      | centos:7.2.1511                     |
      | centos:7.1.1503                     |
      | centos:7.0.1406                     |
      | centos:6.9                          |
      | centos:6.8                          |
      | centos:6.7                          |
      | centos:6.6                          |
      | oraclelinux:latest                  |
      | oraclelinux:7.3                     |
      | oraclelinux:7.2                     |
      | oraclelinux:7.1                     |
      | oraclelinux:7.0                     |
      | oraclelinux:7                       |
      | oraclelinux:6.9                     |
      | oraclelinux:6.8                     |
      | oraclelinux:6.7                     |
      | oraclelinux:6.6                     |
      | oraclelinux:6                       |
      | oraclelinux:5.11                    |
      | oraclelinux:5                       |
      | mageia:latest                       |
      | mageia:5                            |
      | mageia:5.1                          |
