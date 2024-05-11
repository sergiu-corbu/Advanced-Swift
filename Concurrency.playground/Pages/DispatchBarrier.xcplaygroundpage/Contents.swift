//: [Previous](@previous)

import Foundation

/*
 - DispatchBarrier is a group of functions executing in a serial queue. It helps synchronising the execution of one or more tasks in a dispatch queue.
 - often used when a queue must be delayed.
 */

/*
 Sync/Asyc determins the program flow on the submitting queue: Using sync() causes the execution on the submitting queue to block until the task has completed; in contrast, using async() won't block.
 
 Using the flag .barrier, however, affects the way the blocks are executed on the queue they were submitted to (obviously, this only makes a difference on concurrent queues):
 
 A block submitted with this flag will act as a barrier: all other blocks that were submitted before the barrier will finish and only then the barrier block will execute. All blocks submitted after the barrier will not start until the barrier has finished.
 
 Note: the barrier flag will have no effect on global queues. You must create your own concurrent queue in order to be able to use barrier blocks.*/

let queue = DispatchQueue(label: "barrierQueue", attributes: .concurrent)

queue.async {
  for index in 0..<5 {
    sleep(2)
    print("Task1 - async \(index)")
  }
}

queue.sync {
  for index in 0..<5 {
    sleep(1)
    print("Task2 - sync without Barrier \(index)")
  }
}

// The code above will execute

queue.sync(flags: .barrier) {
  for index in 0..<5 {
    sleep(1)
    print("Task3 - sync with Barrier \(index)")
  }
}

queue.async {
  for index in 0..<5 {
    sleep(1)
    print("Task4 - async \(index)")
  }
}

//: [Next](@next)
