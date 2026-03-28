import SwiftUI

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Device Type
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

enum DeviceType: String, CaseIterable, Equatable, Codable {
    // Lighting & Power
    case light, outlet, programmableSwitch

    // Climate
    case thermostat, fan, airConditioner, heater, airPurifier, humidifier, dehumidifier

    // Security & Access
    case lock, securitySystem, camera, doorbell

    // Doors & Windows
    case door, garageDoor, window, blinds

    // Water
    case faucet, shower, sprinkler

    // Media
    case speaker, tv

    // Sensors & Other
    case sensor, other

    var label: String {
        switch self {
        case .light:               "Light"
        case .outlet:              "Outlet"
        case .programmableSwitch:  "Switch"
        case .thermostat:          "Thermostat"
        case .fan:                 "Fan"
        case .airConditioner:      "AC"
        case .heater:              "Heater"
        case .airPurifier:         "Purifier"
        case .humidifier:          "Humidifier"
        case .dehumidifier:        "Dehumidifier"
        case .lock:                "Lock"
        case .securitySystem:      "Security"
        case .camera:              "Camera"
        case .doorbell:            "Doorbell"
        case .door:                "Door"
        case .garageDoor:          "Garage"
        case .window:              "Window"
        case .blinds:              "Blinds"
        case .faucet:              "Faucet"
        case .shower:              "Shower"
        case .sprinkler:           "Sprinkler"
        case .speaker:             "Speaker"
        case .tv:                  "TV"
        case .sensor:              "Sensor"
        case .other:               "Device"
        }
    }

    var icon: String {
        switch self {
        case .light:               "lightbulb.fill"
        case .outlet:              "powerplug.fill"
        case .programmableSwitch:  "switch.2"
        case .thermostat:          "thermometer.medium"
        case .fan:                 "fanblades.fill"
        case .airConditioner:      "snowflake"
        case .heater:              "flame.fill"
        case .airPurifier:         "leaf.fill"
        case .humidifier:          "humidity.fill"
        case .dehumidifier:        "humidity"
        case .lock:                "lock.fill"
        case .securitySystem:      "shield.checkered"
        case .camera:              "video.fill"
        case .doorbell:            "bell.fill"
        case .door:                "door.left.hand.closed"
        case .garageDoor:          "door.garage.closed"
        case .window:              "window.vertical.closed"
        case .blinds:              "blinds.vertical.open"
        case .faucet:              "drop.fill"
        case .shower:              "shower.fill"
        case .sprinkler:           "sprinkler.and.droplets.fill"
        case .speaker:             "hifispeaker.2.fill"
        case .tv:                  "tv.inset.filled"
        case .sensor:              "sensor.fill"
        case .other:               "square.stack.3d.up.fill"
        }
    }

    var iconOn: String {
        switch self {
        case .lock:        "lock.open.fill"
        case .door:        "door.left.hand.open"
        case .garageDoor:  "door.garage.open"
        case .window:      "window.vertical.open"
        case .blinds:      "blinds.vertical.open"
        case .doorbell:    "bell.and.waves.left.and.right.fill"
        default:           icon
        }
    }

    var accent: Color {
        switch self {
        case .light:               Color(red: 1.0, green: 0.78, blue: 0.28)
        case .outlet:              Color(red: 0.42, green: 0.90, blue: 0.60)
        case .programmableSwitch:  Color(red: 0.60, green: 0.60, blue: 0.75)
        case .thermostat:          Color(red: 1.0, green: 0.44, blue: 0.30)
        case .fan:                 Color(red: 0.30, green: 0.82, blue: 0.88)
        case .airConditioner:      Color(red: 0.55, green: 0.85, blue: 1.0)
        case .heater:              Color(red: 1.0, green: 0.55, blue: 0.35)
        case .airPurifier:         Color(red: 0.55, green: 0.95, blue: 0.80)
        case .humidifier:          Color(red: 0.45, green: 0.72, blue: 1.0)
        case .dehumidifier:        Color(red: 0.45, green: 0.72, blue: 1.0)
        case .lock:                Color(red: 0.30, green: 0.85, blue: 0.46)
        case .securitySystem:      Color(red: 0.42, green: 0.90, blue: 0.60)
        case .camera:              Color(red: 0.70, green: 0.42, blue: 1.0)
        case .doorbell:            Color(red: 0.70, green: 0.42, blue: 1.0)
        case .door:                Color(red: 0.96, green: 0.76, blue: 0.42)
        case .garageDoor:          Color(red: 0.96, green: 0.76, blue: 0.42)
        case .window:              Color(red: 0.55, green: 0.55, blue: 0.80)
        case .blinds:              Color(red: 0.55, green: 0.55, blue: 0.80)
        case .faucet:              Color(red: 0.45, green: 0.72, blue: 1.0)
        case .shower:              Color(red: 0.45, green: 0.72, blue: 1.0)
        case .sprinkler:           Color(red: 0.45, green: 0.72, blue: 1.0)
        case .speaker:             Color(red: 0.35, green: 0.58, blue: 1.0)
        case .tv:                  Color(red: 0.95, green: 0.40, blue: 0.56)
        case .sensor:              Color(red: 0.45, green: 0.72, blue: 1.0)
        case .other:               Color(red: 0.60, green: 0.60, blue: 0.75)
        }
    }

