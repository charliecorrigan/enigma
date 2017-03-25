require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator'

class TestOffsetGenerator < Minitest::Test

  def test_existence_of_offset_generator_class
    offset_generator = OffsetGenerator.new
    refute_nil offset_generator
  end

#TODO figure out a way to update date in test automatically
  def test_generate_date_return_value
    offset_generator = OffsetGenerator.new
    date = offset_generator.generate_date
    assert_equal Fixnum, date.class
    assert_equal 6, date.to_s.length
    #assert_equal 250317, date
  end
end
