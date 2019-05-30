class SensorOutputController < ApplicationController
  def index
    render json: SensorOutput.latest(100).map(&:display)
  end

  def latest
    render json: SensorOutput.latest.display
  end

  def by_date
    date = Date.parse(params[:date])
    render json: SensorOutput.in_date(date).order_by_time.map(&:display)
  end

  def create
    sensor_output = JSON.parse(request.body.read).reject{|k|k=='ts' || k=='id'}
    SensorOutput.create(sensor_output)
    render json: { result: 'ok' }
  end
end
