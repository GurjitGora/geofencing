import MapKit
import SwiftUI
import CoreLocationUI

struct MapView: View {
    
    @StateObject private var mapViewModel = MapViewModel()
        
    var body: some View {
        ZStack {

            Map(coordinateRegion: $mapViewModel.region,
                interactionModes: .all,
                showsUserLocation: true
            )
            .ignoresSafeArea()
            .accentColor(.teal)
            .onAppear(perform: mapViewModel.checkLocationEnabled)
            .overlay(
                Circle()
                    .strokeBorder(Color.green,lineWidth: 4)
                    .frame(width: 44, height: 44) // just drawn circle on center of the screen not onto region radius
                  
            )
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel())
    }
}
