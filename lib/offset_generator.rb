class OffsetGenerator

  def generate_date
    day = Time.now.day.to_s
    month = Time.now.month.to_s
    year = Time.now.year.to_s
    day = "0" + day if day.length < 2
    month = "0" + month if month.length < 2
    year = year[2..3] if year.length > 2
    date = day + month + year
    date.to_i  
  end
end