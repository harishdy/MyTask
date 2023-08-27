//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Harish on 20/08/23.
//

import Foundation
final class TaskViewModel:ObservableObject{
    @Published var tasks: [Task] = []
    func getTasks(isActive:Bool){
        tasks = Task.createMockTasks().filter({$0.isActive == isActive})
    }
}
