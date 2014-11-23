# -*- coding: utf-8 -*-
class Router
  
  def initialize (interfaces, perf)
    #reminder to self: isso é um array
    @interfaces = interfaces
    @perf = perf
  end

  def sendToIp (package, ip)
    destInterface = self.getInterface(ip)
    destInterface.sendPackage(package, ip)
  end

  def getInterface (ip)
    @interfaces.each do |interface|
      if interface.receives(ip)
        return interface
      end
      #TODO: erro
    end
  end
  
  def receive(package)
    self.queueAdd(package)
    if not @busy
      self.handlenextpackage
    end
  end

  def handlenextpackage()
    @busy = true
    eventmanager.wait(self, perf)
  end

  def continue()
    package = self.queueTake
    #TODO: aprender corrotinas
    self.sendToIp(package, package.getDest)
    if not self.queueEmpty
      self.handlenextpackage
    else
      @busy = false
    end
  end

end
