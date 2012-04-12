#
# Cookbook Name:: pgbouncer
# Recipe:: userlist
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
#
# Copyright 2011, Christoph Krybus
# Copyright 2012, Bryan W. Berry
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

                 
template node[:pgbouncer][:auth_file] do
  source "userlist.txt.erb"
  owner "root"
  group "postgres"
  mode "664"
  notifies :reload, resources(:service => "pgbouncer")
end

cookbook_file "/home/postgres/cron_userlist.sh" do
  owner "postgres"
  group "postgres"
  mode "0755"
  source "cron_userlist.sh"
  action :create_if_missing
end

cron "pgbouncer" do
  hour "*"
  minute "0"
  user "postgres"
  shell "/bin/bash"
  command "/home/postgres/cron_userlist.sh"
  mailto ""
end
