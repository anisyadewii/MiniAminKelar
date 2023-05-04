//
//  AddView.swift
//  MiniChallenge1
//
//  Created by Jeremy Raymond on 25/04/23.
//

import SwiftUI
import CoreML

struct AddView: View {
    @StateObject var vm = JournalViewModel()
    @StateObject var cd = CoreDataUserManager()
//    var feelings = ["sadness", "joy", "angry", "surprise", "fear"]
    
    // Cannot use mutating member on immutable value: 'self' is immutable
    // Kalo ada error di atas berarti var doang gabisa tapi harus pake state private var
    @State private var feelings2: [String] = []
    
    var body: some View {
        VStack {
            DatePicker("Pick a date", selection: $vm.date)
            TextEditor(text: $vm.text)
                .foregroundColor(.secondary)
                .border(.black)
            TextField("What do you need", text: $vm.need)
            Text("The text you write is: \(vm.text)")
            
            Button {
                predictMood(text: vm.text)
            } label: {
                Text("Predict Mood")
            }
            .buttonStyle(.borderedProminent)
            Text("Your mood is: \(vm.mood)")
            
            Button {
                feelings2.append(vm.need)
            } label: {
                Text("Add need")
            }
            
//            let feelingsCopy = feelings2 // create a copy of the feelings2 array
//                cd.addJournal2(date: vm.date, feelings: feelingsCopy, text: vm.text) // pass the copy to the addJournal2 method
//                feelings2 = [] // empty the feelings2 array
            
            Button {
                if !feelings2.isEmpty {
                    cd.addJournal2(date: vm.date, feelings: feelings2, text: vm.text)
                    feelings2 = []
                } else if feelings2.isEmpty {
                    cd.addJournal(date: vm.date, feelings: vm.mood, text: vm.text)
                }
//                cd.addJournal2(date: vm.date, feelings: feelings2, text: vm.text)
                
//                cd.addJournal(date: vm.date, feelings: vm.mood, text: vm.text)
//                feelings2 = []
            } label: {
                Text("Add Journal")
            }
            .buttonStyle(.borderedProminent)
            
//            Button {
//                feelings2 = []
//            } label: {
//                Text("Empty the array")
//            }
//            .buttonStyle(.borderedProminent)
            
//            Button {
//                cd.addJournal(date: vm.date, feelings: feelings.randomElement()!, text: vm.text)
//            } label: {
//                Text("Add Journal")
//            }
//            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    func predictMood(text: String) {
        do {
            let config = MLModelConfiguration()
            let model = try MoodAnalysis(configuration: config)
            
            let prediction = try model.prediction(text: text)
            //let prediction = try model.prediction(input: ["happy", "sad"])
            
            vm.mood = prediction.label
        } catch {
            //If predictMood fails
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
