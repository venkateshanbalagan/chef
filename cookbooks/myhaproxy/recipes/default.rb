#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node.default['haproxy']['members']= [{
	"hostname" => 'ec2-13-58-28-191.us-east-2.compute.amazonaws.com',
	"ipaddress" => '13.58.28.191',
	"port" => 80,
	"ssl_port" => 80
	},{
	"hostname" => 'ec2-18-216-87-110.us-east-2.compute.amazonaws.com',
        "ipaddress" => '18.216.87.110',
        "port" => 80,
        "ssl_port" => 80
}]

bash 'instal' do
     command "setsebool -P haproxy_connect_any=1"
end

include_recipe 'haproxy::manual'
