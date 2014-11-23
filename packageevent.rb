require "./event"

class PackageEvent < Event

  def initialize(time, packet, receiver)
    super time
    @packet = packet
    @receiver = receiver
  end

  def handle ()
    @receiver.receive(packet)
  end

  def <=>(other)
    self.getTime() <=> other.getTime()
  end

end