    /// Devices that primarily use a position/percentage control
    var usesPosition: Bool {
        switch self {
        case .door, .garageDoor, .window, .blinds: return true
        default: return false
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Home Device
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

struct HomeDevice: Identifiable, Equatable {
    let id: UUID
    var name: String
    var room: String
    var type: DeviceType
    var isOn: Bool

    // Light / Fan / Blinds / Window / Door / Garage
    var brightness: Double      // 0-1 for lights, fan speed; also used as position (0-1) for blinds/door/window/garage
    var colorTemp: Double       // Kelvin for lights

    // Climate
    var temperature: Double     // target temp for thermostat/AC/heater
    var humidity: Double        // target humidity for humidifier/dehumidifier; also sensor reading

    // Media
    var volume: Double          // 0-1

    // Security
    var isLocked: Bool          // lock state
    var isArmed: Bool           // security system armed state

    // Water
    var waterTemp: Double       // water temperature for shower/faucet
    var duration: Double        // minutes for sprinkler

    // Sensor readings
    var sensorTemp: Double
    var sensorHumidity: Double

    init(
        name: String, room: String, type: DeviceType,
        isOn: Bool = false, brightness: Double = 0.72,
        colorTemp: Double = 3800, temperature: Double = 22.0,
        humidity: Double = 50.0, volume: Double = 0.55,
        isLocked: Bool = true, isArmed: Bool = true,
        waterTemp: Double = 38.0, duration: Double = 10,
        sensorTemp: Double = 22.0, sensorHumidity: Double = 45.0
    ) {
        self.id = UUID()
        self.name = name
        self.room = room
        self.type = type
        self.isOn = isOn
        self.brightness = brightness
        self.colorTemp = colorTemp
        self.temperature = temperature
        self.humidity = humidity
        self.volume = volume
        self.isLocked = isLocked
        self.isArmed = isArmed
        self.waterTemp = waterTemp
        self.duration = duration
        self.sensorTemp = sensorTemp
        self.sensorHumidity = sensorHumidity
    }

    static let sample: [HomeDevice] = [
        // Living Room
        HomeDevice(name: "Ceiling Light",   room: "Living Room", type: .light,         isOn: true,  brightness: 0.85, colorTemp: 3200),
        HomeDevice(name: "Smart TV",        room: "Living Room", type: .tv,            isOn: true,  volume: 0.40),
        HomeDevice(name: "Soundbar",        room: "Living Room", type: .speaker,       isOn: true,  volume: 0.45),
        HomeDevice(name: "Climate Control", room: "Living Room", type: .thermostat,    isOn: true,  temperature: 22.5),
        HomeDevice(name: "AC Unit",         room: "Living Room", type: .airConditioner,isOn: false, temperature: 24.0),
        HomeDevice(name: "Air Purifier",    room: "Living Room", type: .airPurifier,   isOn: true,  brightness: 0.60),

        // Bedroom
        HomeDevice(name: "Bedside Lamp",    room: "Bedroom", type: .light,       isOn: false, brightness: 0.35, colorTemp: 2700),
        HomeDevice(name: "Ceiling Fan",     room: "Bedroom", type: .fan,         isOn: true,  brightness: 0.60),
        HomeDevice(name: "Roller Blinds",   room: "Bedroom", type: .blinds,      isOn: false, brightness: 0.30),
        HomeDevice(name: "Humidifier",      room: "Bedroom", type: .humidifier,  isOn: true,  humidity: 55.0),
        HomeDevice(name: "Space Heater",    room: "Bedroom", type: .heater,      isOn: false, temperature: 22.0),

        // Entrance
        HomeDevice(name: "Front Door",      room: "Entrance", type: .lock,           isOn: true,  isLocked: true),
        HomeDevice(name: "Door Sensor",     room: "Entrance", type: .door,           isOn: false, brightness: 0.0),
        HomeDevice(name: "Front Camera",    room: "Entrance", type: .camera,         isOn: true),
        HomeDevice(name: "Doorbell",        room: "Entrance", type: .doorbell,       isOn: true),
        HomeDevice(name: "Security System", room: "Entrance", type: .securitySystem, isOn: true,  isArmed: true),

        // Kitchen
        HomeDevice(name: "Kitchen Light",   room: "Kitchen", type: .light,         isOn: false, colorTemp: 5500),
        HomeDevice(name: "Smart Faucet",    room: "Kitchen", type: .faucet,        isOn: false, waterTemp: 38.0),
        HomeDevice(name: "Coffee Outlet",   room: "Kitchen", type: .outlet,        isOn: true),
        HomeDevice(name: "Dehumidifier",    room: "Kitchen", type: .dehumidifier,  isOn: false, humidity: 45.0),

        // Office
        HomeDevice(name: "Desk Lamp",       room: "Office", type: .light,    isOn: true,  brightness: 0.80, colorTemp: 5000),
        HomeDevice(name: "Studio Monitor",  room: "Office", type: .speaker,  isOn: false, volume: 0.60),
        HomeDevice(name: "Wall Switch",     room: "Office", type: .programmableSwitch, isOn: false),
        HomeDevice(name: "Temp Sensor",     room: "Office", type: .sensor,   isOn: true,  sensorTemp: 23.0, sensorHumidity: 42.0),

        // Bathroom
        HomeDevice(name: "Bathroom Light",  room: "Bathroom", type: .light,   isOn: false, brightness: 0.70, colorTemp: 4000),
        HomeDevice(name: "Smart Shower",    room: "Bathroom", type: .shower,  isOn: false, waterTemp: 40.0),
        HomeDevice(name: "Window",          room: "Bathroom", type: .window,  isOn: false, brightness: 0.0),

        // Garage
        HomeDevice(name: "Garage Door",     room: "Garage", type: .garageDoor, isOn: false, brightness: 0.0),
        HomeDevice(name: "Garage Light",    room: "Garage", type: .light,      isOn: false),

        // Garden
        HomeDevice(name: "Sprinkler",       room: "Garden", type: .sprinkler,  isOn: false, duration: 15),
        HomeDevice(name: "Garden Light",    room: "Garden", type: .light,      isOn: true, brightness: 0.65),
        HomeDevice(name: "Weather Station", room: "Garden", type: .sensor,     isOn: true, sensorTemp: 18.0, sensorHumidity: 65.0),
    ]
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - View Model
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

@Observable
final class HomeVM {
    var devices: [HomeDevice] = HomeDevice.sample
    var filter: String = "All"

    var filters: [String] {
        var set: [String] = ["All"]
        for d in devices where !set.contains(d.room) { set.append(d.room) }
        return set
    }

    var filtered: [HomeDevice] {
        filter == "All" ? devices : devices.filter { $0.room == filter }
    }

    var onCount: Int { devices.filter(\.isOn).count }

    func toggle(_ id: UUID) {
        guard let i = devices.firstIndex(where: { $0.id == id }) else { return }
        devices[i].isOn.toggle()
    }

    func device(for id: UUID) -> HomeDevice? {
        devices.first { $0.id == id }
    }

    func binding(for id: UUID) -> Binding<HomeDevice>? {
        guard let i = devices.firstIndex(where: { $0.id == id }) else { return nil }
        return Binding(
            get: { self.devices[i] },
            set: { self.devices[i] = $0 }
        )
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Content View (Main Window)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

struct ContentView: View {
    @Environment(HomeVM.self) private var vm
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                    .padding(.horizontal, 32)
                    .padding(.top, 28)
                    .padding(.bottom, 24)

                deviceGrid
                    .padding(.horizontal, 28)
                    .padding(.bottom, 28)
            }
        }
        .ornament(attachmentAnchor: .scene(.bottom)) {
            filterBar
                .glassBackgroundEffect()
        }
        .glassBackgroundEffect()
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("My Home")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
            Text("\(vm.onCount) devices active")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: Filter Ornament

    private var filterBar: some View {
        HStack(spacing: 6) {
            ForEach(vm.filters, id: \.self) { room in
                let selected = vm.filter == room
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        vm.filter = room
                    }
                } label: {
                    Text(room)
                        .font(.system(size: 14, weight: selected ? .semibold : .medium, design: .rounded))
                        .foregroundStyle(selected ? .white : .secondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background {
                            if selected {
                                Capsule().fill(.white.opacity(0.15))
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(6)
    }

    // MARK: Device Grid

    private var deviceGrid: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 200, maximum: 280), spacing: 14)],
            spacing: 14
        ) {
            ForEach(vm.filtered) { device in
                DeviceCard(device: device, onToggle: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        vm.toggle(device.id)
                    }
                }, onOpen: {
                    openWindow(value: device.id)
                })
            }
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Device Card
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

struct DeviceCard: View {
    let device: HomeDevice
    let onToggle: () -> Void
    let onOpen: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Row 1: icon + power toggle
            HStack(alignment: .top) {
                iconView
                Spacer()
                powerButton
            }

            Spacer()

            // Row 2: name + status
            VStack(alignment: .leading, spacing: 3) {
                Text(device.name)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                Text(statusText)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(device.isOn ? device.type.accent.opacity(0.9) : .secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }

            Spacer().frame(height: 12)

            // Row 3: open device control window
            Button(action: onOpen) {
                Image(systemName: "macwindow.badge.plus")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(device.isOn ? device.type.accent : .secondary)
                    .frame(width: 32, height: 26)
                    .background {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(device.isOn
                                  ? device.type.accent.opacity(0.12)
                                  : .white.opacity(0.06))
                    }
            }
            .buttonStyle(.plain)
            .hoverEffect(.lift)
        }
        .padding(18)
        .frame(height: 172)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background { cardBackground }
        .hoverEffect(.highlight)
        .contentShape(.hoverEffect, .rect(cornerRadius: 22))
    }

    private var iconView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(device.isOn ? device.type.accent.opacity(0.15) : .white.opacity(0.06))
                .frame(width: 46, height: 46)
            Image(systemName: device.isOn ? device.type.iconOn : device.type.icon)
                .font(.system(size: 19, weight: .semibold))
                .foregroundStyle(device.isOn ? device.type.accent : .white.opacity(0.35))
                .contentTransition(.symbolEffect(.replace))
        }
    }

    private var powerButton: some View {
        Button(action: onToggle) {
            Circle()
                .fill(device.isOn ? device.type.accent : .white.opacity(0.08))
                .frame(width: 30, height: 30)
                .overlay {
                    Image(systemName: "power")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(device.isOn ? .black.opacity(0.7) : .white.opacity(0.35))
                }
        }
        .buttonStyle(.plain)
        .hoverEffect(.lift)
    }

    private var cardBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(.ultraThinMaterial)
            if device.isOn {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(device.type.accent.opacity(0.06))
            }
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .strokeBorder(
                    device.isOn ? device.type.accent.opacity(0.2) : .white.opacity(0.08),
                    lineWidth: 1
                )
        }
    }

    private var statusText: String {
        guard device.isOn else { return "Off" }
        switch device.type {
        case .light:              return "\(Int(device.brightness * 100))% · \(Int(device.colorTemp))K"
        case .thermostat:         return String(format: "%.1f°", device.temperature)
        case .airConditioner:     return String(format: "%.1f°", device.temperature)
        case .heater:             return String(format: "%.1f°", device.temperature)
        case .fan:                return "Speed \(Int(device.brightness * 100))%"
        case .airPurifier:        return "Fan \(Int(device.brightness * 100))%"
        case .humidifier:         return "Target \(Int(device.humidity))%"
        case .dehumidifier:       return "Target \(Int(device.humidity))%"
        case .lock:               return device.isLocked ? "Locked" : "Unlocked"
        case .securitySystem:     return device.isArmed ? "Armed" : "Disarmed"
        case .camera:             return "Live"
        case .doorbell:           return "Ready"
        case .door, .garageDoor:  return "\(Int(device.brightness * 100))% Open"
        case .window:             return "\(Int(device.brightness * 100))% Open"
        case .blinds:             return "\(Int(device.brightness * 100))% Open"
        case .faucet:             return String(format: "%.0f°", device.waterTemp)
        case .shower:             return String(format: "%.0f°", device.waterTemp)
        case .sprinkler:          return "\(Int(device.duration)) min"
        case .speaker, .tv:       return "Vol \(Int(device.volume * 100))%"
        case .sensor:             return String(format: "%.1f° · %d%%", device.sensorTemp, Int(device.sensorHumidity))
        case .outlet:             return "On"
        case .programmableSwitch: return "Active"
        case .other:              return "Active"
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Device Detail Window (Ultra-Compact)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

struct DeviceDetailView: View {
    let deviceID: UUID
    @Environment(HomeVM.self) private var vm

    var body: some View {
        Group {
            if let binding = vm.binding(for: deviceID) {
                CompactControl(device: binding)
            } else {
                Text("Not found")
                    .foregroundStyle(.secondary)
                    .frame(width: 220, height: 100)
            }
        }
        .glassBackgroundEffect()
    }
}

/// A tiny floating control panel — designed to be placed on/near the physical device.
private struct CompactControl: View {
    @Binding var device: HomeDevice
    @State private var showControls = false

    var body: some View {
        VStack(spacing: 0) {
            // ── Header: icon + name + power (always visible, fixed size)
            header
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, showControls && device.isOn ? 14 : 18)

            // ── Expanded controls (only when Controls button toggled & device is on)
            if showControls && device.isOn {
                Divider().opacity(0.15).padding(.horizontal, 16)
                controlArea
                    .padding(.horizontal, 20)
                    .padding(.top, 14)
                    .padding(.bottom, 18)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .frame(width: 260)
        .animation(.spring(response: 0.35, dampingFraction: 0.82), value: showControls)
        .animation(.spring(response: 0.35, dampingFraction: 0.82), value: device.isOn)
        .onChange(of: device.isOn) { _, isOn in
            if !isOn { showControls = false }
        }
    }

    // MARK: Header

    private var header: some View {
        HStack(spacing: 12) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(device.isOn ? device.type.accent.opacity(0.15) : .white.opacity(0.06))
                    .frame(width: 40, height: 40)
                Image(systemName: device.isOn ? device.type.iconOn : device.type.icon)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(device.isOn ? device.type.accent : .white.opacity(0.3))
                    .contentTransition(.symbolEffect(.replace))
            }

            // Name + room
            VStack(alignment: .leading, spacing: 1) {
                Text(device.name)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                Text(device.room)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }

            Spacer(minLength: 4)

            // Controls toggle button (only when device is on)
            if device.isOn {
                Button {
                    withAnimation {
                        showControls.toggle()
                    }
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(showControls ? device.type.accent : .white.opacity(0.5))
                        .frame(width: 34, height: 34)
                        .background {
                            Circle()
                                .fill(showControls
                                      ? device.type.accent.opacity(0.15)
                                      : .white.opacity(0.06))
                        }
                }
                .buttonStyle(.plain)
                .hoverEffect(.lift)
                .transition(.scale.combined(with: .opacity))
            }

            // Power
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    device.isOn.toggle()
                }
            } label: {
                Circle()
                    .fill(device.isOn ? device.type.accent : .white.opacity(0.08))
                    .frame(width: 34, height: 34)
                    .overlay {
                        Image(systemName: "power")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(device.isOn ? .black.opacity(0.7) : .white.opacity(0.35))
                    }
            }
            .buttonStyle(.plain)
            .hoverEffect(.lift)
        }
    }

    // MARK: Control Area

    @ViewBuilder
    private var controlArea: some View {
        switch device.type {

        // ── Lighting ──
        case .light:
            VStack(spacing: 12) {
                MiniSlider(icon: "sun.max.fill", value: $device.brightness,
                           range: 0...1, display: "\(Int(device.brightness * 100))%",
                           tint: device.type.accent)
                MiniSlider(icon: "circle.lefthalf.filled", value: $device.colorTemp,
                           range: 2200...6500, display: "\(Int(device.colorTemp))K",
                           tint: device.type.accent)
            }

        // ── Climate ──
        case .thermostat:
            MiniSlider(icon: "thermometer.medium", value: $device.temperature,
                       range: 16...32, display: String(format: "%.1f°", device.temperature),
                       tint: device.type.accent)

        case .airConditioner:
            MiniSlider(icon: "snowflake", value: $device.temperature,
                       range: 16...30, display: String(format: "%.1f°", device.temperature),
                       tint: device.type.accent)

        case .heater:
            MiniSlider(icon: "flame.fill", value: $device.temperature,
                       range: 16...30, display: String(format: "%.1f°", device.temperature),
                       tint: device.type.accent)

        case .fan:
            MiniSlider(icon: "wind", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        case .airPurifier:
            MiniSlider(icon: "wind", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        case .humidifier:
            MiniSlider(icon: "humidity.fill", value: $device.humidity,
                       range: 20...80, display: "\(Int(device.humidity))%",
                       tint: device.type.accent)

        case .dehumidifier:
            MiniSlider(icon: "humidity", value: $device.humidity,
                       range: 20...80, display: "\(Int(device.humidity))%",
                       tint: device.type.accent)

        // ── Security & Access ──
        case .lock:
            HStack {
                Image(systemName: device.isLocked ? "lock.fill" : "lock.open.fill")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(device.type.accent)
                Text(device.isLocked ? "Locked" : "Unlocked")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.primary)
                Spacer()
                Toggle("", isOn: $device.isLocked)
                    .labelsHidden()
                    .tint(device.type.accent)
                    .scaleEffect(0.85)
            }

        case .securitySystem:
            HStack {
                Image(systemName: device.isArmed ? "shield.checkered" : "shield.slash")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(device.isArmed ? .green : .red)
                Text(device.isArmed ? "Armed" : "Disarmed")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.primary)
                Spacer()
                Toggle("", isOn: $device.isArmed)
                    .labelsHidden()
                    .tint(device.type.accent)
                    .scaleEffect(0.85)
            }

        case .camera:
            HStack(spacing: 8) {
                Circle().fill(.red).frame(width: 7, height: 7)
                Text("Live")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                Spacer()
                Text("Recording")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
            }

        case .doorbell:
            HStack(spacing: 8) {
                Image(systemName: "bell.and.waves.left.and.right.fill")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(device.type.accent)
                Text("Ready")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.primary)
                Spacer()
            }

        // ── Doors & Windows ──
        case .door, .garageDoor, .window:
            MiniSlider(icon: device.type.icon, value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        case .blinds:
            MiniSlider(icon: "blinds.vertical.open", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        // ── Water ──
        case .faucet:
            MiniSlider(icon: "thermometer.medium", value: $device.waterTemp,
                       range: 10...60, display: String(format: "%.0f°", device.waterTemp),
                       tint: device.type.accent)

        case .shower:
            MiniSlider(icon: "thermometer.medium", value: $device.waterTemp,
                       range: 20...50, display: String(format: "%.0f°", device.waterTemp),
                       tint: device.type.accent)

        case .sprinkler:
            MiniSlider(icon: "timer", value: $device.duration,
                       range: 5...60, display: "\(Int(device.duration)) min",
                       tint: device.type.accent)

        // ── Media ──
        case .speaker, .tv:
            MiniSlider(icon: "speaker.wave.2.fill", value: $device.volume,
                       range: 0...1, display: "\(Int(device.volume * 100))%",
                       tint: device.type.accent)

        // ── Sensor ──
        case .sensor:
            HStack(spacing: 16) {
                VStack(spacing: 2) {
                    Image(systemName: "thermometer.medium")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(device.type.accent)
                    Text(String(format: "%.1f°", device.sensorTemp))
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .monospacedDigit()
                }
                Divider().frame(height: 28)
                VStack(spacing: 2) {
                    Image(systemName: "humidity.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(device.type.accent)
                    Text("\(Int(device.sensorHumidity))%")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .monospacedDigit()
                }
                Spacer()
            }

        // ── Simple toggles ──
        case .outlet, .programmableSwitch, .other:
            HStack(spacing: 8) {
                Image(systemName: device.type.icon)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(device.type.accent)
                Text(device.isOn ? "Active" : "Inactive")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.primary)
                Spacer()
            }
        }
    }
}

/// A compact inline slider for the floating control.
private struct MiniSlider: View {
    let icon: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let display: String
    let tint: Color

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(tint)
                Spacer()
                Text(display)
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .monospacedDigit()
                    .foregroundStyle(.primary)
            }
            Slider(value: $value, in: range)
                .tint(tint)
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Preview
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#Preview("Home", windowStyle: .plain) {
    ContentView()
        .environment(HomeVM())
}
