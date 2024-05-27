import Foundation

struct TrackData: Identifiable {
    var trackName: String
    var artist: String
    var streamsPlayed: Double
    var date: Date
    var id = UUID()

    static let dummyData: [TrackData] = [
        .init(trackName: "Espresso", artist: "Sabrina Carpenter", streamsPlayed: 65000, date: Date()),
        .init(trackName: "Chihiro", artist: "Billie Eilish", streamsPlayed: 36000, date: Date()),
        .init(trackName: "Forever", artist: "Loreen", streamsPlayed: 57000, date: Date()),
    ]

    static func dailyStreamsData() -> [TrackData] {
        let totalItems = 90 // daily data for past three months
        var streamData = [TrackData]()
        let todayComponents = Calendar.current.dateComponents([.year, .month, .day], from: .now)
        for i in 0..<totalItems {
            let randomStreams = Double.random(in: 10000...100000)
            let randomDate = Calendar.current.date(
                from: .init(
                    year: todayComponents.year,
                    month: todayComponents.month,
                    day: (todayComponents.day ?? 0) - i
                )
            )
            let data = TrackData(
                trackName: "Espresso",
                artist: "Sabrina Carpenter",
                streamsPlayed: randomStreams,
                date: randomDate ?? .now
            )
            streamData.append(data)
        }

        return streamData
    }

    static func monthlyStreamsData() -> [TrackData] {
        let totalItems = 3 // monthly data for past three months
        var streamData = [TrackData]()
        return streamData
    }


}

public enum IntervalType {
    case daily
    case monthly
    case yearly
}
