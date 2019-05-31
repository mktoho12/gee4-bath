require 'json'

class BathLog
  attr_accessor :status, :from, :to

  def initialize(hash)
    @status = hash[:status]
    @from = hash[:from]
    @to = hash[:to]
  end

  def using?
    status == 'using'
  end

  def vacant?
    !using?
  end

  def csv
    [status, from, to].join("\t")
  end

  def from_as_time
    from.strftime('%H:%M')
  end

  def to_as_time
    (to.nil? ? Time.current : to).strftime('%H:%M')
  end

  def hash_as_time
    {status:status, from:from_as_time, to:to_as_time}
  end

  def csv_as_time
    [status, from_as_time, to_as_time].join("\t")
  end

  def json_as_time
    JSON.generate(hash_as_time)
  end
end
