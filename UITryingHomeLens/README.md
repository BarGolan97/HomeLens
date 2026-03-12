# SmartHomeVision — visionOS 2 Spatial Smart Home Demo

A **fully mock** spatial computing Smart Home interface for Apple Vision Pro.
No HomeKit, no real devices — runs entirely in the **visionOS Simulator**.

---

## Quick Start

1. Open Xcode 16+ (with visionOS 2 SDK).
2. **File → New → Project → visionOS → App** (name it `SmartHomeVision`).
3. In the template wizard:
   - Initial Scene: **Window**
   - Immersive Space: **Mixed** (this adds the correct entitlements)
   - Use Swift 6 language mode.
4. **Replace** the generated Swift files with the ones in this folder.
5. Make sure `Info.plist` is included in the target.
6. Build & Run on the **Apple Vision Pro Simulator**.

---

## Architecture

```
SmartHomeApp.swift        App entry — WindowGroup + ImmersiveSpace(.mixed)
  ├── ContentView.swift   Flat glass launcher — device overview, spatial toggle
  ├── ImmersiveHomeView.swift   RealityView + Attachments API — floating 3D buttons
  └── MockHomeData.swift  @Observable state — devices, positions, on/off
      └── SmartDevice      Identifiable struct with SIMD3<Float> coordinates
```

### Key Patterns

| Concern | Implementation |
|---------|---------------|
| State | `@Observable` macro on `MockHomeData`, injected via `.environment()` |
| 3D Layout | `RealityView` `attachments:` closure renders SwiftUI per device |
| Anchoring | Invisible `Entity` per device, positioned by `SIMD3<Float>` |
| Gaze | `HoverEffectComponent` → native visionOS eye-tracking highlight |
| Interaction | `InputTargetComponent` + `CollisionComponent` + `SpatialTapGesture` |
| Visuals | `.glassBackgroundEffect()`, SF Symbols with `.symbolEffect`, glow rings |

### Device Layout (Top-Down Sketch)

```
              User
               │
   ┌───────────┼───────────┐
   │           │           │
  Lock     Fan  ·  Speaker  Thermostat
(-0.55)  (-0.3)    (0.25)   (0.8)
   │           │           │
  Lamp     ────┴────    Blinds
 (-0.8)                  (0.55)
```

All positions are in **meters** from the world origin.  
Negative Z = in front of the user; Y ≈ 1.0 – 1.6 = comfortable eye height.

---

## Customisation

- **Add devices** → append to `MockHomeData.init()`.
- **Change positions** → edit the `SIMD3<Float>` values.
- **New categories** → extend `DeviceCategory` with icon pairs + accent colour.
- **Real integration** → swap `MockHomeData` for a HomeKit-backed observable.

---

## Requirements

| Tool | Version |
|------|---------|
| Xcode | 16.0+ |
| visionOS SDK | 2.0+ |
| Swift | 6.0 |
| Simulator | Apple Vision Pro |

No third-party dependencies. No network access required.
