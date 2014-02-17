Given(/^that the (.+) (.+) page is accessed$/) do |action,obj| 
  case action
  when "new"
    visit public_send("#{action}_#{obj}_path")
  when "edit"
    @record = obj.classify.constantize.first
    visit public_send("#{action}_#{obj}_path", @record)
  when "index"
    visit public_send("#{obj.pluralize}_path")
  end
end
