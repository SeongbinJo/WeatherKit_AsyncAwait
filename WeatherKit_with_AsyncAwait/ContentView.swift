//
//  ContentView.swift
//  WeatherKit_with_AsyncAwait
//
//  Created by 조성빈 on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                textForcastView()
                dayForcastBoxView()
                tenDaysForcast()
            }
            .padding()
        }
    }
    
    func textForcastView() -> some View {
        VStack(alignment: .center) {
            Text("나의 위치")
                .font(.largeTitle)
            Text("부산광역시")
                .font(.caption)
            Text("20도")
                .font(.system(size: 80))
                .fontWeight(.light)
            Text("흐림")
                .fontWeight(.semibold)
            Text("최고: 25° 최저: 19°")
                .fontWeight(.semibold)
        }
        .padding(.vertical, 70)
    }
    
    func dayForcastBoxView() -> some View {
        VStack(alignment: .leading) {
            Text("오늘 밤 흐린 상태가 예상되며, 아침까지 이어지겠습니다. 돌풍의 풍속은 최대 2m/s입니다.")
                .font(.system(size: 14))
            Rectangle()
                .frame(height: 0.4)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 27) {
                    ForEach(0..<27, id: \.self) { _ in
                        VStack(spacing: 10) {
                            Text("시간대")
                            Image(systemName: "cloud.fill")
                            Text("20°")
                        }
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray)
        }
    }
    
    func tenDaysForcast() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: "calendar")
                Text("10일간의 일기예보")
            }
            .font(.system(size: 13))
            .padding(.top, -7.5)
            ForEach(0..<10, id: \.self) { _ in
                VStack(spacing: 10) {
                    Rectangle()
                        .frame(height: 0.4)
                    HStack(alignment: .center) {
                        Text("오늘")
                        Spacer()
                        VStack {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 20))
                            Text("40%")
                                .font(.system(size: 12))
                        }
                        Spacer()
                        HStack {
                            Text("19°")
                            Text("--------")
                            Text("25°")
                        }
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    ContentView()
}
