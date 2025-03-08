# iOS App Setup

#### UIKit Project Structure

```
ProjectName
├─ App/
│  ├─ Lifecycle/
│  │  ├─ AppDelegate.swift
│  │  └─ SceneDelegate.swift
│  └─ Info.plist
├─ Context/
│  ├─ AppContext.swift
│  ├─ DeviceContext.swift
│  ├─ WindowContext.swift
│  └─ XcodeContext.swift
├─ Strings/
│  └─ Strings.swift
├─ Swift/
│  └─ INSERT EXTENSION FILES HERE
├─ Testing/
│  ├─ Assertions.swift
│  ├─ Metrics.swift
│  └─ INSERT TEST FILES HERE
├─ Model Layer/
│  └─ INSERT MODEL FILES HERE
├─ Controller Layer/
│  ├─ Storyboards/
│  │  ├─ LaunchScreen.storyboard
│  │  └─ Main.storyboard
│  └─ INSERT VIEW CONTROLLER FILES HERE
└─ View Layer/
   ├─ Views
   │  ├─ Core/
   │  │  └─ INSERT CORE VIEWS HERE
   │  ├─ Containers/
   │  │  └─ INSERT CONTAINER VIEWS HERE
   │  └─ Custom/
   │     └─ INSERT CUSTOM VIEWS HERE
   ├─ Assets
   │  ├─ Assets.xcassets/
   │  └─ Fonts/
   │     └─ INSERT FONTS HERE
   ├─ Presets
   │  └─ INSERT PRESET FILES HERE (COLOR, FONT, ETC DEFINITIONS)
   └─ Preview Content
      ├─ Preview Assets.xcassets/
      └─ INSERT PREVIEW FILES HERE
```

