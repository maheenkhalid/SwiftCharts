import SwiftUI
import Charts

struct BarChart: View {
    @State private var chartSelection: String? = "Forever"
    @Binding var interval: IntervalType

    let data = TrackData.dummyData

    var body: some View {
        Chart {
            ForEach(data) { trackData in
                BarMark(
                    x: .value("Track", trackData.trackName),
                    y: .value("Total streams", trackData.streamsPlayed)
                )
                .foregroundStyle(getColorForTrack(trackName: trackData.trackName))
            }

            if let chartSelection {
                RuleMark(x: .value("Track", chartSelection))
                    .foregroundStyle(.gray.opacity(0.5))
                    .annotation(
                        position: .top,
                        overflowResolution: .init(x: .fit, y: .disabled)
                    ) {
                        ZStack {
                            VStack {
                                Text("\(chartSelection)")
                                Text("Artist: \(data.first { $0.trackName == chartSelection }?.artist ?? "")")
                                Text("\(getStreamsPlayed(for: chartSelection).formatted(.number.precision(.fractionLength(0)))) streams")
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(Color.accentColor.opacity(0.2))
                        }
                    }
            }
        }
        .frame(height: 300)
        .padding()
        .chartXSelection(value: $chartSelection)

    }

    func getStreamsPlayed(for track: String) -> Double {
        data.first { $0.trackName == track }?.streamsPlayed ?? 0
    }

    func getColorForTrack(trackName: String) -> Color {
        guard let chartSelection = chartSelection else { return Color.accentColor }

        return trackName == chartSelection ? Color.accentColor : Color.accentColor.opacity(0.5)
    }
}
