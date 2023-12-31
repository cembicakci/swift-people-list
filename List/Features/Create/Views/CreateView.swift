//
//  CreateView.swift
//  List
//
//  Created by Cem Bıçakcı on 5.11.2023.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Field?
    @StateObject private var vm = CreateViewModel()
    
    let successfullAction: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    firstname
                    lastname
                    job
                } footer: {
                    if case .validation(let err) = vm.error,
                        let errorDesc = err.errorDescription {
                            Text(errorDesc)
                                .foregroundStyle(.red)
                        }
                }
                
                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                     done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .succesful {
                    dismiss()
                    successfullAction()
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {}
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
        }
    }
}

extension CreateView {
    enum Field: Hashable {
        case firstName
        case lastName
        case job
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView {}
    }
}

private extension CreateView {
    
    var firstname : some View {
        TextField("First Name", text: $vm.person.firstName)
            .focused($focusedField, equals: .firstName)
    }
        
    var lastname : some View {
        TextField("Last Name", text: $vm.person.lastName)
            .focused($focusedField, equals: .lastName)
    }
    
    var job : some View {
        TextField("Job", text: $vm.person.job)
            .focused($focusedField, equals: .job)
    }
    
    var submit: some View {
        Button {
            focusedField = nil
            Task {
                await vm.create()
            }
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
