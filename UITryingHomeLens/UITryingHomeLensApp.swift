import SwiftUI

@main
struct UITryingHomeLensApp: App {
    @State private var vm = HomeVM()

    var body: some Scene {
        WindowGroup(id: "main") {
            ContentView()
                .environment(vm)
        }
        .windowStyle(.plain)
        .defaultSize(width: 720, height: 520)

        WindowGroup(id: "device-detail", for: UUID.self) { $deviceID in
            if let deviceID {
                DeviceDetailView(deviceID: deviceID)
                    .environment(vm)
            }
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)
        .defaultSize(width: 260, height: 180)
    }
}
