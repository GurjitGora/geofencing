import MapKit
import SwiftUI
import CoreLocationUI

struct MapView: View {
    
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $mapViewModel.region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: mapViewModel.locations) { location in
                MapAnnotation(coordinate: mapViewModel.locations.first!.coordinate) {
                        Circle()
                        .stroke(.red.opacity(0.4), lineWidth: 4)
                            .scaledToFill()
                            .frame(width: 44, height: 44)
                    // 44 is Apple's minimum size for any screen (Magic number)
                    }
            }
            .ignoresSafeArea()
            .accentColor(.accentColor)
            .onAppear(perform: mapViewModel.checkLocationEnabled)
            
//            LocationButton(.currentLocation){
//
//            }
//            .foregroundColor(.white)
//            .cornerRadius(10)
//            .labelStyle(.iconOnly)
//            .padding(.bottom,10)
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel())
    }
}
