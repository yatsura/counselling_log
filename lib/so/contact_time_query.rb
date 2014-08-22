module So
  class ContactTimeQuery
    def total_adult_time
      total_time("Adult")
    end

    def total_child_time
      total_time("Child")
    end

    def total_time(zone)
      CounsellingSession.where(:zone => zone).sum('length')
    end

    def unsupervised_contact_time(zone)
      by_date = Proc.new { |a,b| a.date <=> b.date  }
      s = Supervisor.where(:zone => zone).collect do |supervisor|
        CounsellingSession.last_with supervisor
      end
      s = s.compact
      if s.empty?
        CounsellingSession.where(:zone => zone).sum('length')
      else
        CounsellingSession.where('zone = ? AND date > ?',"Adult",s.sort(&by_date).last.date).sum('length')
      end
    end
  end
end
