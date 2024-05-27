import SwiftUI
import Charts

struct DailyStreamsChart: View {
    @Binding var viewModel: ContentView.ViewModel
    var body: some View {
        Chart {
            ForEach(viewModel.plottableData) { trackData in
                BarMark(
                    x: .value("Date", trackData.date),
                    y: .value("Streams", trackData.streamsPlayed)
                )
            }
        }
        .frame(height: 300)
        .padding()
    }
}
