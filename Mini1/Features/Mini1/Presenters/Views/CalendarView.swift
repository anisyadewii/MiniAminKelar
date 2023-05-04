//
//  CalendarView.swift
//  Mini1
//
//  Created by Anisya Dewi Larasati on 30/04/23.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var vm = JournalViewModel()
    @StateObject var cm = CoreDataUserManager()
    @Namespace var animation
    @State var filteredJournals: [Journal]?
    
    let colorCalendar = Color(red: 44 / 255, green: 11 / 255, blue: 183 / 255)
    
    func colorTag(feeling: String) -> Color {
        if feeling == "love" {
            return .pink
        } else if feeling == "sadness" {
            return .blue
        } else if feeling == "fear" {
            return .red
        } else if feeling == "surprise" {
            return .yellow
        } else if feeling == "anger" {
            return .brown
        } else if feeling == "joy" {
            return .black
        } else {
            return .mint
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                let day = Date()
                Text(vm.extractedDate(date1: day, format: "MMMM"))
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Spacer()
                
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
           
            Section {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach(vm.currentWeek, id: \.self) {
                            day in
//                            Text(day.formatted(date: .abbreviated, time: .omitted))

                            // EEE will return day as Mon, Tue, Fri, ...
                            ZStack {
                                VStack(spacing: 5) {
                                    Text(vm.extractedDate(date1: day, format: "dd")).font(.system(size: 16)).fontWeight(.semibold)
                                        .background {
                                            ZStack {
                                                if vm.isToday(date2: day){
                                                    Capsule()
                                                        .fill(.blue)
                                                        .frame(width: 45, height: 25)
                                                        .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                                        
                                                }
                                            }
                                        }
                      
                                    
                                    Circle().fill(.cyan).frame(width: 8, height: 8).opacity(vm.isToday(date2: day) ? 1 : 0)
                                    Circle()
                                        .fill(.blue)
                                        .frame(width: 60, height: 60)
                                    
                                }
                                .foregroundColor(vm.isToday(date2: day) ? .white : .black)
                                .frame(height: 110)
//                                .background {
//                                    ZStack {
//                                        if vm.isToday(date2: day){
//                                                Capsule().fill(colorCalendar).matchedGeometryEffect(id: "CURRENTDAY", in: animation)
//
//                                        }
//                                    }
//                                }
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation{
                                        vm.currentDay = day
                                    }
                                }
                            }
                        }
                    }
                }
                
                    
            }
            
            JournalListView()
            
            Spacer()
            
        }.padding()
    }
    
    func JournalListView() -> some View{
        LazyVStack(spacing: 10){
            if let journals = filteredJournals{
                if journals.isEmpty{
                    Text("No journal found")
                    
                } else {
                    ForEach(journals) {
                        journal in
                        JournalCardView(journal: journal)
                    }
                }
            }
           
        }.onChange(of: vm.currentDay) { newValue in
            filterTodayJournals()
        }
    }
    
    func JournalCardView(journal: Journal) -> some View{
//        HStack{
        
        // batas atas navigation view
        NavigationView{
            NavigationLink(destination: JournalDetailView(journal: journal)){
                // batas atas vstack
                VStack(alignment: .leading){
//                    WrappingHStack(alignment: .leading) {
//                        ForEach(journal.feelingArray, id: \.self) {
//                            feeling in
//    //                        TagView(tagText: "\(feeling.wrappedText)", tagColor: colorTag(feeling: feeling.wrappedText))
//
//                            TagView(tagText: "Bibub", tagColor: .cyan)
//
//        //                    Text(vm.showEmoji(feeling: feeling.wrappedText))
//                        }
//                    }
//                    .padding(.bottom)
                    
                    // ini yg di pake buat share
                    Text(journal.wrappedText)
                        .padding(.all, 8)
                        .font(.system(size: 14))
                        .foregroundColor(Color(.white))
                        .background(Color(.blue))
                        .cornerRadius(15)
//                     dipake buat share
                    
                    // batas atas foreach
    //                ForEach(journal.feelingArray, id: \.self) {
    //                    feeling in
    //                    Text(feeling.wrappedText)
    ////                    Text(vm.showEmoji(feeling: feeling.wrappedText))
    //                }
                    // batas bawah foreach
                                       
                }.padding(.vertical)
                // batas bawah vstack
            }
        }
        // batas bawa navigationview
        
        
        // LIAT YANG INI YA JER
      
//            VStack(alignment: .leading){
//                WrappingHStack(alignment: .leading) {
//                    ForEach(journal.feelingArray, id: \.self) {
//                        feeling in
//                        TagView(tagText: "\(feeling.wrappedText)", tagColor: colorTag(feeling: feeling.wrappedText))
//
//                        TagView(tagText: "Bibub", tagColor: .cyan)

    //                    Text(vm.showEmoji(feeling: feeling.wrappedText))
//                    }
//                }
//                .padding(.bottom)
//
//                Text(journal.wrappedText)
//                    .padding(.all, 8)
//                    .font(.system(size: 14))
//                    .foregroundColor(Color(.white))
//                    .background(Color(.blue))
//                    .cornerRadius(15)

//                ForEach(journal.feelingArray, id: \.self) {
//                    feeling in
//                    Text(feeling.wrappedText)
////                    Text(vm.showEmoji(feeling: feeling.wrappedText))
//                }


                // ini punya FICA
//                Divider()
//                    .frame(height: 1)
//                    .background(Color(.blue))
//                Text("Here's our suggestion for you,")
//                    .font(.system(size: 19))
//                    .fontWeight(.medium)
//                    .padding(.top, 2)
//                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id mauris a nibh tristique tincidunt. Praesent eu arcu vitae mauris tristique ullamcorper sed in purus.")
//                    .padding(.all, 8)
//                    .font(.system(size: 14))
//                    .foregroundColor(Color(.white))
//                    .background(Color(.blue))
//                    .cornerRadius(15)
//
//
//
//            }.padding(.vertical)
//        }
    }
    
//    func emojiListView() -> some View{
//        LazyVStack(spacing: 10){
//            if let journals = filteredJournals{
//                if journals.isEmpty{
//                    Text("No journal found")
//                } else {
//                    ForEach(journals) {
//                        journal in
//                        emojiView(journal: journal)
//                    }
//                }
//            }
//        }.onChange(of: vm.currentDay) { newValue in
//            filterTodayJournals()
//        }
//    }
    
//    func emojiView(journal: Journal) -> some View{
//        VStack{
//            ForEach(journal.feelingArray, id: \.self) {
//                feeling in
//                Text(vm.showEmoji(feeling: feeling.wrappedText))
//            }
//        }
//    }
    
    
    // Filter today journal
    func filterTodayJournals(){
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.cm.user.journalArray.filter {
                return calendar.isDate($0.wrappedDate, inSameDayAs: vm.currentDay)
            }
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredJournals = filtered
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
//        CalendarView(date: Date())
        CalendarView()
    }
}
