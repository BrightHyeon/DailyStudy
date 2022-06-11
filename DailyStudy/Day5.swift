//
//  Day5.swift
//  DailyStudy
//
//  Created by Hyeonsoo Kim on 2022/06/08.
//

import SwiftUI
import MapKit

struct Day5: View {
    @EnvironmentObject var viewModel: Day5ViewModel
    
    var body: some View {
        ZStack {
            MapView(annotations: viewModel.locations)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = viewModel.region.center
                        viewModel.locations.append(newLocation)
                    } label: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                            )
                    }
                }
            }
        }
    }
}

struct Day5_Previews: PreviewProvider {
    static var previews: some View {
        Day5()
            .environmentObject(Day5ViewModel())
    }
}


//MARK: UIView
struct MapView: UIViewRepresentable {
    @EnvironmentObject var viewModel: Day5ViewModel
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = viewModel.region
        return mapView
    }
    
    func updateUIView(_ mkMapView: MKMapView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        let parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.viewModel.region.center = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            return MKAnnotationView()
        }
    }
}


//MARK: ViewModel...
final class Day5ViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    @Published var locations = [MKPointAnnotation]()
}


//MARK: Default Location...
enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 33.465256, longitude: 126.934102)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
}

class CustomAnnotationView: MKAnnotationView {
    
    static let identifier = "CustomAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 40, height: 50)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
  let emotion: String
  let coordinate: CLLocationCoordinate2D

  init(emotion: String, coordinate: CLLocationCoordinate2D) {
    self.emotion = emotion
    self.coordinate = coordinate

    super.init()
  }

}
