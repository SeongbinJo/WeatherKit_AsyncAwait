//
//  WeatherData.swift
//  WeatherKit_with_AsyncAwait
//
//  Created by 조성빈 on 6/26/24.
//

import Foundation

struct WeatherData: Codable {
    var temperature: Double // 섭씨 온도
    var description: String // 날씨 설명
    var humidity: Double // 습도
    var windSpeed: Double // 풍속
}
