Rails.application.routes.draw do
  get '/', to: 'sensor_output#latest'
  get '/sensor_outputs', to: 'sensor_output#index'
  get '/sensor_outputs/:date', to: 'sensor_output#by_date', date: /\d{8}/
  post 'sensor_output', to: 'sensor_output#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
