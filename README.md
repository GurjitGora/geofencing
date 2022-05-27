# Geofencing using CoreLocation and Mapkit
> Built using SwiftUI 5.6

## How to Run
**The project uses a custom location**
> latitude: -37.81785423438109, longitude:  144.97973738630145
**The geofence region is set to these coordinates and the custome device location should also refer to the same.**
**The Notification triggers when device is locked after updating the location or application is in background**

**Implementation decision and trade-offs**
- Built using Newest SwiftUI 5.6 and Xcode 13.4
- Some of the inbuilt methods like calculating distance is changed 
- Due to that could not able to add distance in meters
- This project does not use any 3rd party libraries. 

**Project Architectural design**
- Project is build using MVVM model
- To reduce complexity 
- added more reactive programming with less code
- easy to debug code

**Area of Focus**
- Built with SwiftUI(declarative approach) 
- Because of SwiftUI app does not need AutoLayout
- It runs identical on all screen devices
- User can see Geofence boundries on screen
- Built on native libraries
- lighweight code

**References**
- @twostraws, P 2022, Scheduling local notifications - a free Hacking with iOS: SwiftUI Edition tutorial, viewed 27 May, 2022, <https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications>.
- @twostraws, P 2022, Integrating MapKit with SwiftUI - a free Hacking with iOS: SwiftUI Edition tutorial, viewed 27 May, 2022, <https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui>.
- Anon 2022, Distance between CLLocationCoordinate2D values, viewed 27 May, 2022, <https://www.ralfebert.com/swift/cllocationcoordinate2d-distance/>.


**Time Spent**
- total 2 Hours spent 

**Notes**
- I have tried to implement back to current location but it did not worked.
- Due to time constraint I could not do much with this app.
- For eg. Add custom regions, change map tiles, draw navigation route from region to user location and so on
