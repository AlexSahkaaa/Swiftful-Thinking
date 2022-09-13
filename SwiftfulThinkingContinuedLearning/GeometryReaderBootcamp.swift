//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Alex Kolsa on 13.09.2022.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(index % 2 == 0 ? Color.blue : Color.red)
                            .rotation3DEffect(
                                Angle(degrees: getPercantage(geo: geometry) * 20),
                                axis: (x: 0, y: 1.0, z: 0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    
    func getPercantage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
