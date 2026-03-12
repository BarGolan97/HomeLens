////
////  ContentView.swift
////  HomeLens – Premium Smart Home Control
////
////  A fully redesigned, premium smart-home UI for Apple Vision Pro.
////  Replace your existing ContentView.swift with this file.
////
//
//import SwiftUI
//import Combine
//
//// MARK: - Design System
//
//struct DesignTokens {
//    // Palette
//    static let accent        = Color(red: 0.96, green: 0.76, blue: 0.42)   // warm gold
//    static let accentSoft    = Color(red: 0.96, green: 0.76, blue: 0.42).opacity(0.15)
//    static let surface       = Color.white.opacity(0.06)
//    static let surfaceHover  = Color.white.opacity(0.10)
//    static let border        = Color.white.opacity(0.10)
//    static let textPrimary   = Color.white
//    static let textSecondary = Color.white.opacity(0.55)
//    static let textTertiary  = Color.white.opacity(0.35)
//    static let danger        = Color(red: 1.0, green: 0.42, blue: 0.42)
//    static let success       = Color(red: 0.42, green: 0.90, blue: 0.60)
//    static let info          = Color(red: 0.45, green: 0.72, blue: 1.0)
//    
//    // Semantic device colors
//    static func deviceColor(for type: MockDeviceType, isOn: Bool) -> Color {
//        guard isOn else { return .white.opacity(0.25) }
//        switch type {
//        case .lightbulb:        return Color(red: 1.0, green: 0.88, blue: 0.55)
//        case .fan:              return info
//        case .airConditioner:   return Color(red: 0.55, green: 0.85, blue: 1.0)
//        case .heater:           return Color(red: 1.0, green: 0.55, blue: 0.35)
//        case .thermostat:       return Color(red: 1.0, green: 0.60, blue: 0.40)
//        case .securitySystem:   return success
//        case .doorLock:         return danger
//        case .outlet:           return success
//        case .airPurifier:      return Color(red: 0.55, green: 0.95, blue: 0.80)
//        case .humidifier, .dehumidifier, .faucets, .showerSystems, .sprinklers:
//            return info
//        case .door, .garageDoorOpener, .window, .windowCovering:
//            return accent
//        default: return accent
//        }
//    }
//    
//    // Corner radii
//    static let radiusSmall:  CGFloat = 12
//    static let radiusMedium: CGFloat = 20
//    static let radiusLarge:  CGFloat = 28
//    
//    // Shadows
//    static let glowRadius: CGFloat = 30
//}
//
//// MARK: - Mock Data Models
//
//enum MockDeviceType: String, CaseIterable {
//    case airConditioner, airPurifier, dehumidifier, door, doorLock, fan, faucets,
//         garageDoorOpener, heater, humidifier, lightbulb, outlet, programmableSwitch,
//         securitySystem, sensor, showerSystems, sprinklers, `switch`, thermostat,
//         window, windowCovering, other
//    
//    var displayName: String {
//        switch self {
//        case .airConditioner:     return "AC"
//        case .airPurifier:        return "Purifier"
//        case .dehumidifier:       return "Dehumidifier"
//        case .door:               return "Door"
//        case .doorLock:           return "Lock"
//        case .fan:                return "Fan"
//        case .faucets:            return "Faucet"
//        case .garageDoorOpener:   return "Garage"
//        case .heater:             return "Heater"
//        case .humidifier:         return "Humidifier"
//        case .lightbulb:          return "Light"
//        case .outlet:             return "Outlet"
//        case .programmableSwitch: return "Switch"
//        case .securitySystem:     return "Security"
//        case .sensor:             return "Sensor"
//        case .showerSystems:      return "Shower"
//        case .sprinklers:         return "Sprinkler"
//        case .switch:             return "Switch"
//        case .thermostat:         return "Climate"
//        case .window:             return "Window"
//        case .windowCovering:     return "Blinds"
//        case .other:              return "Device"
//        }
//    }
//}
//
//struct MockAccessory: Identifiable, Hashable {
//    let id: UUID
//    let name: String
//    let deviceType: MockDeviceType
//    
//    var iconName: String {
//        switch deviceType {
//        case .airConditioner:     return "snowflake"
//        case .airPurifier:        return "leaf.fill"
//        case .dehumidifier:       return "humidity.fill"
//        case .door:               return "door.left.hand.closed"
//        case .doorLock:           return "lock.fill"
//        case .fan:                return "fanblades.fill"
//        case .faucets:            return "drop.fill"
//        case .garageDoorOpener:   return "car.top.door.front.left.and.front.right.and.rear.left.and.rear.right.open"
//        case .heater:             return "flame.fill"
//        case .humidifier:         return "humidity.fill"
//        case .lightbulb:          return "lightbulb.fill"
//        case .outlet:             return "powerplug.fill"
//        case .programmableSwitch: return "button.programmable"
//        case .securitySystem:     return "shield.checkered"
//        case .sensor:             return "sensor.fill"
//        case .showerSystems:      return "shower.fill"
//        case .sprinklers:         return "sprinkler.and.droplets.fill"
//        case .switch:             return "switch.2"
//        case .thermostat:         return "thermometer.medium"
//        case .window:             return "window.vertical.open"
//        case .windowCovering:     return "blinds.vertical.closed"
//        case .other:              return "square.stack.3d.up.fill"
//        }
//    }
//    
//    var iconNameOn: String {
//        switch deviceType {
//        case .lightbulb:          return "lightbulb.max.fill"
//        case .door:               return "door.left.hand.open"
//        case .doorLock:           return "lock.open.fill"
//        case .securitySystem:     return "shield.checkered"
//        case .window:             return "window.vertical.open"
//        case .windowCovering:     return "blinds.vertical.open"
//        case .garageDoorOpener:   return "car.top.door.front.left.and.front.right.and.rear.left.and.rear.right.open"
//        default:                  return iconName
//        }
//    }
//    
//    func hash(into hasher: inout Hasher) { hasher.combine(id) }
//    static func == (lhs: MockAccessory, rhs: MockAccessory) -> Bool { lhs.id == rhs.id }
//}
//
//struct MockRoom: Identifiable, Hashable {
//    let id: UUID
//    let name: String
//    let accessories: [MockAccessory]
//    
//    var roomIcon: String {
//        switch name.lowercased() {
//        case let n where n.contains("living"):   return "sofa.fill"
//        case let n where n.contains("bed"):      return "bed.double.fill"
//        case let n where n.contains("kitchen"):  return "refrigerator.fill"
//        case let n where n.contains("entrance"): return "door.left.hand.open"
//        case let n where n.contains("garage"):   return "car.fill"
//        case let n where n.contains("bath"):     return "shower.fill"
//        case let n where n.contains("garden"):   return "leaf.fill"
//        default: return "square.split.2x2.fill"
//        }
//    }
//    
//    var activeCount: Int { 0 } // computed dynamically in views
//    
//    func hash(into hasher: inout Hasher) { hasher.combine(id) }
//    static func == (lhs: MockRoom, rhs: MockRoom) -> Bool { lhs.id == rhs.id }
//}
//
//struct MockHome: Identifiable, Hashable {
//    let id: UUID
//    let name: String
//    let rooms: [MockRoom]
//    func hash(into hasher: inout Hasher) { hasher.combine(id) }
//    static func == (lhs: MockHome, rhs: MockHome) -> Bool { lhs.id == rhs.id }
//}
//
//// MARK: - Mock HomeStore
//
//class MockHomeStore: ObservableObject {
//    @Published var homes: [MockHome]
//    @Published var selectedHome: MockHome?
//    @Published var deviceStates: [UUID: Bool] = [:]
//    @Published var brightnessLevels: [UUID: Int] = [:]
//    @Published var thermostatTemperatures: [UUID: Double] = [:]
//    @Published var thermostatModes: [UUID: Int] = [:]
//    @Published var doorPositions: [UUID: Int] = [:]
//    @Published var garageDoorPositions: [UUID: Int] = [:]
//    @Published var showerTemperatures: [UUID: Int] = [:]
//    
//    var totalActiveDevices: Int {
//        deviceStates.values.filter { $0 }.count
//    }
//    
//    func activeCount(for room: MockRoom) -> Int {
//        room.accessories.filter { deviceStates[$0.id] == true }.count
//    }
//    
//    init() {
//        let livingRoomLight = MockAccessory(id: UUID(), name: "Ceiling Light", deviceType: .lightbulb)
//        let tvOutlet = MockAccessory(id: UUID(), name: "TV Outlet", deviceType: .outlet)
//        let livingFan = MockAccessory(id: UUID(), name: "Ceiling Fan", deviceType: .fan)
//        let livingThermostat = MockAccessory(id: UUID(), name: "Thermostat", deviceType: .thermostat)
//        let livingAC = MockAccessory(id: UUID(), name: "AC Unit", deviceType: .airConditioner)
//        let livingSwitch = MockAccessory(id: UUID(), name: "Wall Switch", deviceType: .switch)
//        let livingRoom = MockRoom(id: UUID(), name: "Living Room", accessories: [
//            livingRoomLight, tvOutlet, livingFan, livingThermostat, livingAC, livingSwitch
//        ])
//        
//        let bedroomLight = MockAccessory(id: UUID(), name: "Bedside Lamp", deviceType: .lightbulb)
//        let bedroomFan = MockAccessory(id: UUID(), name: "Fan", deviceType: .fan)
//        let blinds = MockAccessory(id: UUID(), name: "Blinds", deviceType: .windowCovering)
//        let bedroomHeater = MockAccessory(id: UUID(), name: "Space Heater", deviceType: .heater)
//        let bedroomHumidifier = MockAccessory(id: UUID(), name: "Humidifier", deviceType: .humidifier)
//        let bedroomSensor = MockAccessory(id: UUID(), name: "Temp Sensor", deviceType: .sensor)
//        let bedroom = MockRoom(id: UUID(), name: "Bedroom", accessories: [
//            bedroomLight, bedroomFan, blinds, bedroomHeater, bedroomHumidifier, bedroomSensor
//        ])
//        
//        let kitchenLight = MockAccessory(id: UUID(), name: "Kitchen Light", deviceType: .lightbulb)
//        let kitchenFaucet = MockAccessory(id: UUID(), name: "Smart Faucet", deviceType: .faucets)
//        let kitchenOutlet = MockAccessory(id: UUID(), name: "Coffee Maker", deviceType: .outlet)
//        let kitchenPurifier = MockAccessory(id: UUID(), name: "Air Purifier", deviceType: .airPurifier)
//        let kitchenDehumidifier = MockAccessory(id: UUID(), name: "Dehumidifier", deviceType: .dehumidifier)
//        let kitchen = MockRoom(id: UUID(), name: "Kitchen", accessories: [
//            kitchenLight, kitchenFaucet, kitchenOutlet, kitchenPurifier, kitchenDehumidifier
//        ])
//        
//        let frontDoor = MockAccessory(id: UUID(), name: "Front Door", deviceType: .door)
//        let doorLock = MockAccessory(id: UUID(), name: "Smart Lock", deviceType: .doorLock)
//        let securitySystem = MockAccessory(id: UUID(), name: "Security", deviceType: .securitySystem)
//        let doorbell = MockAccessory(id: UUID(), name: "Doorbell", deviceType: .programmableSwitch)
//        let entrance = MockRoom(id: UUID(), name: "Entrance", accessories: [
//            frontDoor, doorLock, securitySystem, doorbell
//        ])
//        
//        let garageDoor = MockAccessory(id: UUID(), name: "Garage Door", deviceType: .garageDoorOpener)
//        let garageLight = MockAccessory(id: UUID(), name: "Garage Light", deviceType: .lightbulb)
//        let garage = MockRoom(id: UUID(), name: "Garage", accessories: [garageDoor, garageLight])
//        
//        let bathroomLight = MockAccessory(id: UUID(), name: "Bathroom Light", deviceType: .lightbulb)
//        let shower = MockAccessory(id: UUID(), name: "Smart Shower", deviceType: .showerSystems)
//        let bathroomWindow = MockAccessory(id: UUID(), name: "Window", deviceType: .window)
//        let bathroom = MockRoom(id: UUID(), name: "Bathroom", accessories: [bathroomLight, shower, bathroomWindow])
//        
//        let sprinkler = MockAccessory(id: UUID(), name: "Sprinkler", deviceType: .sprinklers)
//        let gardenLight = MockAccessory(id: UUID(), name: "Garden Light", deviceType: .lightbulb)
//        let otherDevice = MockAccessory(id: UUID(), name: "Weather Station", deviceType: .other)
//        let garden = MockRoom(id: UUID(), name: "Garden", accessories: [sprinkler, gardenLight, otherDevice])
//        
//        let home = MockHome(id: UUID(), name: "My Home", rooms: [
//            livingRoom, bedroom, kitchen, entrance, garage, bathroom, garden
//        ])
//        
//        self.homes = [home]
//        self.selectedHome = home
//        
//        for accessory in home.rooms.flatMap({ $0.accessories }) {
//            switch accessory.deviceType {
//            case .lightbulb:
//                deviceStates[accessory.id] = true
//                brightnessLevels[accessory.id] = 75
//            case .fan:
//                deviceStates[accessory.id] = true
//            case .thermostat:
//                deviceStates[accessory.id] = true
//                thermostatTemperatures[accessory.id] = 72
//            case .securitySystem:
//                deviceStates[accessory.id] = true
//            case .outlet:
//                deviceStates[accessory.id] = true
//            case .door:
//                doorPositions[accessory.id] = 0
//                deviceStates[accessory.id] = false
//            case .garageDoorOpener:
//                garageDoorPositions[accessory.id] = 0
//                deviceStates[accessory.id] = false
//            case .showerSystems:
//                showerTemperatures[accessory.id] = 100
//                deviceStates[accessory.id] = false
//            default:
//                deviceStates[accessory.id] = false
//            }
//        }
//    }
//    
//    func toggleDevice(_ accessory: MockAccessory) {
//        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
//            let current = deviceStates[accessory.id] ?? false
//            deviceStates[accessory.id] = !current
//        }
//    }
//}
//
//// MARK: - Selected Accessory Manager
//
//class MockSelectedAccessoryManager: ObservableObject {
//    @Published var selectedAccessory: MockAccessory?
//}
//
//// MARK: - Reusable Components
//
//struct GlassCard<Content: View>: View {
//    let content: Content
//    var padding: CGFloat = 20
//    
//    init(padding: CGFloat = 20, @ViewBuilder content: () -> Content) {
//        self.padding = padding
//        self.content = content()
//    }
//    
//    var body: some View {
//        content
//            .padding(padding)
//            .background(
//                RoundedRectangle(cornerRadius: DesignTokens.radiusMedium, style: .continuous)
//                    .fill(.ultraThinMaterial)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: DesignTokens.radiusMedium, style: .continuous)
//                            .stroke(DesignTokens.border, lineWidth: 0.5)
//                    )
//            )
//    }
//}
//
//struct PremiumSlider: View {
//    @Binding var value: Double
//    let range: ClosedRange<Double>
//    let step: Double
//    let accentColor: Color
//    let icon: String
//    let label: String
//    let unit: String
//    var onEditingChanged: ((Bool) -> Void)? = nil
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Image(systemName: icon)
//                    .font(.system(size: 14, weight: .medium))
//                    .foregroundColor(accentColor)
//                Text(label)
//                    .font(.system(size: 14, weight: .medium))
//                    .foregroundColor(DesignTokens.textSecondary)
//                Spacer()
//                Text("\(Int(value))\(unit)")
//                    .font(.system(size: 16, weight: .semibold, design: .rounded))
//                    .foregroundColor(DesignTokens.textPrimary)
//            }
//            
//            Slider(value: $value, in: range, step: step) { editing in
//                onEditingChanged?(editing)
//            }
//            .tint(accentColor)
//        }
//    }
//}
//
//struct StatusPill: View {
//    let text: String
//    let color: Color
//    let isActive: Bool
//    
//    var body: some View {
//        HStack(spacing: 6) {
//            Circle()
//                .fill(isActive ? color : color.opacity(0.3))
//                .frame(width: 6, height: 6)
//            Text(text)
//                .font(.system(size: 11, weight: .semibold))
//                .foregroundColor(isActive ? color : DesignTokens.textTertiary)
//        }
//        .padding(.horizontal, 10)
//        .padding(.vertical, 5)
//        .background(
//            Capsule()
//                .fill(isActive ? color.opacity(0.12) : Color.white.opacity(0.04))
//        )
//    }
//}
//
//// MARK: - Main Screen
//
//struct MockMainScreenView: View {
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var selectedRoom: MockRoom? = nil
//    @State private var appeared = false
//    
//    var body: some View {
//        NavigationSplitView {
//            sidebarContent
//        } detail: {
//            if let room = selectedRoom {
//                MockRoomDetailView(room: room)
//                    .id(room.id)
//            } else {
//                emptyState
//            }
//        }
//        .onAppear {
//            if selectedRoom == nil, let first = homeStore.selectedHome?.rooms.first {
//                selectedRoom = first
//            }
//            withAnimation(.easeOut(duration: 0.6)) { appeared = true }
//        }
//    }
//    
//    // MARK: Sidebar
//    
//    private var sidebarContent: some View {
//        VStack(spacing: 0) {
//            // Header
//            VStack(alignment: .leading, spacing: 6) {
//                HStack {
//                    Image(systemName: "house.fill")
//                        .font(.system(size: 18, weight: .semibold))
//                        .foregroundColor(DesignTokens.accent)
//                    Text(homeStore.selectedHome?.name ?? "Home")
//                        .font(.system(size: 22, weight: .bold))
//                        .foregroundColor(DesignTokens.textPrimary)
//                    Spacer()
//                }
//                Text("\(homeStore.totalActiveDevices) devices active")
//                    .font(.system(size: 13, weight: .medium))
//                    .foregroundColor(DesignTokens.textTertiary)
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 16)
//            .padding(.bottom, 12)
//            
//            Divider().overlay(DesignTokens.border)
//            
//            // Room List
//            ScrollView {
//                LazyVStack(spacing: 4) {
//                    ForEach(homeStore.selectedHome?.rooms ?? []) { room in
//                        RoomSidebarRow(
//                            room: room,
//                            isSelected: selectedRoom?.id == room.id,
//                            activeCount: homeStore.activeCount(for: room)
//                        )
//                        .onTapGesture {
//                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
//                                selectedRoom = room
//                            }
//                        }
//                    }
//                }
//                .padding(.vertical, 8)
//                .padding(.horizontal, 10)
//            }
//            
//            Spacer()
//            
//            // Home Picker
//            if homeStore.homes.count > 1 {
//                Picker("", selection: $homeStore.selectedHome) {
//                    ForEach(homeStore.homes) { home in
//                        Text(home.name).tag(home as MockHome?)
//                    }
//                }
//                .pickerStyle(.menu)
//                .tint(DesignTokens.accent)
//                .padding(16)
//            }
//        }
//        .navigationTitle("")
//    }
//    
//    private var emptyState: some View {
//        VStack(spacing: 16) {
//            Image(systemName: "house.fill")
//                .font(.system(size: 48))
//                .foregroundColor(DesignTokens.textTertiary)
//            Text("Select a room")
//                .font(.system(size: 18, weight: .medium))
//                .foregroundColor(DesignTokens.textSecondary)
//        }
//    }
//}
//
//// MARK: - Sidebar Row
//
//struct RoomSidebarRow: View {
//    let room: MockRoom
//    let isSelected: Bool
//    let activeCount: Int
//    
//    var body: some View {
//        HStack(spacing: 14) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 10, style: .continuous)
//                    .fill(isSelected ? DesignTokens.accent.opacity(0.15) : Color.white.opacity(0.04))
//                    .frame(width: 36, height: 36)
//                Image(systemName: room.roomIcon)
//                    .font(.system(size: 15, weight: .semibold))
//                    .foregroundColor(isSelected ? DesignTokens.accent : DesignTokens.textSecondary)
//            }
//            
//            VStack(alignment: .leading, spacing: 2) {
//                Text(room.name)
//                    .font(.system(size: 15, weight: isSelected ? .semibold : .regular))
//                    .foregroundColor(isSelected ? DesignTokens.textPrimary : DesignTokens.textSecondary)
//                Text("\(room.accessories.count) devices · \(activeCount) on")
//                    .font(.system(size: 11, weight: .medium))
//                    .foregroundColor(DesignTokens.textTertiary)
//            }
//            
//            Spacer()
//            
//            if activeCount > 0 {
//                Circle()
//                    .fill(DesignTokens.accent)
//                    .frame(width: 6, height: 6)
//            }
//        }
//        .padding(.horizontal, 12)
//        .padding(.vertical, 10)
//        .background(
//            RoundedRectangle(cornerRadius: 12, style: .continuous)
//                .fill(isSelected ? Color.white.opacity(0.06) : Color.clear)
//        )
//        .contentShape(Rectangle())
//    }
//}
//
//// MARK: - Room Detail View
//
//struct MockRoomDetailView: View {
//    let room: MockRoom
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var appeared = false
//    
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack(alignment: .leading, spacing: 28) {
//                // Room Header
//                roomHeader
//                    .opacity(appeared ? 1 : 0)
//                    .offset(y: appeared ? 0 : 12)
//                
//                // Quick Status
//                quickStatus
//                    .opacity(appeared ? 1 : 0)
//                    .offset(y: appeared ? 0 : 12)
//                
//                // Device Grid
//                deviceGrid
//                    .opacity(appeared ? 1 : 0)
//                    .offset(y: appeared ? 0 : 12)
//            }
//            .padding(28)
//        }
//        .navigationTitle("")
//        .onAppear {
//            appeared = false
//            withAnimation(.easeOut(duration: 0.5).delay(0.05)) { appeared = true }
//        }
//    }
//    
//    private var roomHeader: some View {
//        HStack(alignment: .bottom) {
//            VStack(alignment: .leading, spacing: 4) {
//                Text(room.name)
//                    .font(.system(size: 32, weight: .bold))
//                    .foregroundColor(DesignTokens.textPrimary)
//                Text("\(room.accessories.count) devices")
//                    .font(.system(size: 14, weight: .medium))
//                    .foregroundColor(DesignTokens.textTertiary)
//            }
//            Spacer()
//            Image(systemName: room.roomIcon)
//                .font(.system(size: 28, weight: .semibold))
//                .foregroundColor(DesignTokens.accent.opacity(0.5))
//        }
//    }
//    
//    private var quickStatus: some View {
//        let on = homeStore.activeCount(for: room)
//        let off = room.accessories.count - on
//        return HStack(spacing: 8) {
//            StatusPill(text: "\(on) Active", color: DesignTokens.success, isActive: on > 0)
//            StatusPill(text: "\(off) Off", color: DesignTokens.textTertiary, isActive: false)
//        }
//    }
//    
//    private var deviceGrid: some View {
//        LazyVGrid(columns: [
//            GridItem(.adaptive(minimum: 155, maximum: 200), spacing: 14)
//        ], spacing: 14) {
//            ForEach(Array(room.accessories.enumerated()), id: \.element.id) { index, accessory in
//                DeviceCard(accessory: accessory)
//                    .transition(.scale.combined(with: .opacity))
//            }
//        }
//    }
//}
//
//// MARK: - Device Card
//
//struct DeviceCard: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @EnvironmentObject var selectedAccessoryManager: MockSelectedAccessoryManager
//    @Environment(\.openWindow) private var openWindow
//    @State private var isPressed = false
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var deviceColor: Color { DesignTokens.deviceColor(for: accessory.deviceType, isOn: isOn) }
//    
//    var body: some View {
//        Button {
//            selectedAccessoryManager.selectedAccessory = accessory
//            openWindow(id: "AccessoryDetailWindow2")
//        } label: {
//            VStack(alignment: .leading, spacing: 14) {
//                // Icon + Toggle
//                HStack {
//                    ZStack {
//                        Circle()
//                            .fill(isOn ? deviceColor.opacity(0.15) : Color.white.opacity(0.04))
//                            .frame(width: 44, height: 44)
//                        
//                        if isOn {
//                            Circle()
//                                .fill(deviceColor.opacity(0.08))
//                                .frame(width: 44, height: 44)
//                                .blur(radius: 8)
//                        }
//                        
//                        Image(systemName: isOn ? accessory.iconNameOn : accessory.iconName)
//                            .font(.system(size: 19, weight: .semibold))
//                            .foregroundColor(isOn ? deviceColor : DesignTokens.textTertiary)
//                            .symbolEffect(.bounce, value: isOn)
//                    }
//                    
//                    Spacer()
//                    
//                    // Mini toggle
//                    Button {
//                        homeStore.toggleDevice(accessory)
//                    } label: {
//                        Circle()
//                            .fill(isOn ? deviceColor : Color.white.opacity(0.08))
//                            .frame(width: 28, height: 28)
//                            .overlay(
//                                Image(systemName: "power")
//                                    .font(.system(size: 11, weight: .bold))
//                                    .foregroundColor(isOn ? .black.opacity(0.7) : DesignTokens.textTertiary)
//                            )
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//                
//                // Labels
//                VStack(alignment: .leading, spacing: 3) {
//                    Text(accessory.name)
//                        .font(.system(size: 14, weight: .semibold))
//                        .foregroundColor(DesignTokens.textPrimary)
//                        .lineLimit(1)
//                    
//                    Text(isOn ? statusText : "Off")
//                        .font(.system(size: 12, weight: .medium))
//                        .foregroundColor(isOn ? deviceColor.opacity(0.8) : DesignTokens.textTertiary)
//                }
//            }
//            .padding(16)
//            .background(
//                RoundedRectangle(cornerRadius: DesignTokens.radiusMedium, style: .continuous)
//                    .fill(isOn ? deviceColor.opacity(0.05) : DesignTokens.surface)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: DesignTokens.radiusMedium, style: .continuous)
//                            .stroke(isOn ? deviceColor.opacity(0.15) : DesignTokens.border, lineWidth: 0.5)
//                    )
//            )
//            .scaleEffect(isPressed ? 0.97 : 1.0)
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//    
//    private var statusText: String {
//        switch accessory.deviceType {
//        case .lightbulb:
//            let b = homeStore.brightnessLevels[accessory.id] ?? 75
//            return "\(b)% Brightness"
//        case .thermostat:
//            let t = homeStore.thermostatTemperatures[accessory.id] ?? 72
//            return "\(Int(t))°F"
//        case .fan: return "Running"
//        case .airConditioner: return "Cooling"
//        case .heater: return "Heating"
//        case .securitySystem: return "Armed"
//        case .doorLock: return "Locked"
//        case .outlet: return "On"
//        case .sensor: return "Monitoring"
//        default: return "Active"
//        }
//    }
//}
//
//// MARK: - Accessory Detail View (Window)
//
//struct MockAccessoryDetailView: View {
//    @EnvironmentObject var selectedAccessoryManager: MockSelectedAccessoryManager
//    @EnvironmentObject var homeStore: MockHomeStore
//    @Environment(\.openWindow) private var openWindow
//    @State private var currentAccessory: MockAccessory? = nil
//    
//    var body: some View {
//        Group {
//            if let accessory = currentAccessory {
//                MockAccessoryControlRouterView(accessory: accessory)
//                    .environmentObject(homeStore)
//            } else {
//                VStack(spacing: 16) {
//                    Image(systemName: "square.dashed")
//                        .font(.system(size: 40))
//                        .foregroundColor(DesignTokens.textTertiary)
//                    Text("No Device Selected")
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(DesignTokens.textSecondary)
//                }
//                .frame(minWidth: 380, minHeight: 320)
//            }
//        }
//        .onAppear {
//            currentAccessory = selectedAccessoryManager.selectedAccessory
//        }
//        .onChange(of: selectedAccessoryManager.selectedAccessory) { _, new in
//            currentAccessory = new
//        }
//    }
//}
//
//// MARK: - Accessory Control Router
//
//struct MockAccessoryControlRouterView: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack(spacing: 0) {
//                controlContent
//            }
//            .padding(28)
//        }
//        .frame(minWidth: 380, idealWidth: 420, minHeight: 320)
//    }
//    
//    @ViewBuilder
//    private var controlContent: some View {
//        switch accessory.deviceType {
//        case .lightbulb:          LightbulbControl(accessory: accessory)
//        case .thermostat:         ThermostatControl(accessory: accessory)
//        case .fan:                FanControl(accessory: accessory)
//        case .airConditioner:     ACControl(accessory: accessory)
//        case .airPurifier:        PurifierControl(accessory: accessory)
//        case .dehumidifier:       DehumidifierControl(accessory: accessory)
//        case .door:               DoorControl(accessory: accessory)
//        case .doorLock:           LockControl(accessory: accessory)
//        case .faucets:            SimpleToggleControl(accessory: accessory)
//        case .garageDoorOpener:   GarageDoorControl(accessory: accessory)
//        case .heater:             HeaterControl(accessory: accessory)
//        case .humidifier:         HumidifierControl(accessory: accessory)
//        case .outlet:             SimpleToggleControl(accessory: accessory)
//        case .programmableSwitch: SimpleToggleControl(accessory: accessory)
//        case .securitySystem:     SecurityControl(accessory: accessory)
//        case .sensor:             SensorControl(accessory: accessory)
//        case .showerSystems:      ShowerControl(accessory: accessory)
//        case .sprinklers:         SprinklerControl(accessory: accessory)
//        case .switch:             SimpleToggleControl(accessory: accessory)
//        case .window:             WindowControl(accessory: accessory)
//        case .windowCovering:     BlindsControl(accessory: accessory)
//        case .other:              GenericControl(accessory: accessory)
//        }
//    }
//}
//
//// MARK: - Shared Control Header
//
//struct ControlHeader: View {
//    let accessory: MockAccessory
//    let isOn: Bool
//    let onToggle: () -> Void
//    
//    private var deviceColor: Color { DesignTokens.deviceColor(for: accessory.deviceType, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            // Large icon button
//            Button(action: onToggle) {
//                ZStack {
//                    Circle()
//                        .fill(isOn ? deviceColor.opacity(0.12) : Color.white.opacity(0.04))
//                        .frame(width: 100, height: 100)
//                    
//                    if isOn {
//                        Circle()
//                            .fill(deviceColor.opacity(0.06))
//                            .frame(width: 120, height: 120)
//                            .blur(radius: 20)
//                    }
//                    
//                    Image(systemName: isOn ? accessory.iconNameOn : accessory.iconName)
//                        .font(.system(size: 38, weight: .semibold))
//                        .foregroundColor(isOn ? deviceColor : DesignTokens.textTertiary)
//                        .symbolEffect(.bounce, value: isOn)
//                }
//            }
//            .buttonStyle(PlainButtonStyle())
//            
//            // Name + Status
//            VStack(spacing: 6) {
//                Text(accessory.name)
//                    .font(.system(size: 22, weight: .bold))
//                    .foregroundColor(DesignTokens.textPrimary)
//                
//                Text(accessory.deviceType.displayName)
//                    .font(.system(size: 13, weight: .medium))
//                    .foregroundColor(DesignTokens.textTertiary)
//            }
//            
//            // Power toggle
//            HStack(spacing: 10) {
//                StatusPill(
//                    text: isOn ? "On" : "Off",
//                    color: isOn ? deviceColor : DesignTokens.textTertiary,
//                    isActive: isOn
//                )
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//}
//
//// MARK: - Control Views
//
//struct LightbulbControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var brightness: Double = 75
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .lightbulb, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            
//            if isOn {
//                GlassCard {
//                    PremiumSlider(
//                        value: $brightness,
//                        range: 0...100, step: 1,
//                        accentColor: color,
//                        icon: "sun.max.fill",
//                        label: "Brightness",
//                        unit: "%"
//                    )
//                    .onChange(of: brightness) { _, newVal in
//                        homeStore.brightnessLevels[accessory.id] = Int(newVal)
//                    }
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//        .onAppear { brightness = Double(homeStore.brightnessLevels[accessory.id] ?? 75) }
//    }
//}
//
//struct ThermostatControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var target: Double = 72
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .thermostat, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            
//            if isOn {
//                // Temperature ring
//                ZStack {
//                    Circle()
//                        .stroke(Color.white.opacity(0.06), lineWidth: 8)
//                        .frame(width: 140, height: 140)
//                    
//                    Circle()
//                        .trim(from: 0, to: (target - 60) / 20)
//                        .stroke(color, style: StrokeStyle(lineWidth: 8, lineCap: .round))
//                        .frame(width: 140, height: 140)
//                        .rotationEffect(.degrees(-90))
//                        .animation(.spring(response: 0.5), value: target)
//                    
//                    VStack(spacing: 2) {
//                        Text("\(Int(target))°")
//                            .font(.system(size: 36, weight: .bold, design: .rounded))
//                            .foregroundColor(DesignTokens.textPrimary)
//                        Text("Target")
//                            .font(.system(size: 11, weight: .medium))
//                            .foregroundColor(DesignTokens.textTertiary)
//                    }
//                }
//                .transition(.scale.combined(with: .opacity))
//                
//                GlassCard {
//                    PremiumSlider(
//                        value: $target,
//                        range: 60...80, step: 1,
//                        accentColor: color,
//                        icon: "thermometer.medium",
//                        label: "Temperature",
//                        unit: "°F"
//                    )
//                    .onChange(of: target) { _, newVal in
//                        homeStore.thermostatTemperatures[accessory.id] = newVal
//                    }
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//        .onAppear { target = homeStore.thermostatTemperatures[accessory.id] ?? 72 }
//    }
//}
//
//struct FanControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var speed: Double = 1
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .fan, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(
//                        value: $speed,
//                        range: 1...3, step: 1,
//                        accentColor: color,
//                        icon: "wind",
//                        label: "Speed",
//                        unit: ""
//                    )
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct ACControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var temp: Double = 72
//    @State private var fan: Double = 1
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .airConditioner, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    VStack(spacing: 18) {
//                        PremiumSlider(value: $temp, range: 60...80, step: 1, accentColor: color, icon: "thermometer.snowflake", label: "Temperature", unit: "°F")
//                        Divider().overlay(DesignTokens.border)
//                        PremiumSlider(value: $fan, range: 1...3, step: 1, accentColor: color, icon: "wind", label: "Fan Speed", unit: "")
//                    }
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct PurifierControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var fan: Double = 1
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .airPurifier, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(value: $fan, range: 1...3, step: 1, accentColor: color, icon: "wind", label: "Fan Speed", unit: "")
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct DehumidifierControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var humidity: Double = 50
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .dehumidifier, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(value: $humidity, range: 30...70, step: 1, accentColor: color, icon: "humidity.fill", label: "Target Humidity", unit: "%")
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct DoorControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var openPct: Double = 0
//    
//    private var color: Color { DesignTokens.deviceColor(for: .door, isOn: openPct > 0) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: openPct > 0) {
//                withAnimation { openPct = openPct > 0 ? 0 : 100 }
//                homeStore.doorPositions[accessory.id] = Int(openPct)
//            }
//            
//            GlassCard {
//                VStack(spacing: 16) {
//                    PremiumSlider(value: $openPct, range: 0...100, step: 1, accentColor: color, icon: "door.left.hand.open", label: "Position", unit: "%") { editing in
//                        if !editing { homeStore.doorPositions[accessory.id] = Int(openPct) }
//                    }
//                    
//                    HStack(spacing: 12) {
//                        Button {
//                            withAnimation { openPct = 100 }
//                            homeStore.doorPositions[accessory.id] = 100
//                        } label: {
//                            Text("Open")
//                                .font(.system(size: 14, weight: .semibold))
//                                .foregroundColor(.black.opacity(0.8))
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 10)
//                                .background(Capsule().fill(color))
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        
//                        Button {
//                            withAnimation { openPct = 0 }
//                            homeStore.doorPositions[accessory.id] = 0
//                        } label: {
//                            Text("Close")
//                                .font(.system(size: 14, weight: .semibold))
//                                .foregroundColor(DesignTokens.textPrimary)
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 10)
//                                .background(Capsule().fill(Color.white.opacity(0.08)))
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//        }
//        .onAppear { openPct = Double(homeStore.doorPositions[accessory.id] ?? 0) }
//    }
//}
//
//struct LockControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var isLocked = true
//    
//    private var color: Color { isLocked ? DesignTokens.danger : DesignTokens.success }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isLocked) {
//                withAnimation(.spring(response: 0.35, dampingFraction: 0.65)) {
//                    isLocked.toggle()
//                }
//            }
//            
//            StatusPill(text: isLocked ? "Locked" : "Unlocked", color: color, isActive: true)
//        }
//    }
//}
//
//struct GarageDoorControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var openPct: Double = 0
//    
//    private var color: Color { DesignTokens.deviceColor(for: .garageDoorOpener, isOn: openPct > 0) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: openPct > 0) {
//                withAnimation { openPct = openPct > 0 ? 0 : 100 }
//                homeStore.garageDoorPositions[accessory.id] = Int(openPct)
//            }
//            
//            GlassCard {
//                PremiumSlider(value: $openPct, range: 0...100, step: 1, accentColor: color, icon: "car.fill", label: "Position", unit: "%") { editing in
//                    if !editing { homeStore.garageDoorPositions[accessory.id] = Int(openPct) }
//                }
//            }
//        }
//        .onAppear { openPct = Double(homeStore.garageDoorPositions[accessory.id] ?? 0) }
//    }
//}
//
//struct HeaterControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var temp: Double = 70
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .heater, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(value: $temp, range: 60...80, step: 1, accentColor: color, icon: "flame.fill", label: "Temperature", unit: "°F")
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct HumidifierControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var intensity: Double = 50
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .humidifier, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(value: $intensity, range: 0...100, step: 1, accentColor: color, icon: "humidity.fill", label: "Intensity", unit: "%")
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct SecurityControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    
//    private var isArmed: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { isArmed ? DesignTokens.success : DesignTokens.danger }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isArmed) {
//                homeStore.toggleDevice(accessory)
//            }
//            
//            GlassCard {
//                HStack {
//                    Image(systemName: isArmed ? "checkmark.shield.fill" : "exclamationmark.shield.fill")
//                        .font(.system(size: 18))
//                        .foregroundColor(color)
//                    Text(isArmed ? "System Armed" : "System Disarmed")
//                        .font(.system(size: 15, weight: .semibold))
//                        .foregroundColor(color)
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//struct SensorControl: View {
//    let accessory: MockAccessory
//    @State private var tempReading = Int.random(in: 65...80)
//    @State private var humReading = Int.random(in: 30...60)
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: true) {}
//            
//            HStack(spacing: 14) {
//                GlassCard {
//                    VStack(spacing: 6) {
//                        Image(systemName: "thermometer.medium")
//                            .font(.system(size: 20))
//                            .foregroundColor(DesignTokens.info)
//                        Text("\(tempReading)°F")
//                            .font(.system(size: 22, weight: .bold, design: .rounded))
//                            .foregroundColor(DesignTokens.textPrimary)
//                        Text("Temp")
//                            .font(.system(size: 11, weight: .medium))
//                            .foregroundColor(DesignTokens.textTertiary)
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//                
//                GlassCard {
//                    VStack(spacing: 6) {
//                        Image(systemName: "humidity.fill")
//                            .font(.system(size: 20))
//                            .foregroundColor(DesignTokens.info)
//                        Text("\(humReading)%")
//                            .font(.system(size: 22, weight: .bold, design: .rounded))
//                            .foregroundColor(DesignTokens.textPrimary)
//                        Text("Humidity")
//                            .font(.system(size: 11, weight: .medium))
//                            .foregroundColor(DesignTokens.textTertiary)
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//            }
//            
//            Button {
//                withAnimation {
//                    tempReading = Int.random(in: 65...80)
//                    humReading = Int.random(in: 30...60)
//                }
//            } label: {
//                HStack(spacing: 8) {
//                    Image(systemName: "arrow.clockwise")
//                    Text("Refresh")
//                }
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundColor(DesignTokens.accent)
//                .padding(.vertical, 10)
//                .padding(.horizontal, 24)
//                .background(Capsule().fill(DesignTokens.accentSoft))
//            }
//            .buttonStyle(PlainButtonStyle())
//        }
//    }
//}
//
//struct ShowerControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var waterFlow = false
//    @State private var temp: Double = 100
//    
//    private var color: Color { DesignTokens.deviceColor(for: .showerSystems, isOn: waterFlow) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: waterFlow) {
//                waterFlow.toggle()
//                homeStore.deviceStates[accessory.id] = waterFlow
//            }
//            
//            if waterFlow {
//                GlassCard {
//                    PremiumSlider(value: $temp, range: 80...110, step: 1, accentColor: color, icon: "thermometer.medium", label: "Water Temp", unit: "°F") { editing in
//                        if !editing { homeStore.showerTemperatures[accessory.id] = Int(temp) }
//                    }
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: waterFlow)
//        .onAppear {
//            waterFlow = homeStore.deviceStates[accessory.id] ?? false
//            temp = Double(homeStore.showerTemperatures[accessory.id] ?? 100)
//        }
//    }
//}
//
//struct SprinklerControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var duration: Double = 10
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    private var color: Color { DesignTokens.deviceColor(for: .sprinklers, isOn: isOn) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//            if isOn {
//                GlassCard {
//                    PremiumSlider(value: $duration, range: 5...30, step: 1, accentColor: color, icon: "timer", label: "Duration", unit: " min")
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//            }
//        }
//        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isOn)
//    }
//}
//
//struct WindowControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var openness: Double = 0
//    
//    private var color: Color { DesignTokens.deviceColor(for: .window, isOn: openness > 0) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: openness > 0) {
//                withAnimation { openness = openness > 0 ? 0 : 100 }
//            }
//            GlassCard {
//                PremiumSlider(value: $openness, range: 0...100, step: 1, accentColor: color, icon: "window.vertical.open", label: "Openness", unit: "%")
//            }
//        }
//    }
//}
//
//struct BlindsControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    @State private var position: Double = 0
//    
//    private var color: Color { DesignTokens.deviceColor(for: .windowCovering, isOn: position > 0) }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: position > 0) {
//                withAnimation { position = position > 0 ? 0 : 100 }
//            }
//            GlassCard {
//                PremiumSlider(value: $position, range: 0...100, step: 1, accentColor: color, icon: "blinds.vertical.open", label: "Position", unit: "%")
//            }
//        }
//    }
//}
//
//struct SimpleToggleControl: View {
//    let accessory: MockAccessory
//    @EnvironmentObject var homeStore: MockHomeStore
//    
//    private var isOn: Bool { homeStore.deviceStates[accessory.id] ?? false }
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: isOn) {
//                homeStore.toggleDevice(accessory)
//            }
//        }
//    }
//}
//
//struct GenericControl: View {
//    let accessory: MockAccessory
//    
//    var body: some View {
//        VStack(spacing: 28) {
//            ControlHeader(accessory: accessory, isOn: false) {}
//            
//            GlassCard {
//                HStack {
//                    Image(systemName: "info.circle")
//                        .foregroundColor(DesignTokens.textTertiary)
//                    Text("No specific controls available")
//                        .font(.system(size: 14, weight: .medium))
//                        .foregroundColor(DesignTokens.textSecondary)
//                    Spacer()
//                }
//            }
//        }
//    }
//}
