class SensorOutput < ApplicationRecord
  def vacant?
    a1.to_i > 2000
  end

  def using?
    !vacant?
  end

  def status
    vacant? ? '空いてる' : '誰か入ってる'
  end

  def display
    { status: status, time: created_at }
  end
end
