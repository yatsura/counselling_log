class CounsellingSessionsGrid

  include Datagrid
  
  scope do
    CounsellingSession
  end

  filter(:date, :string)
  filter(:length, :float)

  column(:date)
  column(:length)
  column(:notes)
  column(:edit, :header => 'Edit', :html => true) do |client|
    link_to "Edit", edit_client_path(client)
  end
end
