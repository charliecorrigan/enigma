# there is a character map. it consists of an integer and a corresponding character, integer, space, period, or comma

# initialization will need keys (a_rotation... d_rotation), offsets

# take the string that is passed in by the user

# key_a = take a_rotation and add offset a 
# key_b = take a_rotation and add offset b 
# key_c = take a_rotation and add offset c 
# key_d = take a_rotation and add offset d 

# procedure of encoding 4 chars
  # take message and separate off the first 4 chars
  # do exception handling for < 4 chars at the end of the message

  # first character... add key a
  # second char add key b
  # third char add key c
  # fourth char add key d
  # add it to the encrypted string

# do procedure of encoding 4 chars again... again... again... 
