//
//  TodosController.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/24/25.
//

import Foundation

class TodosController: ObservableObject {
  @Published var sections: [TodoSection]
  
  init() {
    self.sections = TodoSection.dummySections
  }
}
