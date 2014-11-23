# -*- coding: utf-8 -*-
class Router
  
  def initialize (interfaces, dests, perf, queuesize)
    #reminder to self: isso é um array
    @interfaces = interfaces
    #hash ip->interface
    @dests = dests
    @perf = perf
    @queue = Array.new
    @queuesize = queuesize
  end

  def sendToIp (package, ip)
    destInterface = self.getInterface(ip)
    destInterface.sendPackage(package, ip)
  end

  def getInterface (ip)
    if @dests[ip] != nil 
      interface = @dests[ip]
    else 
      outbound = self.outbound(ip)
      if @dests[outbound]
        interface = @dests[outbound]
      else
        #erro
      end
    end
    interface
  end
  
  def receive(package)
    if not self.queueFull
      self.queueAdd(package)
      if not @busy
        self.handlenextpackage
      end
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

  def queueEmpty
    @queue.empty?
  end

  def queueTake
    @queue.shift
  end

  def queueAdd (package)
    @queue.push(package)
  end

  def queueFull()
    #deliberadamente off by one porque o pacote sendo processado ainda não foi
    #removido da fila
    @queue.size > @queuesize
  end

end
