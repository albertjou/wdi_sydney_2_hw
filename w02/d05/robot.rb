require 'pry'

class Robot

  def initialize
    # a few ways to join strings    
    # @name = prefix + postfix   # slowest 
    # @name = prefix.concat(postfix) # generaly fastest
    @name = "#{prefix}#{postfix}"
  end

  def prefix
    ('aa'..'zz').to_a.sample
  end

  def postfix
    # one way to do it 
    # "{rand(899) + 100"

    # another way to do it
    ('000'..'999').to_a.sample
  end

  def name
    @name
  end
  
  def reset
    @name = "#{prefix}#{postfix}"
  end
end


binding.pry