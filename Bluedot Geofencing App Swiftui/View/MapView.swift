import MapKit
import SwiftUI
import CoreLocationUI

struct MapView: View {
    
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        ZStack {
//            Map(coordinateRegion: $mapViewModel.region,
//                interactionModes: .all,
//                showsUserLocation: true,
//            )
            Map(coordinateRegion: $mapViewModel.region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: mapViewModel.locations) { location in
                MapAnnotation(coordinate: mapViewModel.locations.first!.coordinate) {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
            }
            .ignoresSafeArea()
            .accentColor(.teal)
            .onAppear(perform: mapViewModel.checkLocationEnabled)

        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel())
    }
}
