//// MockHomeData.swift
//// SmartHomeVision
////
//// Observable state that drives the entire app.
//// Each SmartDevice carries a spatial position, on/off state, and display metadata.
//
//import Foundation
//import Observation
//import simd
//
//// MARK: – Device Category
//
//enum DeviceCategory: String, CaseIterable, Sendable {
//    case light      = "Light"
//    case fan        = "Fan"
//    case speaker    = "Speaker"
//    case thermostat = "Thermostat"
//    case lock       = "Lock"
//    case blind      = "Blind"
//
//    /// SF Symbol name for the "off" state.
//    var iconOff: String {
//        switch self {
//        case .light:      return "lamp.desk"
//        case .fan:        return "fan"
//        case .speaker:    return "hifispeaker"
//        case .thermostat: return "thermometer.snowflake"
//        case .lock:       return "lock"
//        case .blind:      return "blinds.vertical.closed"
//        }
//    }
//
//    /// SF Symbol name for the "on" state.
//    var iconOn: String {
//        switch self {
//        case .light:      return "lamp.desk.fill"
//        case .fan:        return "fan.fill"
//        case .speaker:    return "hifispeaker.fill"
//        case .thermostat: return "thermometer.sun.fill"
//        case .lock:       return "lock.open.fill"
//        case .blind:      return "blinds.vertical.open"
//        }
//    }
//
//    /// Brand tint when the device is active.
//    var accentHex: String {
//        switch self {
//        case .light:      return "#FFD60A"   // warm gold
//        case .fan:        return "#64D2FF"   // sky blue
//        case .speaker:    return "#BF5AF2"   // purple
//        case .thermostat: return "#FF6961"   // coral
//        case .lock:       return "#30D158"   // green
//        case .blind:      return "#A2845E"   // tan
//        }
//    }
//}
//
//// MARK: – Smart Device
//
///// A single mock smart-home device.
//struct SmartDevice: Identifiable, Sendable {
//    let id: UUID
//    let name: String
//    let category: DeviceCategory
//    var isOn: Bool
//    /// Position in world space (meters from origin).
//    let position: SIMD3<Float>
//    /// Descriptive subtitle (e.g. "Living Room").
//    let room: String
//}
//
//// MARK: – Mock Home Data (Observable)
//
//@Observable
//final class MockHomeData {
//
//    var devices: [SmartDevice]
//
//    /// Number of devices currently powered on.
//    var activeCount: Int { devices.filter(\.isOn).count }
//
//    init() {
//        // Spatial positions arranged in a gentle arc in front of the user.
//        // X = left/right, Y = up/down, Z = depth (negative = in front).
//        devices = [
//            SmartDevice(
//                id: UUID(),
//                name: "Desk Lamp",
//                category: .light,
//                isOn: true,
//                position: SIMD3<Float>(-0.8, 1.3, -1.8),
//                room: "Office"
//            ),
//            SmartDevice(
//                id: UUID(),
//                name: "Ceiling Fan",
//                category: .fan,
//                isOn: false,
//                position: SIMD3<Float>(-0.3, 1.6, -2.0),
//                room: "Living Room"
//            ),
//            SmartDevice(
//                id: UUID(),
//                name: "HomePod",
//                category: .speaker,
//                isOn: true,
//                position: SIMD3<Float>(0.25, 1.3, -2.0),
//                room: "Kitchen"
//            ),
//            SmartDevice(
//                id: UUID(),
//                name: "Thermostat",
//                category: .thermostat,
//                isOn: false,
//                position: SIMD3<Float>(0.8, 1.5, -1.8),
//                room: "Hallway"
//            ),
//            SmartDevice(
//                id: UUID(),
//                name: "Front Door",
//                category: .lock,
//                isOn: false,
//                position: SIMD3<Float>(-0.55, 1.0, -1.6),
//                room: "Entryway"
//            ),
//            SmartDevice(
//                id: UUID(),
//                name: "Window Blinds",
//                category: .blind,
//                isOn: true,
//                position: SIMD3<Float>(0.55, 1.0, -1.6),
//                room: "Bedroom"
//            ),
//        ]
//    }
//
//    // MARK: – Actions
//
//    func toggle(_ deviceID: UUID) {
//        guard let idx = devices.firstIndex(where: { $0.id == deviceID }) else { return }
//        devices[idx].isOn.toggle()
//    }
//
//    func turnAllOff() {
//        for idx in devices.indices { devices[idx].isOn = false }
//    }
//
//    func turnAllOn() {
//        for idx in devices.indices { devices[idx].isOn = true }
//    }
//
//    func device(for id: UUID) -> SmartDevice? {
//        devices.first { $0.id == id }
//    }
//}
