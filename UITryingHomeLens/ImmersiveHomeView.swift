//// ImmersiveHomeView.swift
//// SmartHomeVision
////
//// The spatial experience.  Each mock device becomes a floating SwiftUI
//// glass button anchored in 3D space via RealityKit attachments.
//// Eye-tracking hover + pinch-to-toggle interaction.
//
//import SwiftUI
//import RealityKit
//
//struct ImmersiveHomeView: View {
//
//    @Environment(MockHomeData.self) private var homeData
//
//    /// Root entity that parents all device anchors.
//    @State private var rootEntity = Entity()
//
//    var body: some View {
//        RealityView { content, attachments in
//            // Add the persistent root.
//            content.add(rootEntity)
//
//            // Create an invisible anchor entity for every device,
//            // position it, and attach the SwiftUI view.
//            for device in homeData.devices {
//                let anchor = makeAnchorEntity(for: device)
//
//                if let attachment = attachments.entity(for: device.id) {
//                    anchor.addChild(attachment)
//                }
//
//                rootEntity.addChild(anchor)
//            }
//
//        } update: { _, attachments in
//            // When state changes, re-parent attachments so they stay in sync.
//            for device in homeData.devices {
//                if let attachment = attachments.entity(for: device.id) {
//                    // Ensure attachment is parented correctly (idempotent).
//                    if let existingAnchor = rootEntity.children.first(where: { $0.name == device.id.uuidString }) {
//                        if attachment.parent != existingAnchor {
//                            existingAnchor.addChild(attachment)
//                        }
//                    }
//                }
//            }
//
//        } attachments: {
//            // Generate one SwiftUI attachment per device.
//            ForEach(homeData.devices) { device in
//                Attachment(id: device.id) {
//                    SpatialDeviceButton(device: device) {
//                        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
//                            homeData.toggle(device.id)
//                        }
//                    }
//                }
//            }
//        }
//        // Spatial tap gesture targeted at entities with InputTargetComponent.
//        .gesture(
//            SpatialTapGesture()
//                .targetedToAnyEntity()
//                .onEnded { value in
//                    guard let deviceID = UUID(uuidString: value.entity.name) else { return }
//                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
//                        homeData.toggle(deviceID)
//                    }
//                }
//        )
//    }
//
//    // MARK: – Entity Factory
//
//    /// Creates an invisible anchor entity with collision + input + hover components.
//    private func makeAnchorEntity(for device: SmartDevice) -> Entity {
//        let entity = Entity()
//        entity.name = device.id.uuidString
//        entity.position = device.position
//
//        // Collision shape so the system can hit-test on gaze / pinch.
//        let collisionRadius: Float = 0.06
//        entity.components.set(
//            CollisionComponent(shapes: [.generateSphere(radius: collisionRadius)])
//        )
//
//        // Allow this entity to receive indirect (eye + hand) input.
//        entity.components.set(
//            InputTargetComponent(allowedInputTypes: .indirect)
//        )
//
//        // Native visionOS hover highlight on eye gaze.
//        entity.components.set(HoverEffectComponent())
//
//        return entity
//    }
//}
//
//// MARK: – Spatial Device Button (SwiftUI Attachment)
//
///// A single floating glass button rendered as a SwiftUI view
///// and attached to a RealityKit entity in 3D space.
//private struct SpatialDeviceButton: View {
//
//    let device: SmartDevice
//    let onTap: () -> Void
//
//    @State private var isHovered = false
//
//    private var accent: Color { Color(hex: device.category.accentHex) }
//
//    var body: some View {
//        Button(action: onTap) {
//            VStack(spacing: 10) {
//                // Icon
//                ZStack {
//                    // Glow ring when ON
//                    if device.isOn {
//                        Circle()
//                            .fill(accent.opacity(0.25))
//                            .frame(width: 64, height: 64)
//                            .blur(radius: 12)
//                    }
//
//                    Image(systemName: device.isOn ? device.category.iconOn : device.category.iconOff)
//                        .font(.system(size: 30, weight: .medium))
//                        .foregroundStyle(device.isOn ? accent : .white.opacity(0.6))
//                        .contentTransition(.symbolEffect(.replace))
//                        .frame(width: 52, height: 52)
//                }
//
//                // Labels
//                VStack(spacing: 2) {
//                    Text(device.name)
//                        .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        .foregroundStyle(.white)
//
//                    Text(device.room)
//                        .font(.system(size: 11, weight: .regular, design: .rounded))
//                        .foregroundStyle(.white.opacity(0.55))
//                }
//
//                // State pill
//                Text(stateLabel)
//                    .font(.system(size: 10, weight: .bold, design: .rounded))
//                    .tracking(0.8)
//                    .textCase(.uppercase)
//                    .foregroundStyle(device.isOn ? accent : .white.opacity(0.4))
//                    .padding(.horizontal, 10)
//                    .padding(.vertical, 4)
//                    .background(
//                        Capsule()
//                            .fill(device.isOn ? accent.opacity(0.15) : .white.opacity(0.06))
//                    )
//            }
//            .padding(.vertical, 18)
//            .padding(.horizontal, 20)
//            .frame(minWidth: 130)
//            .glassBackgroundEffect()
//            .clipShape(.rect(cornerRadius: 22))
//            .overlay(
//                RoundedRectangle(cornerRadius: 22)
//                    .strokeBorder(
//                        device.isOn ? accent.opacity(0.5) : .white.opacity(0.08),
//                        lineWidth: 1
//                    )
//            )
//            .shadow(color: device.isOn ? accent.opacity(0.3) : .clear, radius: 20, y: 4)
//            .scaleEffect(isHovered ? 1.06 : 1.0)
//        }
//        .buttonStyle(.plain)
//        .onHover { hovering in
//            withAnimation(.easeOut(duration: 0.2)) {
//                isHovered = hovering
//            }
//        }
//        .animation(.easeInOut(duration: 0.35), value: device.isOn)
//        .accessibilityLabel("\(device.name), \(stateLabel)")
//        .accessibilityHint("Pinch to toggle")
//    }
//
//    private var stateLabel: String {
//        switch device.category {
//        case .lock:  return device.isOn ? "Unlocked" : "Locked"
//        case .blind: return device.isOn ? "Open"     : "Closed"
//        default:     return device.isOn ? "On"       : "Off"
//        }
//    }
//}
