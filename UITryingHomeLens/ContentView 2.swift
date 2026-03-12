//// ContentView.swift
//// SmartHomeVision
////
//// Flat launcher window — shows device summary and lets the user
//// open / close the immersive spatial experience.
//
//import SwiftUI
//
//struct ContentView: View {
//
//    @Environment(MockHomeData.self) private var homeData
//    @Binding var immersiveSpaceIsShown: Bool
//
//    var openSpace: () async -> Void
//    var dismissSpace: () async -> Void
//
//    @State private var isLoading = false
//
//    var body: some View {
//        VStack(spacing: 0) {
//
//            // ── Header ──────────────────────────────────────────
//            header
//                .padding(.top, 32)
//                .padding(.bottom, 24)
//
//            Divider()
//                .opacity(0.4)
//
//            // ── Device Summary Grid ─────────────────────────────
//            deviceGrid
//                .padding(.vertical, 20)
//                .padding(.horizontal, 24)
//
//            Spacer(minLength: 8)
//
//            Divider()
//                .opacity(0.4)
//
//            // ── Footer Controls ─────────────────────────────────
//            footer
//                .padding(.vertical, 20)
//                .padding(.horizontal, 24)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .glassBackgroundEffect()
//    }
//
//    // MARK: – Sub-views
//
//    private var header: some View {
//        VStack(spacing: 8) {
//            Image(systemName: "house.fill")
//                .font(.system(size: 36, weight: .light))
//                .foregroundStyle(.white.opacity(0.85))
//                .symbolEffect(.pulse, options: .repeating.speed(0.4), isActive: immersiveSpaceIsShown)
//
//            Text("Smart Home")
//                .font(.system(size: 28, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//
//            Text("\(homeData.activeCount) of \(homeData.devices.count) devices active")
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//        }
//    }
//
//    private var deviceGrid: some View {
//        LazyVGrid(
//            columns: Array(repeating: GridItem(.flexible(), spacing: 14), count: 3),
//            spacing: 14
//        ) {
//            ForEach(homeData.devices) { device in
//                DeviceTile(device: device)
//            }
//        }
//    }
//
//    private var footer: some View {
//        VStack(spacing: 14) {
//            // Primary action — enter / exit spatial mode
//            Button {
//                Task {
//                    isLoading = true
//                    if immersiveSpaceIsShown {
//                        await dismissSpace()
//                    } else {
//                        await openSpace()
//                    }
//                    isLoading = false
//                }
//            } label: {
//                HStack(spacing: 10) {
//                    if isLoading {
//                        ProgressView()
//                            .tint(.white)
//                    } else {
//                        Image(systemName: immersiveSpaceIsShown
//                              ? "xmark.circle.fill"
//                              : "view.3d")
//                    }
//                    Text(immersiveSpaceIsShown ? "Exit Spatial View" : "Enter Spatial View")
//                        .fontWeight(.medium)
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 12)
//            }
//            .buttonStyle(.borderedProminent)
//            .tint(immersiveSpaceIsShown ? .red.opacity(0.7) : .blue.opacity(0.7))
//            .animation(.easeInOut(duration: 0.25), value: immersiveSpaceIsShown)
//
//            // Quick actions row
//            HStack(spacing: 12) {
//                Button {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        homeData.turnAllOn()
//                    }
//                } label: {
//                    Label("All On", systemImage: "bolt.fill")
//                        .frame(maxWidth: .infinity)
//                }
//                .buttonStyle(.bordered)
//
//                Button {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        homeData.turnAllOff()
//                    }
//                } label: {
//                    Label("All Off", systemImage: "moon.fill")
//                        .frame(maxWidth: .infinity)
//                }
//                .buttonStyle(.bordered)
//            }
//        }
//    }
//}
//
//// MARK: – Device Tile (small summary card)
//
//private struct DeviceTile: View {
//
//    let device: SmartDevice
//
//    var body: some View {
//        VStack(spacing: 6) {
//            Image(systemName: device.isOn ? device.category.iconOn : device.category.iconOff)
//                .font(.system(size: 22))
//                .foregroundStyle(device.isOn ? accentColor : .secondary)
//                .contentTransition(.symbolEffect(.replace))
//
//            Text(device.name)
//                .font(.caption2)
//                .foregroundStyle(.primary)
//                .lineLimit(1)
//
//            Text(device.isOn ? "On" : "Off")
//                .font(.system(size: 10, weight: .medium, design: .rounded))
//                .foregroundStyle(device.isOn ? accentColor : .secondary)
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 6)
//        .frame(maxWidth: .infinity)
//        .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
//        .animation(.easeInOut(duration: 0.3), value: device.isOn)
//    }
//
//    private var accentColor: Color {
//        Color(hex: device.category.accentHex)
//    }
//}
//
//// MARK: – Hex → Color helper
//
//extension Color {
//    init(hex: String) {
//        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
//        var int: UInt64 = 0
//        Scanner(string: hex).scanHexInt64(&int)
//        let r = Double((int >> 16) & 0xFF) / 255.0
//        let g = Double((int >>  8) & 0xFF) / 255.0
//        let b = Double( int        & 0xFF) / 255.0
//        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1)
//    }
//}
