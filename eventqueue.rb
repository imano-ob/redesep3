require "./event.rb"

class EventQueue

  def initialize()
    @queue = Array.new
  end

  def addEvent (event)
    @queue.push(event)
    @queue.sort!
  end

  def takeEvent()
    @queue.shift()
  end

  def isEmpty()
    @queue.empty?
  end

end
