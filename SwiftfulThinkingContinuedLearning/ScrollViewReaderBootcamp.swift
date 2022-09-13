//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Alex Kolsa on 12.09.2022.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText = ""
    @State var scrollToIndex = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 10)
                .keyboardType(.numberPad)
            
            Button("Click here to go to #\(textFieldText)") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
