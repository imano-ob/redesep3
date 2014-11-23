# -*- coding: utf-8 -*-
require "./eventmanager"
require "./host"
require "./interface"
require "./host"

eventmanager = EventManager.new

#read inputs

#cria hosts
#cria routers
#cria interfaces
#associa interfaces
#associa rotas nas interfaces
#sniffers
#aplicações

#le coisas que devem acontecer
#coloca elas como eventos

while not eventmanager.isEmpty
  eventmanager.handleNextEvent
end
