class SensorOutputController < ApplicationController
  def index
    render json: SensorOutput.order(created_at: :desc).limit(100).map(&:display)
  end

  def create
    sensor_output = JSON.parse(request.body.read).reject{|k|k=='ts' || k=='id'}
    SensorOutput.create(sensor_output)
    render json: {result: 'ok'}
  end

  def latest
    latest = SensorOutput.maximum(:created_at)
    render json: SensorOutput.find_by(created_at: latest).status
  end

  def by_date
    date = params[:date]
    from = Time.zone.parse("#{date} 000000")
    to = Time.zone.parse("#{date} 235959")
    render json: SensorOutput.where(created_at: from..to)
                             .order(created_at: :asc)
                             .map(&:display)
  end
end
