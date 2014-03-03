Given(/^that the (.+) "(.+)" page is accessed$/) do |action,obj| 
  case action
  when "new"
    visit public_send("#{action}_#{obj}_path")
  when "edit"
    @record = obj.classify.constantize.first
    visit public_send("#{action}_#{obj}_path", @record)
  when "index"
    visit public_send("#{obj.pluralize}_path")
  when "show"
    @record = obj.classify.constantize.first
    visit public_send("#{obj}_path", @record)
  end
end

Given(/^that the new "(.+)" page for the client is accessed$/) do |arg| 
  @client = Client.first
  visit public_send("new_client_#{arg}_path",@client)
end

Given(/^that the index counselling_session page is accessed$/) do
  visit counselling_sessions_path
end

Given(/^that the index client page is accessed$/) do
  visit clients_path
end

Given(/^that the index organisation page is accessed$/) do
  visit organisations_path
end
