#
# Cookbook Name:: c2b2_website
# Recipe:: startapache
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

execute 'start_apache' do
  command'httpd -k start'
  user 'root'
  group 'root'
  action :run
end
