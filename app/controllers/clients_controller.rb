class ClientsController < InheritedResources::Base
  actions :all, :except => [:destroy]
  belongs_to :organisation, :optional => true
  
  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    resource.visible = false
    resource.save!
    path = if parent
      organisation_clients_path(parent)
    else
      root_path 
    end
    redirect_to path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => resource_class.model_name.human)
  end
  
  protected
  def build_resource_params
    [params.fetch(:client, {}).permit(:code, :zone, :organisation_id, :notes, :gender)]
  end
end

