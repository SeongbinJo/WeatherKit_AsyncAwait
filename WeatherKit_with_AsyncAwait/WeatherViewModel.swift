//
//  WeatherViewModel.swift
//  WeatherKit_with_AsyncAwait
//
//  Created by 조성빈 on 6/26/24.
//

import Foundation
import CoreLocation
import WeatherKit

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let weatherService = WeatherService.shared
    
    @Published var location: CLLocation?
    @Published var error: Error?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    }
    
    // 사용자 위치 불러오기
    func requestLocation() {
        manager.requestLocation()
    }
    
    func fetchWeather(for location: CLLocation) async {
        guard let location = self.location else {
            print("위치 정보 없음.")
            return
        }
        
        do {
            let forcast = try await weatherService.weather(for: location, including: .current)
        } catch {
            self.error = error
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        print(location ?? "-")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        self.error = error
    }
}
