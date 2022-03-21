class Robot
  attr_accessor :name

  private :name=
  
  PREVIOUS_NAMES = []

  def initialize
    @name = generate_name()
  end

  def generate_name(temp = '')
    temp << ("A".."Z").to_a.sample(2).join
    temp << (0..9).to_a.sample(3).join

    if PREVIOUS_NAMES.include?(temp)
      generate_name()
    else
      PREVIOUS_NAMES << temp
      temp
    end
  end

  def reset
    self.name = generate_name()
    PREVIOUS_NAMES.delete(self.name)
  end
end
