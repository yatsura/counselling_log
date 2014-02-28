# Turn this into a deligator
class ClientControlInput
  include Formtastic::Inputs::Base
  
  def to_html
    input_wrapping do
      label_html << client_control
    end
  end

  def client_control
    if object.new_record? && object.client_id.nil?
      builder.text_field(method, {})  
    end
  end
end
