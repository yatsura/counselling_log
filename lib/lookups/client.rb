module Lookups
  class Client
    def self.by_parent(parent)
      client_lookup = Proc.new { |n| [n.code,n.id] }
      if parent.is_a? Organisation
        parent.clients.map(&client_lookup)
      elsif parent.is_a? Supervisor
        ::Client.where(:code => 'SELF').map(&client_lookup)
      elsif parent.is_a? ::Client
        [parent].map(&client_lookup)
      else
        ::Client.all.map(&client_lookup)
      end
    end
  end
end
