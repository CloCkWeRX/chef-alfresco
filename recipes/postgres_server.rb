
postgresql_connection_info = {:host => "localhost",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

postgresql_database_user node['alfresco']['db']['user'] do
  connection postgresql_connection_info
  password node['alfresco']['db']['password']
  action :create
end

postgresql_database "alfresco" do
  connection postgresql_connection_info
  owner node['alfresco']['db']['user']
  action :create
end
