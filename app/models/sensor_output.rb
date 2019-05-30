class SensorOutput < ApplicationRecord
  scope :latest, ->(n = 1) { order(created_at: :desc).limit(n) }
  scope :in_date, ->(date) {
    where(created_at: date.beginning_of_day..date.end_of_day)
  }
  scope :order_by_time { order(created_at: :asc) }

  def vacant?
    a1.to_i > 2000
  end

  def using?
    !vacant?
  end

  def status
    vacant? ? 'vacant' : 'using'
  end

  def display
    { status: status, time: created_at }
  end
end
