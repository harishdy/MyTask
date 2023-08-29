//
//  TaskDetailView.swift
//  MyTask
//
//  Created by Harish on 27/08/23.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var taskViewModel:TaskViewModel
    @Binding var showTaskDetailView:Bool
    @Binding var selectedTask: Task
    @Binding var refreshTaskList:Bool
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task details")) {
                    TextField("Task name", text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description)
                    Toggle("Mark complete",isOn: $selectedTask.isCompleted)
                }
                Section(header: Text("Task date/time")) {
                    DatePicker("Task date", selection: $selectedTask.finishDate)
                }
                Section{
                    Button{
                        if(taskViewModel.deleteTask(task: selectedTask)){
                            showTaskDetailView.toggle()
                            refreshTaskList.toggle()
                        }
                        print("Delete Task")
                    }label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                }
            }.navigationTitle("Task Detail")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            print("Cancel button")
                            showTaskDetailView.toggle()
                        }label: {
                            Text("Cancel")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            print("Update button")
                            if(taskViewModel.updaTask(task: selectedTask)){
                                showTaskDetailView.toggle()
                                refreshTaskList.toggle()
                            }
                        }label: {
                            Text("Update")
                        }
                    }
                }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskViewModel: TaskViewModel(),
                       showTaskDetailView: .constant(false),
                       selectedTask: .constant(Task.createMockTasks().first!),
                       refreshTaskList: .constant(false))
    }
}
