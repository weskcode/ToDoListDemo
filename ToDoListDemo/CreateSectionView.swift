//
//  Untitled.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/25/25.
//


import SwiftUI

struct CreateSectionView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var todosController: TodosController
  @State private var newSectionTitle = ""
  
  var body: some View {
    VStack {
      Text("Add New Section")
        .font(.largeTitle)
        .fontWeight(.thin)
        .padding(.top)
      
      Spacer()
      
      TextField("Section Name", text: $newSectionTitle)
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 0.2))
        .padding()
      
      Spacer()
      
      VStack {
        Button {
          addNewSection()
        } label: {
          Text("Add Section")
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
    .padding()
  }
  
  func addNewSection() {
    guard !newSectionTitle.isEmpty else { return }
    
    let newSection = TodoSection(sectionTitle: newSectionTitle, todos: [])
    todosController.sections.append(newSection)
    dismiss()
  }
}

#Preview {
  let mockController = TodosController()
  return CreateSectionView(todosController: mockController)
}
