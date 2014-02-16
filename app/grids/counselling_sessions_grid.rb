class CounsellingSessionsGrid

  include Datagrid
  
  scope do
    CounsellingSession
  end

  filter(:date, :string)
  filter(:duration, :float)

  column(:date)
  column(:duration)
  column(:notes)
  column(:gender)
  column(:edit, :header => 'Edit', :html => true) do |client|
    link_to "Edit", edit_client_path(client)
  end
end
