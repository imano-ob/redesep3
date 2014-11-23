# -*- coding: utf-8 -*-
class Host

  def initialize (ip, router)
    @ip = ip
    @router = router
    @applications = Hash.new
  end

  def sendToHost(package, hostname)
    ip = self.getIpByHostname(hostname)
    self.sendToIp(package, ip)
  end

  def sendToIp(package, ip)
    @router.sendToIp(package, ip)
  end

  def openPort(application, port)
    if @applications[port] == nil
      @applications[port] = application
    else
      #TODO: erro
    end
  end

  def closePort(port)
    @applications[port] = nil
  end

  def receive(package)
    port = package.getPort
    @applications[port].getPackage(package)
  end

end
