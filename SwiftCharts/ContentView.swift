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
                    print("Daily")
                }, label: {
                    Text("Daily")
                })
                .frame(maxWidth: .infinity)
                Button(action: {
                    interval = .monthly
                    print("Monthly")
                }, label: {
                    Text("Monthly")
                })
                .frame(maxWidth: .infinity)
                Button(action: {
                    interval = .yearly
                    print("Yearly")
                }, label: {
                    Text("Yearly")
                })
                .frame(maxWidth: .infinity)
            }
        }

    }
}

#Preview {
    ContentView()
}
