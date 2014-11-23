# -*- coding: utf-8 -*-
require "./package"

class TCPPackage < Package
  
  def initialize (dest, source, data)
    #TODO: ver informações certas para isso aqui
    super dest, source
    @data = data
  end
  
  def sniff ()
    super
    self.printPackageData()
  end

  def printPackageData()
    #TODO: figure this out
  end

end
