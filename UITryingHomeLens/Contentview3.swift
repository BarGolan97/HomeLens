import SwiftUI

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Device Type
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

enum DeviceType: String, CaseIterable, Equatable, Codable {
    case light, thermostat, lock, speaker, camera, fan, blinds, tv

    var label: String {
        switch self {
        case .light:      "Light"
        case .thermostat: "Thermostat"
        case .lock:       "Lock"
        case .speaker:    "Speaker"
        case .camera:     "Camera"
        case .fan:        "Fan"
        case .blinds:     "Blinds"
        case .tv:         "TV"
        }
    }

    var icon: String {
        switch self {
        case .light:      "lightbulb.fill"
        case .thermostat: "thermometer.medium"
        case .lock:       "lock.fill"
        case .speaker:    "hifispeaker.2.fill"
        case .camera:     "video.fill"
        case .fan:        "fanblades.fill"
        case .blinds:     "blinds.vertical.open"
        case .tv:         "tv.inset.filled"
        }
    }

    var accent: Color {
        switch self {
        case .light:      Color(red: 1.0, green: 0.78, blue: 0.28)
        case .thermostat: Color(red: 1.0, green: 0.44, blue: 0.30)
        case .lock:       Color(red: 0.30, green: 0.85, blue: 0.46)
        case .speaker:    Color(red: 0.35, green: 0.58, blue: 1.0)
        case .camera:     Color(red: 0.70, green: 0.42, blue: 1.0)
        case .fan:        Color(red: 0.30, green: 0.82, blue: 0.88)
        case .blinds:     Color(red: 0.55, green: 0.55, blue: 0.80)
        case .tv:         Color(red: 0.95, green: 0.40, blue: 0.56)
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
    var brightness: Double
    var temperature: Double
    var volume: Double
    var isLocked: Bool
    var colorTemp: Double

    init(
        name: String, room: String, type: DeviceType,
        isOn: Bool = false, brightness: Double = 0.72,
        temperature: Double = 22.0, volume: Double = 0.55,
        isLocked: Bool = true, colorTemp: Double = 3800
    ) {
        self.id = UUID()
        self.name = name
        self.room = room
        self.type = type
        self.isOn = isOn
        self.brightness = brightness
        self.temperature = temperature
        self.volume = volume
        self.isLocked = isLocked
        self.colorTemp = colorTemp
    }

    static let sample: [HomeDevice] = [
        HomeDevice(name: "Ceiling Light",   room: "Living Room", type: .light,      isOn: true,  brightness: 0.85, colorTemp: 3200),
        HomeDevice(name: "Smart TV",        room: "Living Room", type: .tv,         isOn: true,  volume: 0.40),
        HomeDevice(name: "Soundbar",        room: "Living Room", type: .speaker,    isOn: true,  volume: 0.45),
        HomeDevice(name: "Climate Control", room: "Living Room", type: .thermostat, isOn: true,  temperature: 22.5),
        HomeDevice(name: "Bedside Lamp",    room: "Bedroom",     type: .light,      isOn: false, brightness: 0.35, colorTemp: 2700),
        HomeDevice(name: "Ceiling Fan",     room: "Bedroom",     type: .fan,        isOn: true,  brightness: 0.60),
        HomeDevice(name: "Front Door",      room: "Entrance",    type: .lock,       isOn: true,  isLocked: true),
        HomeDevice(name: "Front Camera",    room: "Entrance",    type: .camera,     isOn: true),
        HomeDevice(name: "Kitchen Light",   room: "Kitchen",     type: .light,      isOn: false, colorTemp: 5500),
        HomeDevice(name: "Roller Blinds",   room: "Office",      type: .blinds,     isOn: false, brightness: 0.30),
        HomeDevice(name: "Desk Lamp",       room: "Office",      type: .light,      isOn: true,  brightness: 0.80, colorTemp: 5000),
        HomeDevice(name: "Studio Monitor",  room: "Office",      type: .speaker,    isOn: false, volume: 0.60),
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
                    .lineLimit(1)
                Text(statusText)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(device.isOn ? device.type.accent.opacity(0.9) : .secondary)
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
            Image(systemName: device.type.icon)
                .font(.system(size: 19, weight: .semibold))
                .foregroundStyle(device.isOn ? device.type.accent : .white.opacity(0.35))
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
        case .light:         return "\(Int(device.brightness * 100))% · \(Int(device.colorTemp))K"
        case .thermostat:    return String(format: "%.1f°C", device.temperature)
        case .lock:          return device.isLocked ? "Locked" : "Unlocked"
        case .speaker, .tv:  return "Vol \(Int(device.volume * 100))%"
        case .fan:           return "Speed \(Int(device.brightness * 100))%"
        case .camera:        return "Live"
        case .blinds:        return "\(Int(device.brightness * 100))% open"
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

    var body: some View {
        VStack(spacing: 0) {
            // ── Header: icon + name + power
            header
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 14)

            // ── Control (only when on)
            if device.isOn {
                Divider().opacity(0.15).padding(.horizontal, 16)
                controlArea
                    .padding(.horizontal, 20)
                    .padding(.top, 14)
                    .padding(.bottom, 18)
            } else {
                Spacer().frame(height: 4)
            }
        }
        .frame(width: 260)
        .animation(.easeInOut(duration: 0.25), value: device.isOn)
    }

    // MARK: Header

    private var header: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(device.isOn ? device.type.accent.opacity(0.15) : .white.opacity(0.06))
                    .frame(width: 40, height: 40)
                Image(systemName: device.type.icon)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(device.isOn ? device.type.accent : .white.opacity(0.3))
            }

            // Name + room
            VStack(alignment: .leading, spacing: 1) {
                Text(device.name)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                Text(device.room)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 4)

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
        case .light:
            MiniSlider(icon: "sun.max.fill", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        case .thermostat:
            MiniSlider(icon: "thermometer.medium", value: $device.temperature,
                       range: 16...32, display: String(format: "%.1f°", device.temperature),
                       tint: device.type.accent)

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

        case .speaker, .tv:
            MiniSlider(icon: "speaker.wave.2.fill", value: $device.volume,
                       range: 0...1, display: "\(Int(device.volume * 100))%",
                       tint: device.type.accent)

        case .fan:
            MiniSlider(icon: "wind", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

        case .blinds:
            MiniSlider(icon: "blinds.vertical.open", value: $device.brightness,
                       range: 0...1, display: "\(Int(device.brightness * 100))%",
                       tint: device.type.accent)

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
