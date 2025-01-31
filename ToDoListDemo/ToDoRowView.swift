//
//  ToDoRowView.swift
//  ToDoListDemo
//
//  Created by Wesley Keetch on 1/24/25.
//

import SwiftUI

struct TodoRowView: View {
  @Binding var todo: Todo
  var body: some View {
    HStack {
      Button {
        todo.markedComplete.toggle()
      } label: {
        Circle()
          .strokeBorder(.blue, lineWidth: 1)
          .background(Circle()
            .fill(todo.markedComplete ? .indigo : .clear))
          .frame(width: 20, height: 20)
      }
      Text(todo.title)
        .padding(.leading, 5)
      Spacer()
    }
    .padding()
    .frame(height: 40)
  }
}

#Preview {
  @Previewable @State var todo = Todo(markedComplete: true, title: "Task 1")
  TodoRowView(todo: $todo)
}
