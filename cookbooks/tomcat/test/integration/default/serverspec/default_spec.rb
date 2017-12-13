#
# Cookbook Name:: tomcat
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

#require 'chefspec'

describe command('curl http://localhost:8080') do
  its('stdout') { should match /Tomcat/ }   
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end
