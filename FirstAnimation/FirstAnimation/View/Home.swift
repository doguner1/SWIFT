//
//  Home.swift
//  FirstAnimation
//
//  Created by Doğu GNR on 3.07.2023.
//

import SwiftUI

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    
    @State private var scrollProgress: CGFloat = 0
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            VStack(spacing:12) {
                Image("IMG_0308")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                //Adding blur and reducing size based on Scroll Progress
                    .frame(width: 130 - (75 * scrollProgress ), height: 130 - (75 * scrollProgress))
                //Hiding Main View so that the Dynmaic Island Metaball Effect will be Visible
                    .opacity(1 - scrollProgress)
                    .blur(radius: scrollProgress * 10 , opaque: true)
                    .clipShape(Circle())
                    .anchorPreference(key: AnchorKey.self, value: .bounds, transform: {
                        return ["HEADER" : $0]
                    })
                    .padding(.top, safeArea.top + 15)
                    .offsetExtractor(coordinateSpace: "SCROLLVIEW") { scrollRect in
                        let progress = -scrollRect.minY / 25
                        scrollProgress = min(max(progress, 0), 1)
                    }
                Text("İG: doguner1")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical,15)
                
                SampleRows()
            }
            .frame(maxWidth: .infinity)
        }
        .backgroundPreferenceValue(AnchorKey.self, { pref in
            GeometryReader { proxy in
                if let anchor = pref["HEADER"] {
                    let frameRect = proxy[anchor]
                    
                    Canvas{ out , size in
                        out.addFilter(.alphaThreshold(min: 0.5))
                        out.addFilter(.blur(radius: 12))
                        
                        out.drawLayer { ctx in
                            if let headerView = out.resolveSymbol(id: 0) {
                                ctx.draw(headerView, in: frameRect)
                            }
                            
                            if let dynmaicIsland = out.resolveSymbol(id: 1) {
                                let rect = CGRect(x: (size.width - 120 ) / 2, y: 11, width: 120, height: 37)
                                ctx.draw(dynmaicIsland, in: rect)
                            }
                        }
                    } symbols: {
                        HeaderView(frameRect)
                            .tag(0)
                            .id(0)
                        
                        DynamicIslandCapsule()
                        .tag(1)
                        .id(1)
                    }
    
                }
            }
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(colorScheme == .dark ? .black : .white)
                    .frame(height: 15)
            }
        })
        .coordinateSpace(name: "SCROLLVIEW")
    }
    
    
    @ViewBuilder
    func HeaderView(_ frameRect: CGRect) -> some View {
        Circle()
            .fill(.black)
            .frame(width: frameRect.width, height: frameRect.height)
    }
    
    @ViewBuilder
    func DynamicIslandCapsule(_ height: CGFloat = 37) -> some View {
        Circle()
            .fill(.black)
            .frame(width: 120 , height: height)
    }
    
    @ViewBuilder
    func SampleRows() -> some View {
        VStack {
            ForEach(1...20, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 6 ) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 25)
                    
                    RoundedRectangle(cornerRadius: 5 , style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 25)
                        .padding(.trailing, 50)
                    
                    RoundedRectangle(cornerRadius: 5 , style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .padding(.trailing, 50)
                }
            }
          
            
        }
        
        .padding(.horizontal, 15)
        .padding(.bottom, safeArea.bottom + 15)
        
        
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
