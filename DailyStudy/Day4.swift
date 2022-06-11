//
//  Day4.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/08.
//
//  MKMapView Overlay
//  https://stackoverflow.com/questions/66375558/swiftui-map-overlays-without-uiviewrepresentable

import SwiftUI
import MapKit

struct Day4: View {
    @State private var route: MKPolyline?
    
    var body: some View {
        MapViewTest(route: $route)
            .onAppear {
                self.findCoffee()
            }
    }
}

struct Day4_Previews: PreviewProvider {
    static var previews: some View {
        Day4()
    }
}

private extension Day4 {
    func findCoffee() {
        let start = CLLocationCoordinate2D(latitude: 37.332693, longitude: -122.03071)
        let region = MKCoordinateRegion(center: start, latitudinalMeters: 2000, longitudinalMeters: 2000)

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "coffee"
        request.region = region

        MKLocalSearch(request: request).start { response, error in
            guard let destination = response?.mapItems.first else { return }

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
            request.destination = destination
            MKDirections(request: request).calculate { directionsResponse, _ in
                self.route = directionsResponse?.routes.first?.polyline
            }
        }
    }
}

struct MapViewTest: UIViewRepresentable {
    @Binding var route: MKPolyline?
    let mapViewDelegate = MapViewDelegate()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = mapViewDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        addRoute(to: view)
    }
}

class MapViewDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.red.withAlphaComponent(0.8)
        return renderer
    }
}

private extension MapViewTest {
    func addRoute(to view: MKMapView) {
        if !view.overlays.isEmpty {
            view.removeOverlays(view.overlays)
        }
        
        guard let route = route else { return }
        let mapRect = route.boundingMapRect
        view.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
        view.addOverlay(route)
    }
}
