# Adiscope for iOS Integration


## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 11.0 +



## Installation

### CocoaPods
CocoaPods는 Cocoa projects의 Dependency를 관리할 수 있습니다. 다음과 같은 명령어를 사용하여 설치를 진행합니다.
```
$ gem install cocoapods
```



CocoaPods의 Xcode project내에 Podfile에서 기술합니다.

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '3.2.0'
    # pod 'AdiscopeMediaAdManager', '3.2.0'
    # pod 'AdiscopeMediaAdMob', '3.2.0'
    # pod 'AdiscopeMediaAppLovin', '3.2.0'
    # pod 'AdiscopeMediaChartBoost', '3.2.0'
    # pod 'AdiscopeMediaFAN', '3.2.0'
    # pod 'AdiscopeMediaIronsource', '3.2.0'
    # pod 'AdiscopeMediaMax', '3.2.0'
    # pod 'AdiscopeMediaMobVista', '3.2.0'
    # pod 'AdiscopeMediaPangle', '3.2.0'
    # pod 'AdiscopeMediaUnityAds', '3.2.0'
    # pod 'AdiscopeMediaVungle', '3.2.0'
end
```



그리고 다음의 명령어를 실행합니다.

```
$ pod install --repo-update
```



### Manual

* Native Manual 설치는 해당 [문서](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/Installation_manual.md)



## Setup Xcode

### info.plist 수정

- App Tracking Permission 추가

	```
	<key>NSUserTrackingUsageDescription</key>
	<string></string>
	```


- Xcode 12.0 이상이거나 Max를 사용하면 SKAdNetwork 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.2.0/AdiscopeSkAdNetworks.plist))

  ```
  <dict>
	  <key>SKAdNetworkItems</key>
	    <array>
	      <dict>
	        <key>SKAdNetworkIdentifier</key>
	        <string></string>
	      </dict>
	    </array>
  </dict>
  ```


- **(Admob)** info.plist 에 "GADIsAdManagerApp" 설정

	```
	<key>GADIsAdManagerApp</key>
	<true/>
	<key>GADApplicationIdentifier</key>
	<string></string>
	```


- **(AppLovin)** info.plist 에 Key 설정

	```
	<key>AppLovinSdkKey</key>
	<string></string>
	```

## Adiscope Error
Adiscope Error에 대한 구조는 [여기](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/api_documentation.md#model) 에서 확인 할 수 있습니다. 

## Adiscope Server [연동하기](https://github.com/adiscope/Adiscope-Android-Sample/blob/2.1.2.0/docs/reward_callback_info.md)
