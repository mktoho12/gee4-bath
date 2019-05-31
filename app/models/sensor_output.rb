class SensorOutput < ApplicationRecord
  scope :latest, ->(n = nil) {
    order(created_at: :desc).then { |r| n.nil? ? r.first : r.limit(n) }
  }

  scope :in_date, ->(date) {
    where(created_at: date.beginning_of_day..date.end_of_day)
  }
  
  scope :order_by_time, -> { order(created_at: :asc) }

  def self.history(date)
    in_date(date)
      .map { |log| BathLog.new(status: log.status, from: log.created_at) }
      .inject([]) { |l, r|
        if l.empty?
          [r]
        elsif l.last.status == r.status
          l
        else
          l.last.to = r.from
          l + [r]
        end
      }
      .select(&:using?).map(&:hash_as_time)
  end

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
