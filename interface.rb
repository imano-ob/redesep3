require "./eventmanager"
require "./packageevent"

class Interface
  
  def intialize
    #TODO: stuff
  end
  
  def sendPackage(package, dest)
    #TODO: limite de banda
    event = PackageEvent.new(eventManager.getTime() + delay, package, dest)
    eventManager.addEvent()
  end

  def getDest(ip)
    ipinfo = self.stripinfo(ip)
    @remotes[ipinfo]
  end

  def receive(package)
    @device.receive(package)
  end

  def receives(ip)
    if not self.getDest (ip) == nil
      true
    end
    false
  end

  private
  def stripinfo(ip)
      #TODO: implementar
  end
end
