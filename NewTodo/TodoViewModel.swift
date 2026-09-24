//
//  TodoViewModel.swift
//  NewTodo
//
//  Created by Bhumika Patel on 23/09/26.
//

import SwiftUI
import Combine

class TodoViewModel: ObservableObject {
    
    @Published var todos = [
        Todo(title: "Learn swift", isCompleted: false),
        Todo(title: "raeding book", isCompleted: true)
    ]
    
    func addTodo(title: String) {
        guard !title.isEmpty else { return }
        todos.append(Todo(title: title, isCompleted: false))
    }
    
    func deleteTodo(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    func toggleTodo(_ todo: Todo){
        if let index = todos.firstIndex(where: {
            $0.id == todo.id
        }) {
            todos[index].isCompleted.toggle()
        }
    }
}
