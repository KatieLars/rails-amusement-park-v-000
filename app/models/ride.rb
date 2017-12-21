class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def is_tall_enough?
    user.height >= attraction.min_height
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def not_tall_enough(attraction)
    "You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets(attraction)
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_enough_tix_and_too_short(attraction)
    [not_enough_tickets(attraction), not_tall_enough(attraction)].reject(&:empty?).join(' ')
  end

  def take_ride
    if enough_tickets? && is_tall_enough?
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.tickets -= attraction.tickets
      user.save
      "Thanks for riding the #{attraction.name}!"
    elsif enough_tickets? && !is_tall_enough?
      "Sorry. #{not_tall_enough(attraction)}"

    elsif !enough_tickets? && is_tall_enough?
      not_enough_tickets(attraction)

    else
      not_enough_tix_and_too_short(attraction)

    end
  end


end
