//
//  TodoDetailView.swift
//  NewTodo
//
//  Created by Bhumika Patel on 24/09/26.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    @ObservedObject var viewModel: TodoViewModel
    var body: some View {
        VStack(spacing:26){
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 75))
                .foregroundStyle(.green)
            
            Text("Learn SwiftUI")
                .font(.title).bold()
            
            Button {
                viewModel.toggleTodo(todo)
            } label: {
                Text(todo.isCompleted ? "Completed": "Pending")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding()
        }
        .navigationTitle("Todo Detail")
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "String", isCompleted: false), viewModel: TodoViewModel())
}
