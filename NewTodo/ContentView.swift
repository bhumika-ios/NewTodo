//
//  ContentView.swift
//  NewTodo
//
//  Created by Bhumika Patel on 23/09/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodo = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("Please enter Todo", text: $newTodo)
                        .padding()
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button {
                        viewModel.addTodo(title: newTodo)
                        newTodo = ""
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                            .font(.title)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }

                }
                //Todo List
                List {
                    ForEach(viewModel.todos) { todo in
                        NavigationLink{
                            TodoDetailView(todo: todo, viewModel: viewModel)
                        } label: {
                            HStack{
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(todo.isCompleted ? .green : .gray )
                                Text(todo.title)
                                    .font(.headline)
                                    .strikethrough(todo.isCompleted)
                            }
                        }
                        
                    }
                    .onDelete{ IndexSet in
                        viewModel.deleteTodo(at: IndexSet)
                    }
                }
            }
            .padding()
            
            .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
