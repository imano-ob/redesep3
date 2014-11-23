class WaitEvent < Event
  
  def initialize(obj, time)
    super time
    @obj = obj
  end

  def handle
    @obj.continue()
  end

end
