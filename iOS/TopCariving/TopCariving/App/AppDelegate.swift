//
//  AppDelegate.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        for string in blueImages {
            ImageService.shared.prefetchImage(stringURL: string)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

let blueImages = [
    "https://i.ibb.co/hgwR5XW/blue-image-060.png",
    "https://i.ibb.co/VYX3jNs/blue-image-059.png",
    "https://i.ibb.co/WcpyGZF/blue-image-058.png",
    "https://i.ibb.co/kS3K2Dh/blue-image-057.png",
    "https://i.ibb.co/nQtTpzf/blue-image-056.png",
    "https://i.ibb.co/sWvKc4H/blue-image-055.png",
    "https://i.ibb.co/mCSXw9m/blue-image-054.png",
    "https://i.ibb.co/HKqF80c/blue-image-053.png",
    "https://i.ibb.co/hmYt2Jz/blue-image-052.png",
    "https://i.ibb.co/MhdLjmd/blue-image-051.png",
    "https://i.ibb.co/5rwhVSy/blue-image-050.png",
    "https://i.ibb.co/tw6zGN7/blue-image-049.png",
    "https://i.ibb.co/LhWDY9L/blue-image-048.png",
    "https://i.ibb.co/NrqRY7Q/blue-image-047.png",
    "https://i.ibb.co/9HDFDLD/blue-image-046.png",
    "https://i.ibb.co/pzThx8s/blue-image-045.png",
    "https://i.ibb.co/Rhk7cpW/blue-image-044.png",
    "https://i.ibb.co/mvrPk7v/blue-image-043.png",
    "https://i.ibb.co/6DYrWdm/blue-image-042.png",
    "https://i.ibb.co/QHqd3mm/blue-image-041.png",
    "https://i.ibb.co/9G7W8Bp/blue-image-040.png",
    "https://i.ibb.co/k8zy9qM/blue-image-039.png",
    "https://i.ibb.co/CJ7tQx9/blue-image-038.png",
    "https://i.ibb.co/wQLxnMh/blue-image-037.png",
    "https://i.ibb.co/G2TkRvy/blue-image-036.png",
    "https://i.ibb.co/gMcSh39/blue-image-035.png",
    "https://i.ibb.co/QDRZ3pH/blue-image-034.png",
    "https://i.ibb.co/smv187p/blue-image-033.png",
    "https://i.ibb.co/TWx39jz/blue-image-032.png",
    "https://i.ibb.co/L1Y5Y9j/blue-image-031.png",
    "https://i.ibb.co/NCFZrSw/blue-image-030.png",
    "https://i.ibb.co/YW4qrJ1/blue-image-029.png",
    "https://i.ibb.co/0QG4jSM/blue-image-028.png",
    "https://i.ibb.co/WHNdj6B/blue-image-027.png",
    "https://i.ibb.co/MSt1VwN/blue-image-026.png",
    "https://i.ibb.co/hgz2kR5/blue-image-025.png",
    "https://i.ibb.co/M1BYJks/blue-image-024.png",
    "https://i.ibb.co/7zttkK4/blue-image-023.png",
    "https://i.ibb.co/rkXB8Yt/blue-image-022.png",
    "https://i.ibb.co/GFQgwVZ/blue-image-021.png",
    "https://i.ibb.co/DtNKR1f/blue-image-020.png",
    "https://i.ibb.co/TKSKBcq/blue-image-019.png",
    "https://i.ibb.co/r3KgmtM/blue-image-018.png",
    "https://i.ibb.co/K9hGYzb/blue-image-017.png",
    "https://i.ibb.co/BHpM8mQ/blue-image-016.png",
    "https://i.ibb.co/2kSXkkN/blue-image-015.png",
    "https://i.ibb.co/ZzJZWX7/blue-image-014.png",
    "https://i.ibb.co/jg12tLL/blue-image-013.png",
    "https://i.ibb.co/HHkpYQN/blue-image-012.png",
    "https://i.ibb.co/WghgVJV/blue-image-011.png",
    "https://i.ibb.co/pQRDwnn/blue-image-010.png",
    "https://i.ibb.co/kyJ6VYf/blue-image-009.png",
    "https://i.ibb.co/0J837z5/blue-image-008.png",
    "https://i.ibb.co/3Nz6qhW/blue-image-007.png",
    "https://i.ibb.co/pnXWLvQ/blue-image-006.png",
    "https://i.ibb.co/LptCCHd/blue-image-005.png",
    "https://i.ibb.co/9y7VFMh/blue-image-004.png",
    "https://i.ibb.co/3kjQFb7/blue-image-003.png",
    "https://i.ibb.co/2Pf7Wnw/blue-image-002.png",
    "https://i.ibb.co/sFwsKwQ/blue-image-001.png",
].reversed().map { String($0) }
