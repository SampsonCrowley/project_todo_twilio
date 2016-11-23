class Task < ApplicationRecord
  validates :description, presence: true
  validate :verify_due_date

  def verify_due_date
    unless completion_date.nil? || completion_date == ''
      errors.add(:completion_date, "Date cannot be in the past") if completion_date < Date.today
    end
  end

end
