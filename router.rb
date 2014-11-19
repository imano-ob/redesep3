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
    #TODO: black magic para pegar o i certo
    i = 0
    @interfaces[i]
  end

end
