import SwiftUI
import Charts

struct ContentView: View {
    @State private var interval: IntervalType = .monthly
    var body: some View {
        VStack {
            DailyStreamsChart(interval: $interval)
            HStack{
                Button(action: {
                    interval = .daily
                    print("Next Week")
                }, label: {
                    Text("Next Week")
                })
                .frame(maxWidth: .infinity)
                Button(action: {
                    interval = .monthly
                    print("Last Week")
                }, label: {
                    Text("Last week")
                })
                .frame(maxWidth: .infinity)
            }
        }

    }
}

#Preview {
    ContentView()
}
