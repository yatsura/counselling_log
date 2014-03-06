class SupervisorsController < InheritedResources::Base
  actions :all, :except => [:destroy]

  def index
    @grid = SupervisorsGrid.new(params[:supervisors_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    resource.visible = false
    resource.save!
    redirect_to supervisors_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => resource_class.model_name.human)
  end

  protected
  def build_resource_params
    [params.fetch(:supervisor, {}).permit(:name, :zone, :cost, :address, :contact_name, :email_address)]
  end
end
