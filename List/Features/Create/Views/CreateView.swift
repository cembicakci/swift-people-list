//
//  CreateView.swift
//  List
//
//  Created by Cem Bıçakcı on 5.11.2023.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                firstname
                lastname
                job
                
                Section {
                    submit
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                     done
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

private extension CreateView {
    
    var firstname : some View {
        TextField("First Name", text: .constant(""))
    }
        
    var lastname : some View {
        TextField("Last Name", text: .constant(""))
    }
    
    var job : some View {
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View {
        Button {
            // TODO: Submit
        } label: {
            Text("Submit")
        }
    }
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
}
