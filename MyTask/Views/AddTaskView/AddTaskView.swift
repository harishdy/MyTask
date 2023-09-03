//
//  AddTaskView.swift
//  MyTask
//
//  Created by Harish on 27/08/23.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var taskViewModel:TaskViewModel
    @State private var taskToAdd:Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    @Binding var showAddTaskView:Bool
    @Binding var refreshTaskList:Bool
    @State private var showDirtyCheckAlert:Bool = false
    var pickerDateRange: ClosedRange<Date>{
        let calendar = Calendar.current
        let currentDateComponent = calendar.dateComponents([.day,.month,.year,.hour,.minute],
                                                           from: Date())
        let startingDateComponent = DateComponents(year: currentDateComponent.year,month: currentDateComponent.month,day: currentDateComponent.day,hour: currentDateComponent.hour,minute: currentDateComponent.minute)
        
        let endingDateComponent = DateComponents(year: 2024,month: 12,day: 31)
        return calendar.date(from: startingDateComponent)! ... calendar.date(from: endingDateComponent)!
    }
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task details")) {
                    TextField("Task name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                Section(header: Text("Task date/time")) {
                    DatePicker("Task date", selection: $taskToAdd.finishDate, in:pickerDateRange)
                }
            }.navigationTitle("Add Task")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            print("Cancel button")
                            if(!taskToAdd.name.isEmpty){
                                //show alret
                                showDirtyCheckAlert.toggle()
                            }else{
                                showAddTaskView.toggle()
                            }
                            
                        }label: {
                            Text("Cancel")
                        }.alert("Save Task",
                                isPresented: $showDirtyCheckAlert) {
                            Button{
                                showAddTaskView.toggle()
                            }label: {
                                Text("Cancel")
                            }
                            Button{
                                AddTask()
                            }label: {
                                Text("Save")
                            }
                        } message: {
                            Text("Wolud you like to save the task?")
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                           AddTask()
                        }label: {
                            Text("Add")
                        }.disabled(taskToAdd.name.isEmpty)
                    }
                }
        }
        
    }
    private func AddTask(){
        if taskViewModel.addTask(task: taskToAdd){
            showAddTaskView.toggle()
            refreshTaskList .toggle()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: TaskViewModel(), showAddTaskView: .constant(false), refreshTaskList: .constant(false))
    }
}
