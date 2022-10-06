//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Mucha Naibei on 04/10/2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                             }
                
            ForEach(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
            .navigationTitle("Kenyan Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
       /* ForEach(["Mucha's iPhone sim"/*, "iPhone 14 Pro", "iPad mini (6th generation)", "iPhone 8", "iPhone 13 Pro Max", "iPhone 14 Pro Max"*/], id: \.self){
            deviceName in LandmarkList()
            
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }*/
    }
}
