
class EventManager

  def initialize
    @time = 0
    @eventqueue = EventQueue.new
  end

  def getTime()
    @time
  end

  def addEvent(event)
    @eventqueue.addEvent(event)
  end

  def handleNextEvent()
    event = @eventqueue.takeEvent()
    receiver = event.getReceiver
    receiver.receive(event.getPacket())
  end

end
