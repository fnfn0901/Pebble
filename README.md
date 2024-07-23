# Pebble

Pebble은 UIKit을 사용하여 개발된 간단한 힐링용 돌맹이 키우기 어플리케이션입니다. 사용자에게 힐링을 제공하기 위해 물방울, 별, 하트 등의 애니메이션 효과를 포함하고 있습니다.

## Table of Contents

- [기술 스택](#기술-스택)
- [설치](#설치)
- [사용 방법](#사용-방법)
- [프로젝트 구조](#프로젝트-구조)
- [주요 기능](#주요-기능)
- [기여 방법](#기여-방법)
- [라이선스](#라이선스)

## 기술 스택

- Swift
- UIKit
- Figma
- Git
- Github

## 설치

1. 이 리포지토리를 클론합니다:
   ```bash
   git clone https://github.com/fnfn0901/Pebble.git
   ```

2. Xcode에서 `Pebble.xcodeproj` 파일을 엽니다.

3. 필요한 의존성을 설치합니다.

## 사용 방법

1. Xcode에서 프로젝트를 빌드하고 실행합니다.
2. 어플리케이션을 통해 돌맹이를 키우고, 다양한 애니메이션 효과를 경험해보세요.

## 프로젝트 구조

```
Pebble
├── Controllers
│   ├── NameSettingController.swift
│   └── ViewController.swift
├── CustomComponents
│   ├── CustomButton.swift
│   └── CustomTextField.swift
├── Views
│   ├── HeartEmitterView.swift
│   ├── StarEmitterView.swift
│   └── WaterEmitterView.swift
├── AppDelegate.swift
├── SceneDelegate.swift
├── Assets
├── Info.plist
└── Main
```

### 주요 폴더 설명

- **Controllers**: 뷰 컨트롤러들이 포함된 폴더입니다.
- **CustomComponents**: 커스텀 UI 컴포넌트들이 포함된 폴더입니다.
- **Views**: 다양한 애니메이션 효과를 제공하는 커스텀 뷰들이 포함된 폴더입니다.

## 주요 기능

- **물방울 애니메이션**: `CAEmitterLayer`를 사용한 자연스러운 물방울
