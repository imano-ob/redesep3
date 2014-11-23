class Event

  def initialize(time)
    @time = time
  end

  def getTime()
    @time
  end

  def handle ()
    #stub
  end

  def <=>(other)
    self.getTime() <=> other.getTime()
  end

end
