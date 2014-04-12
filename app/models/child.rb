class Child < ActiveRecord::Base

  validates :first_name, :last_name, :age, :allowance, presence: true

  validates :age, length: {in: 1..2}

  def current_earned(chores)
    completed = 0
    chores.each do |c|
      if c.completed?
        completed += 1
      end
    end

    # handle if no chores completed
    if completed != 0
      current_earned = (completed.to_f / chores.length.to_f) * allowance
    else
      current_earned = 0
    end
  end

  def to_s
    "#{first_name}, #{last_name}"
  end

end
