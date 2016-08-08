class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# adding a play method in the Bingo class would override the play method in the Game class
# when the method is called on a Bingo object, the play method in Bingo would be invoked