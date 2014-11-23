require "./eventmanager"
require "./packageevent"

class Interface
  
  def intialize (device, bandwidth)
    @device = device
    @bandwidth = bandwidth
    #TODO: stuff
  end
  
  def sendPackage(package, dest)
    #TODO: limite de banda
    event = PackageEvent.new(eventManager.getTime() + delay, package, dest)
    eventManager.addEvent()
  end

  def receive(package)
    @device.receive(package)
  end

end
