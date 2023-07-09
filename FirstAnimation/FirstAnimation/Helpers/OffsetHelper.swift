//
//  OffsetHelper.swift
//  FirstAnimation
//
//  Created by Doğu GNR on 4.07.2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
  
}

extension View {
    @ViewBuilder
    func offsetExtractor(coordinateSpace: String, complation: @escaping (CGRect) -> ()) ->
    some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .named(coordinateSpace))
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self, perform: complation)
                }
            }
    }
}

struct OffsetHelper_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
