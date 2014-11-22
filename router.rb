# -*- coding: utf-8 -*-
class Router
  
  def initialize (interfaces)
    #reminder to self: isso é um array
    @interfaces = interfaces
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
    self.sendToIp(package, package.getDest)
  end

end
