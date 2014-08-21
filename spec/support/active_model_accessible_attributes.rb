module ActiveModelAccessibleAttributes
  def accessible_attributes(model)
    model.attributes.reject { |k,v| model.class.accessible_attributes.deny? k }
  end
end
