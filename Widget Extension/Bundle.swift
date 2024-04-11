import WidgetKit
import SwiftUI

@main
struct LiveActivityBundle: WidgetBundle {
    
    var body: some Widget {
        LiveActivityWidget()
        // You can define here other widgets
    }
}

struct LiveActivityWidget: Widget {
    
    let kind: String = "LiveActivityWidget"
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActivityAttribute.self) { context in
            Text("Lock Screen value: \(context.state.dynamicStringValue)")
                .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("L: \(context.state.dynamicStringValue)" )
                        .foregroundColor(.secondary)
                        // If you want extend leading area, use this:
                        //.dynamicIsland(verticalPlacement: .belowIfTooWide)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("R: \(context.attributes.staticStringValue)")
                        .foregroundColor(.secondary)
                        // If you want extend trailing area, use this:
                        //.dynamicIsland(verticalPlacement: .belowIfTooWide)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.dynamicStringValue)
                        .fontWeight(.semibold)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                        .foregroundColor(.secondary)
                }
            } compactLeading: {
                Text("L: \(context.state.dynamicStringValue)" )
            } compactTrailing: {
                Text("R: \(context.attributes.staticStringValue)")
            } minimal: {
                Text("Min")
            }
            .keylineTint(.white)
        }
    }
}
