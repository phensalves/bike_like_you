class TripSerializer < ActiveModel::Serializer
  attributes  :id,
              :origin_station,
              :final_station,
              :start_date,
              :end_date,
              :distance

  belongs_to :user
  belongs_to :bike

  def start_date
    object.start_date.strftime("%d/%m/%Y às %H:%M")
  end

  def end_date
    object.end_date.strftime("%d/%m/%Y às %H:%M")
  end

end
