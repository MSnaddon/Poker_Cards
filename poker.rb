
def get_hand_value (value, suits)
  test1 = value_count(value)
  test2 = flush_straight(value, suits)
  tier = test1 if test1>test2
  tier = test2 if test2>test1

  case tier
  when 1
    return "High card"
  when 2
    return "One pair"
  when 3
    return "Two pair"
  when 4
    return "Thee of kind"
  when 5
    return "Straight"
  when 6
    return "Flush"
  when 7
    return "Full house"
  when 8
    return "Four of a kind"
  when 9
    return "Straight flush"
  else
    return "You suck!"
  end
end

def numb_card_value(card)
  case card[0,1]
  when "A"
    return 14
  when "Q"
    return 12
  when "K"
    return 13
  when "J"
    return 11
  when"1"
    return 10
  else
    return card[0,1].to_i
  end
end


def analyse_hand(hand)
  value = []
  suit = []
 for card in hand
    value.push(numb_card_value(card))
    suit.push(card[-1,1])
 end
 return value, suit
end

def is_flush?(suits)
  flushcount = 0
  compare = suits[0]
  for suit in suits
    flushcount += 1 if suit == compare
  end
  return true if flushcount == 5
  return false
end

def is_straight?(values)
  straight_count = 0
  sorted = values.sort
  for i in 1..sorted.size
    straight_count += 1 if sorted[i-1] + 1 == sorted[i]
  end
  return true if straight_count == 4
  return false
  return
end

def flush_straight(values, suits)
  return 9 if is_straight?(values) && is_flush?(suits)
  return 6 if is_flush?(suits)
  return 5 if is_straight?(values)
  return 0
end

def value_count(number)
  result = []
  for i in (2..14)
    result.push(number.count(i))
  end
  return 7 if result.count(3) == 1 and result.count(2) == 1 # fullhouse
  return 2 if result.count(2) == 1 #one pair
  return 3 if result.count(2) == 2 #two pair
  return 4 if result.count(3) == 1 # three of a kind
  return 8 if result.count(4) == 1 # four of a kind
  return 0
end

hand = ["4H","5H","6H","6C","6S"]
arr1, arr2 = analyse_hand(hand)
puts get_hand_value(arr1,arr2)