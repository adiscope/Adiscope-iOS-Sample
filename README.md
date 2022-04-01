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
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '2.1.0.0'
    # pod 'AdiscopeMediaAppLovin', '2.0.8.0'
    # pod 'AdiscopeMediaAdMob', '2.0.8.0'
    # pod 'AdiscopeMediaAdManager', '2.0.8.0'
    # pod 'AdiscopeMediaAdColony', '2.0.8.0' 
    # pod 'AdiscopeMediaFAN', '2.0.8.0'
    # pod 'AdiscopeMediaMobVista', '2.0.8.0'
    # pod 'AdiscopeMediaUnityAds', '2.0.8.0'
    # pod 'AdiscopeMediaVungle', '2.0.8.0'
    # pod 'AdiscopeMediaChartBoost', '2.0.8.0' 
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


- Xcode 12.0 이상일 경우 SKAdNetwork 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/2.0.6.0/AdiscopeSkAdNetworks.plist))

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
	<string></string>
	```

## Adiscope Error
Adiscope Error에 대한 구조는 [여기](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/api_documentation.md#model) 에서 확인 할 수 있습니다. 

### 에러메세지 가이드
사용자가 광고 재생을 시도 했으나, 실패하여 CS가 인입된 경우에 빠른 대응을 위해서 사용자에게 제공된 알림메세지에 에러코드를 추가할 것을 권장드립니다.

| Variable    | Description                      |
| :---------- | -------------------------------- |
| code        | error's code (AdiscopeErrorCode) |
| description | error's description              |

| Code | Error | Cause | Error Message Example |
| -- | ---------------- | ----- | -- |
| 0 | INTERNAL_ERROR   | Adiscope Sdk 내부 오류 혹은 Adiscope Server 오류 | - |
| 1 | MEDIATION_ERROR  | Mediation 광고 Network의 3rd party sdk 오류 | 재생 중에 오류가 발생했습니다. 잠시 후 다시 시도해 주세요. [Code 1] |
| 2 | INITIALIZE_ERROR | Adiscope.Sdk.Initialize 시 mediaId/mediaSecret이 유효하지 않음 | - |
| 3 | SERVER_SETTING_ERROR | 광고를 보여주기 위해 필요한 내부 설정값 오류. AndroidManifest에 설정된 값이거나 Runtime 시 server로 부터 전달 받은 값이 정확하지 않음, Adiscope admin 설정의 수익화, 유닛 활성화가 OFF인 경우 | - |
| 4 | INVALID_REQUEST | Show시, 입력한 unitId 오류 | 알 수 없는 오류로 재생에 실패하였습니다 고객센터에 문의해주세요 [Code 4] |
| 5 | NETWORK_ERROR | Network read/write timed out 혹은 Network connection 오류 | 인터넷 연결 상태를 확인 후 다시 시도해주세요 [Code 5] |
| 6 | NO_FILL | 하루에 볼 수 있는 Rewarded Video 광고의 횟수를 모두 소진 하였을 경우 | 오늘 시청 가능한 영상이 모두 소진되었습니다 내일 다시 시도해주세요 [Code 6] |
| 7 | TIME_LIMIT | Rewarded Video 광고를 한번 보여주고 난 후 일정 시간 (30초~60초, Adiscope admin page에서 설정된 시간 간격)이 지나기 전에 다시 Show를 시도할 경우 | 재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 [Code 7] |
| 8 | NOT_EXIST_IDFA | iOS 디바이스에서 추출된 IDFA 값이 없거나, UserTracking의 추적 중지일 경우 | 설정에서 광고 추적을 허용해주세요 [Code 8] |
| 9 | GOOGLE_FAMILY_ERROR (Only Android) | - | - |
| 10 | INVALID_ADID (Only Android) | - | - |
| 11 | TIME_OUT | 세팅한 기간 내에 Mediation 광고 네트워크의 로드 성공 콜백이 오지 않은 경우 | 재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 [Code 11] |
| 12 | SHOW_CALLED_BEFORE_LOAD | RewardedVideoAd.Show()를 Load() 없이 실행하였을 경우 | 재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 [Code 12] |
