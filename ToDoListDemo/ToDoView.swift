//
//  ContentView.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/24/25.
//

import SwiftUI

struct TodoView: View {
  @StateObject var todoController = TodosController()
  
  var body: some View {
    NavigationStack {
      VStack {
        HStack{
          Text("Todos").font(.title)
            .padding(.leading, 25)
          Spacer()
          NavigationLink {
            CreateTodoView(todosController: todoController)
          } label: {
            Image(systemName: "plus")
              .padding(.trailing, 25)
              .font(.title.weight(.thin))
          }
          
        }
        .padding()
        .frame(height: 40)
        
        List {
          ForEach($todoController.sections) { $section in
            Section(section.sectionTitle) {
              ForEach($section.todos) { $todo in
                TodoRowView(todo: $todo)
              }
              .onDelete { offsets in
                deleteTodo(at: offsets, from: section)
              }
            }
          }
        }.listStyle(.inset)
      }.toolbar(.hidden)
    }
  }
  
  func deleteTodo(at offsets: IndexSet, from section: TodoSection) {
    if let index = todoController.sections.firstIndex(of: section) {
      todoController.sections[index].todos.remove(atOffsets: offsets)
    }
  }
}

#Preview {
  TodoView()
}
