//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Alex Kolsa on 13.09.2022.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel?
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<10) { index in
                Button {
                    selectedModel = RandomModel(title: "Sheet number \(index)")
                } label: {
                    Text("Button \(index)")
                }

            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
