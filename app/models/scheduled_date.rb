class ScheduledDate < ApplicationRecord
    belongs_to :dj, required: false

    def self.next
      where('date >= ?', Date.today).order('date')[0]
    end
  
    def self.second
      where('date >= ?', Date.today).order('date')[1]
    end
  
    def self.third
      where('date >= ?', Date.today).order('date')[2]
    end
end
