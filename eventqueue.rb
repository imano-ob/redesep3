require "./event.rb"

class EventQueue

  def initialize()
    @queue = Array.new
  end

  def addEvent (event)
    @queue.push(event)
    @queue.sort!
    @queue.reverse!
  end

  def takeEvent()
    @queue.pop()
  end

end
