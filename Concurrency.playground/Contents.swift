import Foundation

class Foo {
    
    var task: Task<Void, Never>?
    
    deinit {
        stopRunningTask()
    }
    
    //Task [ ... ...  ]
    func executeSequentially() {
        self.task = Task(priority: .utility) { [weak self] in
            guard let self else { return }
            let startTime = Date.now
            
            let temp = await self.fetchTemperatureData()
            let wind = await self.fetchWindData()
            let rain = await self.fetchRainData()
                        
            let endTime = Date.now
            
            let time = endTime.distance(to: startTime)
            print(time)
            
            print([temp, wind, rain].map(\.description).joined(separator: ", "))
        }
    }
    
    //TaskGroup
    func executeInParalel() {
        self.task = Task(priority: .utility) { [weak self] in
            guard let self else { return }
            let startTime = Date.now
            
            await withTaskGroup(of: Float.self) { taskGroup in
                taskGroup.addTask {
                    let temp = await self.fetchTemperatureData()
                    return temp
                }
                taskGroup.addTask {
                    let wind = await self.fetchWindData()
                    return wind
                }
                taskGroup.addTask {
                    let rain = await self.fetchRainData()
                    return rain
                }
            }
            
            let endTime = Date.now
            let time = endTime.distance(to: startTime)
            
            
            
            print(time)
        }
    }
    
    func stopRunningTask() {
        guard let task else {
            return
        }
        
        task.cancel()
    }
    
    func fetchTemperatureData() async -> Float {
        ///api call
        try! await Task.sleep(for: .seconds(3))
        print("fetched temperature")
        return Float.random(in: 0..<100)
    }
    
    func fetchWindData() async -> Float {
        ///api call
        try! await Task.sleep(for: .seconds(4))
        print("fetched wind")
        return Float.random(in: 0..<100)
    }
    
    func fetchRainData() async -> Float {
        ///api call
        try! await Task.sleep(for: .seconds(1))
        
        print("fetched rain")
        return Float.random(in: 0..<100)
    }
}

let foo = Foo()
foo.executeInParalel()

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    foo.stopRunningTask()
}
