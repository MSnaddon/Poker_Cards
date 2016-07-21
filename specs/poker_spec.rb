require 'minitest/autorun'
require_relative '../poker'

class TestDebug < Minitest::Test
  
  def test_get_hand_value()
    result1 = get_hand_value([2,2,2,2,5],["H","H","H","H","H"])
    result2 = get_hand_value([3,3,3,5,5],["H","D","C","C","H"])
    result3 = get_hand_value([2,2,11,12,5],['C','C','C','C','C'])
    assert_equal("Four of a kind", result1)
    assert_equal("Full house", result2)
    assert_equal("Flush", result3)
  end

  def test_numb_card_value()
    result1 = numb_card_value("QH")
    result2 = numb_card_value("10S")
    result3 = numb_card_value("3C")
    assert_equal(12, result1)
    assert_equal(10, result2)
    assert_equal(3, result3)
  end

  def test_analyse_hand()
    hand = ['AH','KD','4C','5C','6C']
    result1, result2 = analyse_hand(hand)
    assert_equal(result1,[14,13,4,5,6])
    assert_equal(result2,['H','D','C','C','C'])
  end

  def test_is_flush?
    flush = ["H","H","H","H","H"]
    not_flush = ["H","D","C","C","H"]
    result1 = is_flush?(flush)
    result2 = is_flush?(not_flush)
    assert_equal(true,result1)
    assert_equal(false,result2)
  end


  def test_is_straight?()
    hand1 = [3,4,5,6,8]
    hand2 = [2,3,4,5,6]
    result1 = is_straight?(hand1)
    result2 = is_straight?(hand2)
    assert_equal(false,result1)
    assert_equal(true,result2)
  end

  def test_value_count()
    value1 = [2,2,3,3,3]
    result1 = value_count(value1)
    assert_equal(7,result1)
  end
end