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
        .init(trackName: "Locked Out of Heaven", artist: "Bruno Mars", streamsPlayed: 39000, date: Date()),
        .init(trackName: "Domino", artist: "Jessie J", streamsPlayed: 63000, date: Date()),
        .init(trackName: "Wake Me Up", artist: "Avicii", streamsPlayed: 46000, date: Date()),
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
            streamData.insert(data, at: 0)
        }

        return streamData
    }
}

enum Direction {
    case forwards
    case backwards
    case none
}
