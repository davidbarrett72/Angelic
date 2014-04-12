module ChoreHelper

  def same_date(a, b)
    a.year == b.year && a.month == b.month && a.day == b.day
  end

end
