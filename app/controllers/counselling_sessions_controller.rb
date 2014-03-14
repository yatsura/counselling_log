class CounsellingSessionsController < InheritedResources::Base
  belongs_to :client,:organisation,:supervisor,:polymorphic => true, :optional => true
  
  helper_method :clients

  def index
    @grid = CounsellingSessionsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
    index!
  end

  def clients
    client_lookup = Proc.new { |n| [n.code,n.id] }
    if parent.is_a? Organisation
      parent.meetable.map(&client_lookup)
    elsif parent.is_a? Supervisor
      [Client.where(:code => "Self").map(&client_lookup)]
    elsif parent.is_a? Client
      resource.meetable = parent
      [client_lookup.call(parent)]
    else
      Client.all.map(&client_lookup)
    end
  end
  
  protected
  def build_resource_params
    [params.fetch(:counselling_session, {}).permit(:meetable_id, :zone, :date, :length, :notes, :billed)]
  end
end

