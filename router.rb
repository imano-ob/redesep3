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

    # Isso é chamado quando passa o tempo de processamento do pacote
    # Ou deveria, se tudo estivesse funcionando
    #TODO: aprender corrotinas
    # ou continuações
    # ou seja la o que for que eu deva colocar aqui
    # acho que eu devia ter prestado mais atenção em conceitos
    # eu não queria ter que lidar com threads, mas talvez aqui fizesse sentido
    # ou não, EP2 traumas feelings
    # #ramblings

    package = self.queueTake

    self.sendToIp(package, package.getDest)
    if not self.queueEmpty
      self.handlenextpackage
    else
      @busy = false
    end
  end

  #TODO: gerenciar fila

end
