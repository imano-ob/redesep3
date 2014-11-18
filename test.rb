require "./event"
require "./eventqueue"

event1 = Event.new(10, nil, nil)
event2 = Event.new(20, nil, nil)

queue = EventQueue.new

queue.addEvent(event2)
queue.addEvent(event1)

print(queue.takeEvent.inspect, "\n")
print(queue.takeEvent.inspect, "\n")
