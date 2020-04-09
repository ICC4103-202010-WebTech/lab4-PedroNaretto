class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  before_create :update_stats_increase
  before_destroy :update_stats_decrease

  private
    def update_stats_increase
      es = self.ticket_type.event.event_stat
      es.tickets_sold +=1
      es.attendance +=1
      es.save!
    end
    def update_stats_decrease
      es = self.ticket_type.event.event_stat
      es.tickets_sold -=1
      es.attendance -=1
      es.save!
    end
end
