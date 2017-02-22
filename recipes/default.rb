#
# Cookbook Name:: nrpe_liatrio
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'nrpe::default'

nrpe_check 'check_load' do
  command "#{node['nrpe']['plugin_dir']}/check_load"
  warning_condition '10'
  critical_condition '15'
  action :add
end

nrpe_check 'check_disk' do
  command "#{node['nrpe']['plugin_dir']}/check_load"
  warning_condition '10'
  critical_condition '5'
  action :add
end
