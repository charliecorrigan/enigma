require 'pry'
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
    squared_value_to_string = (generate_date ** 2).to_s
    last_four_digits = squared_value_to_string[-4..-1]
    if rotation == "a"
      last_four_digits[0]
    elsif rotation == "b"
      last_four_digits[1]
    elsif rotation == "c"
      last_four_digits[2]
    else
      last_four_digits[3]
    end
  end

end
