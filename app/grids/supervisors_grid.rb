class SupervisorsGrid

  include Datagrid
  
  scope do
    Supervisor
  end

  filter(:name, :string)
  filter(:zone, :string)

  column(:name)
  column(:zone)
  column(:contact_name)
  column(:email_address)
  column(:new_session, :header => 'New Session', :html => true) do |supervisor|
    link_to "New Session", new_supervisor_counselling_session_path(supervisor)
  end
  column(:session, :header => 'Sessions', :html => true) do |supervisor|
    link_to "Sessions", supervisor_counselling_sessions_path(supervisor)
  end
  column(:show, :header => 'Show', :html => true) do |supervisor|
    link_to "Show", supervisor_path(supervisor)
  end
end
