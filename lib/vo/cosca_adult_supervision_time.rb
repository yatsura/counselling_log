module Vo
  class CoscaAdultSupervisionTime
    VALUES = {
      distant: ["distant", "glyphicon-ok-sign"],
      close:   ["close", "glyphicon-info-sign"],
      due:     ["due", "glyphicon-exclamation-sign"],
      over_due:["over-due", "glyphicon-remove-sign"]
    }
    def self.from_minutes(minutes)
      if minutes <= (6*60)
        new("Distant")
      elsif minutes <= (10*60)
        new("Close")
      elsif minutes <= (12*60)
        new("Due")
      else
        new("Over Due")
      end
    end

    def initialize(scale)
      @scale = scale
    end

    def to_s
      @scale
    end

    def html_class
      @scale.downcase.sub(' ', '-')
    end

    def glyphicon
      ""
    end

    def hash
      @scale.hash
    end

    def ==(other)
      @scale == other.instance_variable_get('@scale')
    end
  end
end
