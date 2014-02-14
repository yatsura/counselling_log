class ClientsGrid

  include Datagrid
  
  scope do
    Client
  end

  filter(:code, :string)
  filter(:zone, :string)
  filter(:organisation_name, :string)

  column(:code)
  column(:zone)
  column(:organisation_name)
  column(:gender)
  column(:session, :header => 'Sessions', :html => true) do |client|
    link_to "Sessions", client_counselling_sessions_path(client)
  end
  column(:edit, :header => 'Edit', :html => true) do |client|
    link_to "Edit", edit_client_path(client)
  end
end
