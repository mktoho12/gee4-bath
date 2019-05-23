class SensorOutputController < ApplicationController
  def index
    render json: SensorOutput.all.map(&:display)
  end

  def create
    sensor_output = JSON.parse(request.body.read).reject{|k|k=='ts' || k=='id'}
    SensorOutput.create(sensor_output)
    render json: {result: 'ok'}
  end

  def latest
    latest = SensorOutput.maximum(:created_at)
    render SensorOutput.find_by(created_at: latest).status
  end
end
