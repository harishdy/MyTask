//
//  Task.swift
//  MyTask
//
//  Created by Harish on 20/08/23.
//

import Foundation
struct Task{
    let id:Int
    var name:String
    var description:String
    var isActive:Bool
    var finishDate:Date
    
    static func createMockTasks()->[Task]{
        return[
            Task(id: 1, name: "Go to gym", description: "back workout", isActive: true , finishDate: Date()),
            Task(id: 2, name: "Car wash", description: "Down cwash center", isActive: true , finishDate: Date()),
            Task(id: 3, name: "Office work", description: "Finsh picker module", isActive: false , finishDate: Date())
        ]
    }
}
