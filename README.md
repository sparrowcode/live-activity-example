# Live Activity Example

![Live Actvitiy Example Prject](https://cdn.sparrowcode.io/tutorials/live-activities/header-with-corner.png)

Example how to make, update and end Live Activity. With Dynamic Island and Lock Screen.

## Preparing

Add Widget target:

![New Widget Target](https://cdn.sparrowcode.io/tutorials/live-activities/add-widget-target.png)

Or skip it if already supporting widgets. Next add to `Info.plist` key `Supports Live Activities` to true:

```
<key>NSSupportsLiveActivities</key>
<true/>
```

## Model

Define model-data:

```swift
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
```

## UI

Define `Widget` wrapper:

```swift
struct LiveActivityWidget: Widget {
    
    let kind: String = "LiveActivityWidget"
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActivityAttribute.self) { context in
            // UI for lock screen
        } dynamicIsland: { context in
            // UI for Dynamic Island
        }
    }
}
```
