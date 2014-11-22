
class Interface
  
  def intialize
    #TODO: stuff
  end
  
  def sendPackage(package, ip)
    #TODO: limite de banda
    dest = self.getDest(ip)
    event = Event.new(timeManager.getTime(), package, dest)
    eventManager.addEvent()
  end

  def getDest(ip)
    ipinfo = self.stripinfo(ip)
    @remotes[ipinfo]
  end

  
  private
  def stripinfo(ip)
      #TODO: implementar
  end
end
