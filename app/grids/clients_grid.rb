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
  column(:new_session, :header => 'New Session', :html => true) do |client|
    link_to "New Session", new_client_counselling_session_path(client),:class=> "btn btn-sm btn-primary", :role => "button"
  end
  column(:session, :header => 'Sessions', :html => true) do |client|
    link_to "Sessions", client_counselling_sessions_path(client),:class=> "btn btn-sm btn-primary", :role => "button"
  end
  column(:show, :header => 'Show', :html => true) do |client|
    link_to "Show", client_path(client),:class=> "btn btn-sm btn-primary", :button=> "button"
  end
end
