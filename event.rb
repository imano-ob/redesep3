class Event

  def initialize(time, packet, receiver)
    @time = time
    @packet = packet
    @receiver = receiver
  end

  def getTime()
    @time
  end

  def getPacket()
    @packet
  end

  def getReceiver()
    @receiver
  end

  def <=>(other)
    self.getTime() <=> other.getTime()
  end

end
