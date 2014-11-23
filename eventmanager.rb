require "./event"

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
    @time = event.getTime()
    event.handle
  end

  def wait(obj, time)
    event = WaitEvent.new(obj, @time + time)
    self.addEvent(event)
  end

end
