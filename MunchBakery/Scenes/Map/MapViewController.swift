//
//  MapViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var placeTableView: PlaceTableView!
    @IBOutlet weak var selectButtonOutlet: UIButton!
    @IBOutlet weak var gpsButtonOutlet: UIButton!
    
    // MARK: - Properties
    
    var shouldShowUserLocation = false
    var placeDataItems = [PlaceEntity]()
    private var locationManager: CLLocationManager?
    private var locationRepo: LocationRepository?
    
    var shouldLoadLocations = true
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationMonitoring()
        self.locationRepo = LocationRepository()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if shouldLoadLocations {
            self.locationRepo?.loadFromApi(completion: { (locations, error) in
                
            })
        }
        
        self.placeDataItems = [
            PlaceEntity.initPlace(name: "Al Hijran", distance: 300, workingHours: "02:30 PM - 11:00 PM", phoneNumber: "920015010"),
            PlaceEntity.initPlace(name: "Obhur", distance: 400, workingHours: "02:30 PM - 06:00 PM", phoneNumber: "920015010"),
            PlaceEntity.initPlace(name: "Tabuk", distance: 560, workingHours: "02:30 PM - 11:00 PM", phoneNumber: "920015010"),
            PlaceEntity.initPlace(name: "Al Hijran", distance: 700, workingHours: "02:30 PM - 11:00 PM", phoneNumber: "920015010"),
            PlaceEntity.initPlace(name: "Obhur", distance: 990, workingHours: "02:30 PM - 06:00 PM", phoneNumber: "920015010")
        ]
        self.placeTableView.placeItems = self.placeDataItems
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if locationManager != nil {
            locationManager?.stopUpdatingLocation()
        }
    }
    
    // MARK: - Private methods
    
    private func initLocationMonitoring() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        }
    }
    
    // MARK: - Actions

    @IBAction func locateUserButtonTapped(_ sender: UIButton) {
        guard let userCoordinates = map.userLocation.location?.coordinate else { return }
        map.setCenter(userCoordinates, animated: true)
    }
    
}

// MARK: - UIStyling methods

extension MapViewController: UIStyling {
    
    func setupViews() {
        placeTableView.isHidden = shouldShowUserLocation
        gpsButtonOutlet.isHidden = !shouldShowUserLocation
        selectButtonOutlet.isHidden = !shouldShowUserLocation
        
        DispatchQueue.main.async {
            self.gpsButtonOutlet.layer.cornerRadius = self.gpsButtonOutlet.frame.height / 2
            self.gpsButtonOutlet.layer.masksToBounds = true
            self.selectButtonOutlet.layer.cornerRadius = 20
        }
    }
    
    func setupConstraints() {
        
    }
    
}

// MARK: - CLLocationManagerDelegate methods
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: center, span: span)
        map.setRegion(region, animated: true)
        
    }
    
}
