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

#TODO figure out a way to update date in test automatically
  def test_generate_offset_return_value
    offset_generator = OffsetGenerator.new
    assert_equal String, offset_generator.generate_offset("a").class
    assert_equal 1, offset_generator.generate_offset("a").length
    #assert_equal "FailingValue", offset_generator.generate_offset("a")
    #assert_equal "FailingValue", offset_generator.generate_offset("b")
    #assert_equal "FailingValue", offset_generator.generate_offset("c")
    #assert_equal "FailingValue", offset_generator.generate_offset("d")
  end
end
