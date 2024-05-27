import SwiftUI
import Charts

struct ContentView: View {
    @State private var viewModel = ViewModel()
    var body: some View {
        VStack {
            DailyStreamsChart(viewModel: $viewModel)
            HStack{
                Button(action: {
                    print("Next Week")
                }, label: {
                    Text("Next Week")
                })
                .frame(maxWidth: .infinity)
                Button(action: {
                    print("Last Week")
                }, label: {
                    Text("Last week")
                })
                .frame(maxWidth: .infinity)
            }
        }
    }
}

extension ContentView {
    @Observable
    class ViewModel {
        private var dailyData: [TrackData]
        private let numberOfDays = 6
        // Shows the curentIndex of the last day
        var currentIndex: Int = -1
        
        var isForwardEnabled: Bool {
            return self.currentIndex < dailyData.count - numberOfDays
        }
        
        var isBackwardEnabled: Bool {
            return self.currentIndex - numberOfDays > 0
        }
        
        var plottableData: [TrackData] {
            if currentIndex < numberOfDays {
                return Array(dailyData[0...currentIndex])
            }
            
            return Array(dailyData[currentIndex - numberOfDays...currentIndex])
        }
        
        init() {
            self.dailyData = TrackData.dailyStreamsData()
            currentIndex = self.dailyData.count - 1
        }
    }
}

#Preview {
    ContentView()
}
