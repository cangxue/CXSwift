// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func releaseLane() {
	    desc("Push a new release build to the App Store")
		buildApp(workspace: "CXSwift.xcworkspace", scheme: "CXSwift")
		uploadToAppStore(username: "zhaoxianglong@hehegames.cn", app: "com.hehegames.hhyuejumajiang")
	}
    
    func dev() {
        buildApp(
            workspace: "CXSwift.xcworkspace",
            scheme: "CXSwift",
            clean: true,
            outputDirectory: "/Users/mahongyang/Desktop/",
            outputName: "CXSwift_20210302.ipa",
            exportMethod: "ad-hoc"
        )
    }
    
}
