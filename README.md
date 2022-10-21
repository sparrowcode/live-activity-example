![](https://cdn.sparrowcode.io/tutorials/live-activities/live-activity-type-compact.png)

# Live Activity Example

Example how to make, update and end Live Activity. With Dynamic Island and Lock Screen.

> Live Activity already enabled for upload with Xcode 14.1 RC. Supported only for iOS >=16.1

## Preparing Project

Add Widget target:

<img src="https://cdn.sparrowcode.io/tutorials/live-activities/add-widget-target.png" width="500">

Or skip it if already supporting widgets. Next add to `Info.plist` key `Supports Live Activities` to true:

```
<key>NSSupportsLiveActivities</key>
<true/>
```

## Define Model

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

## Add UI

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
