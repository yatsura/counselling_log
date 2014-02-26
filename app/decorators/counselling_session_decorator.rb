class CounsellingSessionDecorator < Draper::Decorator
  delegate_all

  def client_control
    if model.new_record? && model.client_id.nil?
      h.select_tag :client, client_options_for_select    
    else
      h.text_field_tag :client, :html => {:readonly => true}
    end
  end

  def client_options_for_select
    h.options_for_select Client.all.map(&:code)
  end
end
