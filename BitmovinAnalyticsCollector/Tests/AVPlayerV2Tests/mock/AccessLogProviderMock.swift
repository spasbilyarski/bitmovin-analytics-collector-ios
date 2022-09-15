import Foundation

#if !SWIFT_PACKAGE
@testable import BitmovinAnalyticsCollector
#endif

#if SWIFT_PACKAGE
import AVPlayerCollector
import CoreCollector
#endif

class AccessLogProviderMock: AccessLogProvider {
    var events: [AccessLogDto]? = nil

    func getEvents() -> [AccessLogDto]? {
        return events
    }
}
