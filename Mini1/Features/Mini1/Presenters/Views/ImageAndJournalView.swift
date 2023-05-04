//
//  ImageAndJournalView.swift
//  Mini1
//
//  Created by Anisya Dewi Larasati on 04/05/23.
//

import SwiftUI
import PhotosUI

struct ImageAndJournalView: View {
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var text: String = ""
    @State private var showingImagePicker = false
    
    let elementColor = Color(red: 206 / 255, green: 214 / 255, blue: 249 / 255)
    let fontColor =  Color(red: 62 / 255, green: 84 / 255, blue: 172 / 255)

    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("How was your day?")
                    .fontWeight(.semibold)
                    .font(.title2).foregroundColor(fontColor)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(elementColor, lineWidth: 1)
                        .frame(width: 370,height: 100)
                    
                    if image == nil {
                        Image(systemName: "camera.fill")
                            .resizable().foregroundColor(elementColor)
                            .frame(width: 80, height: 60)
                    } else {
                        Image(systemName: "camera.fill")
                            .resizable().foregroundColor(elementColor.opacity(0))
                            .frame(width: 80, height: 60)
                    }
                   

                    image?.resizable()
                        .scaledToFit()
                        .frame(maxWidth: 370, maxHeight: 100)
                        .clipped()
                }.onTapGesture {
                    showingImagePicker = true
                }
                
                VStack{
                    TextEditor(text: $text)
                        .frame(width: 370, height: 270).scrollIndicators(.hidden).disableAutocorrection(true)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(elementColor, lineWidth: 1)
                )
                
                Button {
                    save()
                } label: {
                    Text("Save")
                        .frame(width: 378 ,height: 44)
                        .fontWeight(.semibold)
                        .foregroundColor(fontColor)
                        .background(elementColor)
                        .cornerRadius(20)
                }

            }
            .onChange(of: inputImage) { _ in
                loadImage()
            }.sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save(){
        
    }
}

struct ImageAndJournalView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndJournalView()
    }
}
