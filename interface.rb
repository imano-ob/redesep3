
class Interface
  
  def intialize
    #TODO: stuff
  end
  
  def sendPackage(package, ip)
    #TODO: limite de banda
    dest = self.getDest(ip)
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

  private
  def stripinfo(ip)
      #TODO: implementar
  end
end
