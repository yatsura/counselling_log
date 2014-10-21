module So
  class ContactTimeQuery
    def total_adult_time
      total_time("Adult")
    end

    def total_child_time
      total_time("Child")
    end

    def total_time(zone)
      CounsellingSession.where(:zone => zone, :meetable_type => 'Client').sum('length')
    end

    def unsupervised_contact_time(zone)
      by_date = Proc.new { |a,b| a.date <=> b.date  }
      s = Supervisor.where(:zone => zone).collect do |supervisor|
        CounsellingSession.last_with supervisor
      end
      s = s.compact
      if s.empty?
        total_time(zone)
      else
        CounsellingSession.joins("INNER JOIN clients ON clients.id = meetable_id AND meetable_type = 'Client'").where("counselling_sessions.zone = ? AND date > ?",zone,s.sort(&by_date).last.date).sum('length')
      end
    end
  end
end
