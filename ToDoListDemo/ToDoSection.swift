//
//  ToDoSection.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/24/25.
//

import Foundation

struct TodoSection: Identifiable, Hashable {
  static func == (lhs: TodoSection, rhs: TodoSection) -> Bool {
    lhs.id == rhs.id
  }
  
  var id: UUID = UUID()
  var sectionTitle: String
  var todos: [Todo]
}

extension TodoSection {
  static var dummySections: [TodoSection] = [
    
    TodoSection(
      sectionTitle: "MTECH",
      todos: [
        Todo(markedComplete: false, title: "Homework"),
        Todo(
          markedComplete: false,
          title: "Learn how to collaborate using git"
        ),
        Todo(markedComplete: true, title: "Learn SwiftUI SubViews")
      ]
    ),
    
    TodoSection(
      sectionTitle: "WORK",
      todos: [
        Todo(markedComplete: false, title: "Dashboard 1"),
        Todo(
          markedComplete: false,
          title: "Send the lots of emails"
        ),
        Todo(markedComplete: true, title: "Meet with boss")
      ]
    ),
    
    TodoSection(sectionTitle: "FUN",
                todos: [
                  Todo(markedComplete: true, title: "Code"),
                  Todo(markedComplete: true, title: "Sleep")
                ])
  ]
}
