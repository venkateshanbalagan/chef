#
# Cookbook Name:: c2b2_website
# Recipe:: installapache
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'apache2::default'
include_recipe 'c2b2_website::startapache'
