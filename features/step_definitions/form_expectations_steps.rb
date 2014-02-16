Then(/^a new (.+) is created$/) do |arg|
  arg.classify.constantize.count > 0
end
