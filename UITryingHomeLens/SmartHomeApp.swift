//// SmartHomeApp.swift
//// SmartHomeVision
////
//// A spatial Smart Home controller for Apple Vision Pro.
//// Uses mock data — no HomeKit dependency. Runs on visionOS Simulator.
//
//import SwiftUI
//
//@main
//struct SmartHomeApp: App {
//
//    @State private var homeData = MockHomeData()
//    @State private var immersiveSpaceIsShown = false
//    @State private var immersiveSpaceID = "SmartHomeSpace"
//
//    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
//    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
//
//    var body: some Scene {
//
//        // MARK: – Launcher Window
//        WindowGroup {
//            ContentView(
//                immersiveSpaceIsShown: $immersiveSpaceIsShown,
//                openSpace: { await openSpace() },
//                dismissSpace: { await closeSpace() }
//            )
//            .environment(homeData)
//        }
//        .windowStyle(.plain)
//        .defaultSize(width: 480, height: 560)
//
//        // MARK: – Immersive Space (pass-through mixed)
//        ImmersiveSpace(id: immersiveSpaceID) {
//            ImmersiveHomeView()
//                .environment(homeData)
//        }
//        .immersionStyle(selection: .constant(.mixed), in: .mixed)
//    }
//
//    // MARK: – Space Lifecycle
//
//    private func openSpace() async {
//        let result = await openImmersiveSpace(id: immersiveSpaceID)
//        switch result {
//        case .opened:
//            immersiveSpaceIsShown = true
//        case .error, .userCancelled:
//            immersiveSpaceIsShown = false
//        @unknown default:
//            immersiveSpaceIsShown = false
//        }
//    }
//
//    private func closeSpace() async {
//        await dismissImmersiveSpace()
//        immersiveSpaceIsShown = false
//    }
//}
