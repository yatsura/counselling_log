class CounsellingSessionsGrid

  include Datagrid
  
  scope do
    CounsellingSession
  end

  filter(:date, :string)
  filter(:length, :float)

  column(:date) do |cs|
    I18n.l cs.date, :scope => 'grid'
  end
  column(:length)
  column(:notes)
  column(:show, :header => 'Show', :html => true) do |cs|
    link_to "Show", counselling_session_path(cs)
  end
end
