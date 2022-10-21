import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Dynamic Island Example"
        view.backgroundColor = .systemBackground
        
        let appearance = UIToolbarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.toolbar.standardAppearance = appearance
        navigationController?.toolbar.scrollEdgeAppearance = appearance
        
        navigationController?.isToolbarHidden = false
        self.toolbarItems = [
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: .init(systemName: "play.fill")!, style: .done, target: self, action: #selector(makeLiveActivity)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(title: "Update Value", style: .done, target: self, action: #selector(updateLiveActivity)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: .init(systemName: "stop.fill")!, style: .done, target: self, action: #selector(stopAllLiveActivities)),
            UIBarButtonItem(systemItem: .flexibleSpace)
        ]
    }
    
    @objc func makeLiveActivity() {
        LiveActivityService.makeActivity(value: "Init Value")
    }
    
    @objc func updateLiveActivity() {
        if let first = LiveActivityService.activities.first {
            LiveActivityService.updateActivity(first, value: "New \(Int.random(in: 1...1000))")
        }
    }
    
    @objc func stopAllLiveActivities() {
        for actvity in LiveActivityService.activities {
            LiveActivityService.endActivity(actvity)
        }
    }
}

