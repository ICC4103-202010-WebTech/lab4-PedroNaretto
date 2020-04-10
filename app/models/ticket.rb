class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  before_create :update_stats_increase
  before_destroy :update_stats_decrease
  before_validation :maximum

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
    def maximum
      ev = self.ticket_type.event.event_venue
      es = self.ticket_type.event.event_stat
      if es.tickets_sold >= ev.capacity
        puts("Error: Tickets are sold out")
        errors.add(:base, "Tickets are sold out")
        throw(:abort)
      end
    end
end
