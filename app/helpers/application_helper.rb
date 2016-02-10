module ApplicationHelper
  def delivery_days_collection
    (3..14).map { |day| [l(day.business_day.from_now.to_date), day] }
  end
end
