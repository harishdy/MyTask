//
//  Task.swift
//  MyTask
//
//  Created by Harish on 20/08/23.
//

import Foundation
struct Task{
    var id:Int
    var name:String
    var description:String
    var isCompleted:Bool
    var finishDate:Date
    
    static func createMockTasks()->[Task]{
        return[
            Task(id: 1, name: "Go to gym", description: "back workout", isCompleted: false , finishDate: Date()),
            Task(id: 2, name: "Car wash", description: "Down cwash center", isCompleted: false , finishDate: Date()),
            Task(id: 3, name: "Office work", description: "Finsh picker module", isCompleted: true , finishDate: Date())
        ]
    }
}
