class Question < ApplicationRecord
  
  def duration
    if self.end_at.nil? || self.start_at.nil?
      return 0
    else
      return self.end_at - self.start_at
    end
  end
  
  def durationLeft
    if self.end_at.nil? || self.start_at.nil?
      return 0
    else
      return self.end_at - Time.now
    end
  end
end
