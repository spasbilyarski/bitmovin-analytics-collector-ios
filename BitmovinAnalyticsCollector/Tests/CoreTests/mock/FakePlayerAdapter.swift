import CoreMedia
@testable import BitmovinAnalyticsCollector

class FakePlayerAdapter: PlayerAdapter {
    func decorateEventData(eventData: EventData) {
        
    }
    
    func initialize() {
        
    }
    
    func stopMonitoring() {
        
    }
    
    func destroy() {
        
    }
    
    func resetSourceState() {
        
    }
    
    var drmDownloadTime: Int64?
    
    var currentTime: CMTime?
    
    var currentSourceMetadata: SourceMetadata?
}
