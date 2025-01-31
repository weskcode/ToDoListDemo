//
//  AddToDoView.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/27/25.
//

import SwiftUI

struct CreateTodoView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var todosController: TodosController
  @State var newTodoText = ""
  @State private var selectedSection: TodoSection?
  @State private var isAddingSection = false

  init(todosController: TodosController) {
    self._todosController = ObservedObject(wrappedValue: todosController)
    self._selectedSection = State(initialValue: todosController.sections.first)
  }

  var body: some View {
    VStack {
      Text("Create New Todo")
        .font(.largeTitle)
        .fontWeight(.thin)
        .padding(.top)

      Spacer()

      HStack {
        TextField("Todo", text: $newTodoText)
          .padding()
          .background(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 0.2))
          .padding()

        Picker("For Section", selection: $selectedSection) {
          ForEach(todosController.sections, id: \.self) { section in
            Text(section.sectionTitle).tag(section as TodoSection?)
          }
          Text("➕ Add Section...").tag(nil as TodoSection?)
        }
        .onChange(of: selectedSection) {
          if selectedSection == nil {
            isAddingSection = true
          }
        }
        .padding(.trailing)
      }

      Spacer()

      VStack {
        Button {
          if !newTodoText.isEmpty, let section = selectedSection {
            addNewTodo(newTodoText, for: section)
            dismiss()
          }
        } label: {
          Text("Create")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(RoundedRectangle(cornerRadius: 15).fill(.blue))
        }

        Button {
          dismiss()
        } label: {
          Text("Cancel")
            .foregroundColor(.red)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(RoundedRectangle(cornerRadius: 15).stroke(.red))
        }
      }
      .padding()
    }
    .sheet(isPresented: $isAddingSection) {
      CreateSectionView(todosController: todosController)
    }
  }
  
  func addNewTodo(_ todoTitle: String, for section: TodoSection) {
    if let sectionIndex = todosController.sections.firstIndex(where: { $0 == section }) {
      todosController.sections[sectionIndex].todos.append(Todo(markedComplete: false, title: todoTitle))
    }
  }
}

#Preview {
  let mockController = TodosController()
  return CreateTodoView(todosController: mockController)
}
