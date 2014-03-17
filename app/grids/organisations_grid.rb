class OrganisationsGrid
  include Datagrid

  scope do
    Organisation
  end
  filter(:name, :string)

  column(:name)
  column(:billable)
  column(:address)
  column(:telephone)
  column(:contact_name)
  column(:contact_email) # Change to email link
  column(:clients, :header => 'Clients', :html => true) do |organisation|
    link_to "Clients", organisation_clients_path(organisation)
  end
  
  column(:session, :header => 'Sessions', :html => true) do |organisation|
    link_to "Sessions", organisation_counselling_sessions_path(organisation)
  end
  column(:show, :header => 'Show', :html => true) do |organisation|
    link_to "Show", organisation_path(organisation)
  end
end
