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

  def generate_offset(rotation)
    value = (generate_date ** 2).to_s
    if rotation == "a"
      value[0]
    elsif rotation == "b"
      value[1]
    elsif rotation == "c"
      value[2]
    else
      value[3]
    end
  end

end
