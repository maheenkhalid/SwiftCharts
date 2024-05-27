import SwiftUI
import Charts

struct DailyStreamsChart: View {
    @Binding var interval: IntervalType
    var body: some View {
        Chart {
            ForEach(getData()) { trackData in
                LineMark(
                    x: .value("Date", trackData.date),
                    y: .value("Streams", trackData.streamsPlayed)
                )
                .interpolationMethod(.catmullRom)
                AreaMark(
                    x: .value("Date", trackData.date),
                    y: .value("Streams", trackData.streamsPlayed)
                )
                .interpolationMethod(.catmullRom)
            }
        }
    }

    private func getData() -> [TrackData] {
        switch interval {
        case .daily:
            TrackData.dailyStreamsData()
        case .monthly:
            TrackData.monthlyStreamsData()
        case .yearly:
            TrackData.monthlyStreamsData()
        }
    }
}

#Preview {
    DailyStreamsChart(interval: .constant(.daily))
}
