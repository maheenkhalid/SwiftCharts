import SwiftUI
import Charts

struct ContentView: View {
    @State private var viewModel = ViewModel()
    var body: some View {
        VStack {
            DailyStreamsChart(viewModel: $viewModel)
            HStack{
                Button(action: {
                    viewModel.moveBack()
                }, label: {
                    Text("Last week")
                })
                .disabled(viewModel.isBackwardDisabled)
                .frame(maxWidth: .infinity)
                Button(action: {
                    viewModel.moveForward()
                }, label: {
                    Text("Next Week")
                })
                .disabled(viewModel.isForwardDisabled)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

extension ContentView {
    @Observable
    class ViewModel {
        /// Refers to the original array of data
        private var dailyData: [TrackData]

        /// Refers to the number of days to be shown at one time
        private let numberOfDays = 6

        /// Shows the curentIndex of the last day
        private var currentIndex: Int = -1

        /// Refers to if the "Next Week" button is enabled
        var isForwardDisabled: Bool {
          return !(self.currentIndex < dailyData.count - numberOfDays)
        }

        /// Refers to if the "Last Week" button is enabled
        var isBackwardDisabled: Bool {
          return !(self.currentIndex - numberOfDays > 0)
        }

        /// Refers to the 7-point data used to plot the chart
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
        
        func moveBack() {
            if currentIndex - numberOfDays > 0 {
                currentIndex = currentIndex - numberOfDays
            }
        }
        
        func moveForward() {
            if currentIndex + numberOfDays <= dailyData.count {
                currentIndex = currentIndex + numberOfDays
            } else {
                currentIndex = dailyData.count - 1
            }
        }
    }
}

#Preview {
    ContentView()
}
