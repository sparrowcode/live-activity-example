import ActivityKit

// Shared Attribute-model between main target and widget targe

struct ActivityAttribute: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        
        // Dynamic properties.
        // Can be updated when Live Actvity created.
        
        var dynamicStringValue: String
        var dynamicIntValue: Int
        var dynamicBoolValue: Bool
        
    }
    
    // Static properties.
    // Used only when make live actvity.
    // Can't update it later.
    
    var staticStringValue: String
    var staticIntValue: Int
    var staticBoolValue: Bool
}
