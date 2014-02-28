class CounsellingSessionsController < InheritedResources::Base
  belongs_to :client,:organisation,:supervisor,:polymorphic => true, :optional => true
  
  helper_method :clients

  def clients
    client_lookup = Proc.new { |n| [n.code,n.id] }
    if parent.is_a? Organisation
      parent.clients.map(&client_lookup)
    elsif parent.is_a? Supervisor
      [Client.where(:code => "Self").map(&client_lookup)]
    elsif parent.is_a? Client
      resource.client = parent
      [client_lookup.call(parent)]
    else
      Client.all.map(&client_lookup)
    end
  end
  
  protected
  def permitted_params
    # TODO investigate strong params
    {:counselling_sessions_params => params.fetch(:counselling_sessions_params, {}).permit!}
  end
end

