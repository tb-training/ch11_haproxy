#
# Cookbook:: haproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'haproxy'

allwebservers = search('node', 'recipes:apache\:\:default')

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  variables(
    :webservers => allwebservers
  )
 notifies :restart, 'service[haproxy]'
end

service 'haproxy' do
 action [:start, :enable] 
end