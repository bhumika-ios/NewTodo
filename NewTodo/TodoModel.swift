//
//  TodoModel.swift
//  NewTodo
//
//  Created by Bhumika Patel on 23/09/26.
//

import Foundation


struct Todo: Identifiable {
    
    let id = UUID()
    var title: String
    var isCompleted: Bool
    
}
