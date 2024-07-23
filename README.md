# Pebble

![stone](https://github.com/user-attachments/assets/d836782a-85ca-4ff8-82ac-9e81f0ae1cb5)
Pebble은 UIKit을 사용하여 개발된 간단한 힐링용 돌맹이 키우기 어플리케이션입니다. 사용자에게 힐링을 제공하기 위해 물방울, 별, 하트 등의 애니메이션 효과를 포함하고 있습니다.


## 최종 화면

https://github.com/user-attachments/assets/fc7c93f3-e03f-4803-92ae-b50242afba2c


## 설치

1. 이 리포지토리를 클론합니다:
   ```bash
   git clone https://github.com/fnfn0901/Pebble.git
2. Xcode에서 Pebble.xcodeproj 파일을 엽니다.
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

- **물방울 애니메이션**: CAEmitterLayer를 사용한 자연스러운 물방울 애니메이션
- **별 애니메이션**: 별 모양의 입자를 활용한 시각적 효과
- **하트 애니메이션**: 하트 모양의 입자를 활용한 시각적 효과


## 도전과제 및 교훈

- **도전과제**: 프로젝트의 주요 도전과제는 물방울 애니메이션을 자연스럽게 구현하는 것이었습니다. 초기에는 UIView와 UIImageView를 사용한 애니메이션이 부자연스러웠으나, CAEmitterLayer와 CAEmitterCell을 활용함으로써 해결할 수 있었습니다.
- **교훈**: 이 과정을 통해 UIKit의 다양한 기능과 함께 CAEmitterLayer의 활용법을 깊이 있게 이해하게 되었습니다. 또한, 애니메이션의 자연스러움과 코드의 효율성을 높이는 방법을 배우는 소중한 경험이 되었습니다.


## 차후 계획

- **대화 기능 추가**: 백엔드 협업을 통해 소켓 및 생성형 AI를 활용하여 돌맹이와의 대화 기능을 추가할 예정입니다. 이를 통해 사용자와의 상호작용을 강화하고, 앱의 몰입도를 높일 것입니다.
- **캐시 시스템 도입**: 사용자의 활동에 따라 돌맹이를 꾸밀 수 있는 캐시 시스템을 도입하여 앱의 지속 가능성을 높일 계획입니다. 이를 통해 사용자는 다양한 활동을 통해 캐시를 획득하고, 돌맹이를 꾸미는 재미를 느낄 수 있습니다.
- **아이템 추가**: 디자이너와 협업하여 안경, 모자, 옷 등 다양한 아이템을 추가할 것입니다. 사용자는 이러한 아이템을 통해 돌맹이를 꾸미고, 자신만의 개성을 표현할 수 있습니다. 이를 통해 앱의 사용자 경험을 더욱 풍부하게 만들 것입니다.
