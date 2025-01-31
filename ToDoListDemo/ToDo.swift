//
//  ToDoModel.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/24/25.
//

import SwiftUI

struct Todo: Identifiable, Hashable {
  var id: UUID = UUID()
  var markedComplete: Bool
  var title: String
}

extension Todo {
  static var dummyTodos: [Todo] = [
    Todo(markedComplete: false, title: "Homework 1"),
    Todo(markedComplete: true, title: "Homework 2"),
    Todo(markedComplete: false, title: "Homework 3"),
    Todo(markedComplete: true, title: "Homework 4"),
    Todo(markedComplete: false, title: "Homework 5")
  ]
}
