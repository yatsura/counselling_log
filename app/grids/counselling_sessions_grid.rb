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
  column(:show, :header => 'Show', :html => true) do |cs|
    link_to "Show", counselling_session_path(cs)
  end
end
