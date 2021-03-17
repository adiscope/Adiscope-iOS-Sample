# Adiscope for iOS Integration


## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 11.0 +



## Installation

CocoaPods는 Cocoa projects의 Dependency를 관리할 수 있습니다. 다음과 같은 명령어를 사용하여 설치를 진행합니다.
```
$ gem install cocoapods
```



CocoaPods의 Xcode project내에 Podfile에서 기술합니다.

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '1.6.6.0'
    # pod 'AdiscopeMediaAppLovin', '1.6.0.0'
    # pod 'AdiscopeMediaAdMob', '1.6.0.0'
    # pod 'AdiscopeMediaAdColony', '1.6.0.0'
    # pod 'AdiscopeMediaFAN', '1.6.1.0'
    # pod 'AdiscopeMediaMobVista', '1.6.4.0'
    # pod 'AdiscopeMediaUnityAds', '1.6.6.0'
    # pod 'AdiscopeMediaVungle', '1.6.0.0'
end
```



그리고 다음의 명령어를 실행합니다.

```
$ pod install --repo-update
```



## Setup Xcode

### info.plist 수정

- App Tracking Permission 추가

	```
	<key>NSUserTrackingUsageDescription</key>
	<string></string>
	```


- Xcode 12.0 이상일 경우 SKAdNetwork 추가 ([Download](https://s3-ap-northeast-1.amazonaws.com/file.adiscope.com/AdiscopeSkAdNetworks.plist))

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
	```


- **(AppLovin)** info.plist 에 Key 설정

	```
	<key>AppLovinSdkKey</key>
	<string>URhay2tKwCEd5D15ONJFui9Z7RfNKG0piiOemF-fSDHXRJdqhx3ZeD8mfo8-39omtAPcPOHscZO2t0sTyw7a8G</string>
	```
	


