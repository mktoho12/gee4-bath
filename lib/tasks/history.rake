namespace :history do
  desc "Archive bathing history."
  task archive: :environment do
    # TODO あとで参照できるよう形式を変えて残すようにしたい
    zero = Time.zone.at 0
    today = Time.zone.today.in_time_zone
    SensorOutput.where(created_at: zero...today).delete_all
  end
end
