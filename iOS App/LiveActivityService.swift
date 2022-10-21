import Foundation
import ActivityKit

enum LiveActivityService {
    
    /**
     Check if available to make new actviity.
     
     Also can observe state dynamicly.
     
     If not available to make new Live Activity, this may be reason:
     1. User lock Live Activity for application.
     2. Reached limit of Live Activities for system.
     */
    static var isEnabled: Bool {
        return ActivityAuthorizationInfo().areActivitiesEnabled
        
        // For observe state dynamicly
        /*
         for await enabled in ActivityAuthorizationInfo().activityEnablementUpdates {
         // Your Code
         }
         */
    }
    
    /**
     Get list all created activities.
     */
    static var activities: [Activity<ActivityAttribute>] {
        return Activity<ActivityAttribute>.activities
    }
    
    /**
     Make new activity.
     */
    static func makeActivity(value: String) {
        guard isEnabled else { return }
        
        // Using only when make new Live Activity
        let attributes = ActivityAttribute(staticStringValue: "Static", staticIntValue: 1, staticBoolValue: true)
        
        // Can be used for update Live activity later with other values
        let contentState = ActivityAttribute.ContentState(dynamicStringValue: value, dynamicIntValue: 2, dynamicBoolValue: true)
        
        do {
            let activity = try Activity<ActivityAttribute>.request(
                attributes: attributes,
                contentState: contentState
            )
            
            // For update by pushes you must have token
            // activity.pushToken
            
            print("LiveActivityService: \(activity.id) Live Activity created.")
        } catch {
            
            // You must to handle errors. It may happen:
            // 1. User lock Live Activity for application.
            // 2. Reached limit of Live Activities for system.
            print("LiveActivityService: Error when make new Live Activity: \(error.localizedDescription).")
        }
    }
    
    /**
     Update actviity.
     */
    static func updateActivity(_ activity: Activity<ActivityAttribute>, value: String) {
        
        // We can update only with `ContentState`.
        let contentState = ActivityAttribute.ContentState(dynamicStringValue: value, dynamicIntValue: 2, dynamicBoolValue: true)
        Task {
            await activity.update(using: contentState)
        }
    }
    
    /**
     End activity.
     */
    static func endActivity(_ activity: Activity<ActivityAttribute>) {
        
        // 1. For close Live Activity immediate.
        // It close Live Activity right now.
        Task {
            await activity.end(dismissalPolicy: .immediate)
        }
        
        /*
        // 2. If you want show user some action completed.
        // Live Activity closed when user saw it or maximum in 4 hours by system.
        let contentState = ActivityAttribute.ContentState(dynamicStringValue: "Finished", dynamicIntValue: 2, dynamicBoolValue: true)
        Task {
            await activity.end(using: contentState, dismissalPolicy: .default)
        }
         */
    }
}
