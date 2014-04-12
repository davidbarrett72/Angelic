class Chore < ActiveRecord::Base

  validates :name, :complete_by, presence: true

  def done
    return completed ? "Yes" : "No"
  end

  def complete
    complete = true
  end

  def uncomplete
    complete = false
  end

  # TODO: put in a helper
  def state
    if completed
      "complete"
    else
      if complete_by < Time.now
        "incomplete-late"
      else
        "incomplete-upcoming"
      end
    end
  end

end
