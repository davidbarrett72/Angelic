class DateUtil

  # current week returns a range from
  # this sunday, back 7 days
  # Week ending this sunday
  def self.current_week

    to = DateTime.now.midnight.to_time
    until to.monday?
      to += 1.day
    end

    range = (to - 7.days)..to
  end


end
