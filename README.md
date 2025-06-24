# Adiscope for iOS Integration
[![GitHub package.json version](https://img.shields.io/badge/iOS-4.4.0-blue)](../../releases)
[![GitHub package.json version](https://img.shields.io/badge/Android-4.4.0-blue)](https://github.com/adiscope/Adiscope-Android-Sample)
[![GitHub package.json version](https://img.shields.io/badge/Unity-4.4.0-blue)](https://github.com/adiscope/Adiscope-Unity-UPM)
[![GitHub package.json version](https://img.shields.io/badge/Flutter-4.4.0-blue)](https://pub.dev/packages/adiscope_flutter_plugin)
[![GitHub package.json version](https://img.shields.io/badge/ReactNative-4.4.0-blue)](https://www.npmjs.com/package/@adiscope.ad/adiscope-react-native)

- 지원 환경 : **iOS 13.0 + / iPadOS 13.0 + / Xcode 16.0 +**
<details>
<summary>Networks Version</summary>
<div markdown="1">  

| Ad Network          | iOS Version |
|---------------------|-------------|
| AdMob               | 12.2.0      |
| Amazon              | 5.1.0       |
| AppLovin            | 13.1.0      |
| BidMachine          | 3.2.1       |
| Chartboost          | 9.8.1       |
| DT Exchange         | 8.3.5       |
| InMobi              | 10.8.2      |
| ironSource	      | 8.8.0.0     |
| Liftoff(Vungle)     | 7.4.4       |
| Meta(Fan)           | 6.17.1      |
| Mintegral(Mobvista) | 7.7.7       |
| Moloco              | 3.7.2       |
| Ogury               | 5.0.2       |
| Pangle              | 6.5.0.9     |
| Unity Ads           | 4.14.0      |

</div>
</details>
<br/>

## Contents
#### [Installation](#installation-1)
- [1. CocoaPods](#1-cocoapods)
- [2. SPM(Swift Package Manager)](./swift_package_manager.md)
- [3. Manual Installation](./Installation_manual.md)
#### [Setup Xcode](#setup-xcode-1)
- [1. info.plist 수정](#1-infoplist-수정)
- [2. AppDelegate 추가](#2-appdelegate-추가)
- [3. Privacy Manifest 정책 적용](#3-privacy-manifest-정책-적용)
#### [Adiscope Overview](#adiscope-overview-1)
- [1. Import](#1-import-필수)
- [2. Initialize](#2-initialize-필수)
- [3. 사용자 정보 설정](#3-사용자-정보-설정-필수)
- [4. Offerwall](#4-offerwall)
- [5. RewardedVideo](#5-rewardedvideo)
- [6. Interstitial](#6-interstitial)
- [7. RewardedInterstitial](#7-rewardedinterstitial)
- [8. AdEvent](#8-adevent)
#### [Adiscope Error Information](./api_documentation.md#model)
#### [Adiscope Server 연동하기](./reward_callback_info.md)
#### [iOS 16+ Offerwall 세로 모드 전환 적용 방법(가로모드 전용일 경우)](./apple_orientations.md)
#### [Adiscope Old Release Note](./old_release_note.md)
<br/>


## Installation
### 1. CocoaPods
- CocoaPods는 Cocoa Projects의 Dependency를 관리할 수 있음

#### A. CocoaPods Install
```ruby
gem install cocoapods
```
- 명령어를 사용하여 설치 진행
<br/>

#### B. Podfile
- CocoaPods의 Xcode Project내에 Podfile에서 기술
```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '4.4.0'
    pod 'AdiscopeAdEvent', '4.3.0'
    pod 'AdiscopeMediaAdManager', '4.3.0'
    pod 'AdiscopeMediaAdMob', '4.3.0'
    pod 'AdiscopeMediaChartBoost', '4.3.0'
    pod 'AdiscopeMediaPangle', '4.3.0'
    pod 'AdiscopeMediaVungle', '4.3.0'
    pod 'AdiscopeMediaMax', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterAdManager', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterAdMob', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterAmazon', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterBidMachine', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterChartBoost', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterDTExchange', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterFan', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterInMobi', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterIronSource', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterMobVista', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterMoloco', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterOgury', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterPangle', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterUnityAds', '4.3.0'
    pod 'AdiscopeMediaMaxAdapterVungle', '4.3.0'
end
```
- Version이 상이할 경우 Initialize시 Log를 통해 확인 가능<br/>
![AdapterChecked](https://github.com/user-attachments/assets/c0c4e33f-d535-45fb-8115-115e57c70522)<br/>
<br/>

#### C. Pod Install
```ruby
pod install --repo-update
```
- 다음의 명령어를 실행해서 Library를 Xcode Project로 추가    
- Xcode Project에 포함시키기 위해서 Xcode 재실행
<br/><br/><br/>

### 2. SPM(Swift Package Manager)
- [SPM 가이드](./swift_package_manager.md) 참고
<br/><br/><br/>

### 3. Manual Installation
- [xcframework 직접 추가 가이드](./Installation_manual.md) 참고
<br/><br/><br/><br/>

## Setup Xcode
### 1. info.plist 수정
#### A. AdiscopeMediaId, AdiscopeMediaSecret 추가 (필수)
```xml
<key>AdiscopeMediaId</key>
<string></string>
<key>AdiscopeMediaSecret</key>
<string></string>
```
<br/>

#### B. App Tracking Permission 추가 (필수)
```xml
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
- ex : Some ad content may require access to the user tracking.
<br/>

#### C. SKAdNetwork 추가 (필수)
- Xcode 12.0 이상이면 SKAdNetwork Download File 내용 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeSkAdNetworks.plist))
```xml
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
<br/>

#### D. Admob, Max의 Admob 사용 시 추가
- "GADIsAdManagerApp" 설정 및 GADApplicationIdentifier의 Key 설정
```xml
<key>GADIsAdManagerApp</key>
<true/>
<key>GADApplicationIdentifier</key>
<string></string>
```
<br/><br/><br/>

### 2. AppDelegate 추가
#### A. Max의 InMobi 사용 시 추가
- window 추가
```swift
var window: UIWindow?
```    
<br/><br/><br/>

### 3. Privacy Manifest 정책 적용
- 2024년 5월 1일부터 출시/업데이트 되는 앱에 대해 3rd Party Framework의 개인정보 추가
- [참고](https://developer.apple.com/videos/play/wwdc2023/10060)    
<br/><br/><br/><br/>

# Adiscope Overview
## 1. Import (필수)
```swift
import Adiscope
```    
<br/><br/><br/>

## 2. Initialize (필수)
### A. Code에서 Media 없이 Initialize 방법
```swift
let CALLBACK_TAG = "";    // 관리자를 통해 발급, 기본 ""
if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
    adiscopeSDK.setMainDelegate(self)
    adiscopeSDK.initialize(CALLBACK_TAG)
}
```
- Build된 Project에서 `Info.plist` 파일에서 `AdiscopeMediaId`가 있어야 함 ([Info.plist 확인](./#adiscopemediaid-adiscopemediasecret-추가))
- CALLBACK_TAG이 없을 시, `adiscopeSDK.initialize()`로 가능
- App 실행 시 1회 설정 권장
<br/>

### B. Code에서 직접 Media 넣어서 Initialize 방법
```swift
let MEDIA_ID = "";        // 관리자를 통해 발급
let MEDIA_SECRET = "";    // 관리자를 통해 발급
let CALLBACK_TAG = "";    // 관리자를 통해 발급, 기본 ""
if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
    adiscopeSDK.setMainDelegate(self)
    adiscopeSDK.initialize(MEDIA_ID, mediaSecret: MEDIA_SECRET, callBackTag: CALLBACK_TAG)
}
```
- CALLBACK_TAG이 없을 시, `adiscopeSDK.initialize(MEDIA_ID, mediaSecret: MEDIA_SECRET)`로 가능
- App 실행 시 1회 설정 권장
<br/>

### C. Callbacks
```swift
func onInitialized(_ isSuccess: Bool) {
    if (isSuccess) {
        // Initialize Call Back
    } else {
        // Initialize Fail
    }
}
```    
<br/><br/><br/>

## 3. 사용자 정보 설정 (필수)
- `Offerwall`, `RewardedVideo`, `RewardedInterstitial`를 사용하기 위해 ${\color{red}필수}$ 설정
```swift
let USER_ID = "";        // set unique user id to identify the user in reward information
AdiscopeInterface.sharedInstance().SetUserId(USER_ID);
```
- 64자까지 설정 가능    
<br/><br/><br/>

## 4. Offerwall
### A. Show
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
    AdiscopeInterface.sharedInstance().showOfferwall(OFFERWALL_UNIT_ID)
} else {
    // Initialize 재시도
}
```
- `Show`가 실행되면 (return값이 True일 경우) `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출되고, `onOfferwallAdOpened`가 호출되었다면 이후 `onOfferwallAdClosed`가 항상 호출
<br/>

### B. Callbacks
```swift
func onOfferwallAdOpened(_ unitID: String!) {
    // Offerwall이 열림
}
func onOfferwallAdClosed(_ unitID: String!) {
    // Offerwall이 닫힘
}
func onOfferwallAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    // Offerwall이 Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Show 성공 시 `onOfferwallAdOpened`, `onOfferwallAdClosed` callback이 순차적으로 호출
- `onOfferwallAdFailed`시 [AdiscopeError 참고](./api_documentation.md#model)
<br/>

### C. Offerwall 특정 아이템 상세 페이지 이동
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
let OFFERWALL_ITEM_ID = "";      // 관리자를 통해 확인
let OFFERWALL_URL = "";          // 관리자를 통해 확인
AdiscopeInterface.sharedInstance().showOfferwallDetail(OFFERWALL_UNIT_ID, OFFERWALL_ITEM_ID)
AdiscopeInterface.sharedInstance().showOfferwallDetail(OFFERWALL_URL)
```
- [기타 옵션](./api_documentation.md#offerwall)
<br/>
<br/><br/><br/>

## 5. RewardedVideo
### A. Load
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = "";      // 관리자를 통해 발급
    AdiscopeInterface.sharedInstance().load(UNIT_ID)
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 Load 호출
- Load 후 사용자 정보 설정을 호출할 경우 isLoaded Flag가 False로 반환(Load 취소)
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onRewardedVideoAdLoaded` callback이 호출되면 Load가 완료
- Load가 실행되면 `onRewardedVideoAdLoaded` 와 `onRewardedVideoAdFailedToLoad` 중 하나의 callback은 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- Load & Show 후 다시 Load를 하려 할 때 Load 는 Show 이후 언제든 호출가능
  - 광고가 Show되는 동안 다음 광고를 Load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Show의 callback 인 `onRewardedVideoAdClosed`에서 다시 Load를 하는 것을 권장 
  - Abusing 방지를 위해 Rewarded Video Ad를 연속으로 보여주는 것을 제한하여 한번 광고를 보고 나면 일정 시간이 지난 후에 다시 Show를 할 수 있도로록 Admin page에서 서비스 설정 가능
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

### B. IsLoaded
```swift
let UNIT_ID = "";      // Load한 값(관리자를 통해 발급)
if (AdiscopeInterface.sharedInstance().isLoaded(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

### C. Show
```swift
let UNIT_ID = "";      // Load한 값(관리자를 통해 발급)
if (AdiscopeInterface.sharedInstance().isLoaded(UNIT_ID)) {
    AdiscopeInterface.sharedInstance().show()
} else {
    // do something else
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onRewardedVideoAdOpened`와 `onRewardedVideoAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedVideoAdOpened`가 호출되었다면 이후 `onRewardedVideoAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비
<br/>

### D. Callback Reward
```swift
func onRewarded(_ unitID: String!, item: AdiscopeRewardItem!) {
    // unitID - 해당 rewardedvideo의 UNIT_ID (Show 시 입력한 값)
    // item.amount - 보상의 양
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `onRewarded`는 보통 `onRewardedVideoAdOpened` 와 `onRewardedVideoAdClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `onRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `onRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `onRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `onRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

### E. Callback Others
```swift
func onRewardedVideoAdLoaded(_ unitID: String!) {
    // RewardedVideo Load Success
}
func onRewardedVideoAdFailed(toLoad unitID: String!, error: AdiscopeError!) {
    // RewardedVideo Load Fail
}
func onRewardedVideoAdOpened(_ unitID: String!) {
    // RewardedVideo 열림
}
func onRewardedVideoAdClosed(_ unitID: String!) {
    // RewardedVideo 닫힘
}
func onRewardedVideoAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    // RewardedVideo Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Load 성공 시 `onRewardedVideoAdLoaded`, 실패 시 `onRewardedVideoAdFailedToLoad`가 호출
- Show 성공 시 `onRewardedVideoAdOpened`, `onRewardedVideoAdClosed`가 순차적으로 호출되고, 실패 시 `onRewardedVideoAdFailedToShow`가 호출    
- `onRewardedVideoAdFailedToLoad`, `onRewardedVideoAdFailedToShow`시 [AdiscopeError 참고](./api_documentation.md#model)
<br/><br/><br/>

## 6. Interstitial
### A. Load
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = "";      // 관리자를 통해 발급
    AdiscopeInterface.sharedInstance().loadInterstitial(UNIT_ID)
} else {
    // Initialize 재시도
}
```
- Initialize 진행 완료 후 Load 호출
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onInterstitialAdLoaded` callback이 호출되면 Load가 완료
- Interstitial의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- 광고가 Show되는 동안 다음 광고를 Load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

### B. IsLoaded
```swift
let UNIT_ID = "";      // Load한 값(관리자를 통해 발급)
if (AdiscopeInterface.sharedInstance().isLoadedInterstitialUnitID(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

### C. Show
```swift
let UNIT_ID = "";      // Load한 값(관리자를 통해 발급)
if (AdiscopeInterface.sharedInstance().isLoadedInterstitialUnitID(UNIT_ID)) {
    AdiscopeInterface.sharedInstance().showInterstitial()
} else {
    // do something else
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onInterstitialAdLoaded`와 `onInterstitialAdFailedToLoad` 중 하나가 항상 호출되고, `onInterstitialAdOpened`가 호출되었다면 이후 `onInterstitialAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비
<br/>

### D. Callback
```swift
func onInterstitialAdLoaded(_ unitID: String!) {
    // Interstitial Load Success
}
func onInterstitialAdFailed(toLoad unitID: String!, error: AdiscopeError!) {
    // Interstitial Load Fail
}
func onInterstitialAdOpened(_ unitID: String!) {
    // Interstitial 열림
}
func onInterstitialAdClosed(_ unitID: String!) {
    // Interstitial 닫힘
}
func onInterstitialAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    // Interstitial Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Load 성공 시 `onInterstitialAdLoaded`, 실패 시 `onInterstitialAdFailedToLoad`가 호출
- Show 성공 시 `onInterstitialAdOpened`, `onInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onInterstitialAdFailedToShow`가 호출    
- `onInterstitialAdFailedToLoad`, `onInterstitialAdFailedToShow`시 [AdiscopeError 참고](./api_documentation.md#model)
<br/><br/><br/>

## 7. RewardedInterstitial
### A. PreLoadAll
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    AdiscopeInterface.sharedInstance().preLoadAllRewardedInterstitial()
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 관리자가 설정된 활성화된 모든 유닛들을 Load 진행
<br/>

### B. Unit 지정 PreLoad
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    let UNIT_ID1 = "";      // 관리자를 통해 발급
    let UNIT_ID2 = "";      // 관리자를 통해 발급
    AdiscopeInterface.sharedInstance().preLoadRewardedInterstitial([UNIT_ID1, UNIT_ID2, ... ])
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 입력된 유닛들을 Load 진행
<br/>

### C. Show
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().showRewardedInterstitial(UNIT_ID)
```
- 해당 유닛이 Load되어 있으면 안내 팝업을 보여 준 뒤 해당 광고를 사용자에게 보여줌
- ShowRewardedInterstitial method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onRewardedInterstitialAdSkip`와 `onRewardedInterstitialAdOpened`와 `onRewardedInterstitialAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedInterstitialAdOpened`가 호출되었다면 이후 `onRewardedInterstitialAdClosed`가 항상 호출
- `onRewardedInterstitialAdClosed`와 `onRewardedInterstitialAdFailedToShow`가 호출 되면 내부에서 해당 유닛을 자동 Load 시킴
<br/>

### D. Unit Status Info
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().getRewardedInterstitialUnitStatus(UNIT_ID);
```
- `onRewardedInterstitialResponsedUnitStatus`에서 해당 유닛의 수익화 여부, 활성화 여부를 알 수 있음
<br/>

### E. Callback Reward
```swift
func onRewardedInterstitialRewarded(_ unitID: String!, item: AdiscopeRewardItem!) {
    // unitID - 해당 RewardedInterstitial의 UNIT_ID (Show 시 입력한 값)
    // item.amount - 보상의 양
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- 보상이 주어져야 할 경우 `OnRewarded`가 호출되며 그 parameter로 관련 정보가 전달
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `OnRewarded`는 보통 `OnOpened` 와 `OnClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `OnRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `OnRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `OnRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `OnRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

### F. Callback Others
```swift
func onRewardedInterstitialResponsedUnitStatus(_ status: AdiscopeUnitStatus!) {
    // status.active - 활성화 여부
    // status.live - 수익화 여부
}
func onRewardedInterstitialAdSkip(_ unitID: String!) {
    // RewardedInterstitial Skip for 안내 팝업
}
func onRewardedInterstitialAdOpened(_ unitID: String!) {
    // RewardedInterstitial 열림
}
func onRewardedInterstitialAdClosed(_ unitID: String!) {
    // RewardedInterstitial 닫힘
}
func onRewardedInterstitialAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    // RewardedInterstitial Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Show 성공 후 Skip 시 `onRewardedInterstitialAdSkip`가 호출
- Show 성공 후 영상 시청 시 `onRewardedInterstitialAdOpened`, `onRewardedInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onRewardedInterstitialAdFailedToShow`가 호출
- `onRewardedInterstitialAdFailedToShow`시 [AdiscopeError 참고](./api_documentation.md#model)
<br/><br/><br/>

## 8. AdEvent
### A. Show
```swift
if (AdiscopeInterface.sharedInstance().isInitialized()) {
    let ADEVENT_UNIT_ID = "";	// 관리자를 통해 발급
    AdiscopeInterface.sharedInstance().showAdEvent(ADEVENT_UNIT_ID)
} else {
    // Initialize 재시도
}
```
- `Show`가 실행되면 (return값이 True일 경우) `onAdEventOpened`와 `onAdEventFailedToShow` 중 하나가 항상 호출되고, `onAdEventOpened`가 호출되었다면 이후 `onAdEventClosed`가 항상 호출
<br/>

### B. Callbacks
```swift
func onAdEventOpened(_ unitID: String!) {
    // AdEvent가 열림
}
func onAdEventClosed(_ unitID: String!) {
    // AdEvent가 닫힘
}
func onAdEventFailed(toShow unitID: String!, error: AdiscopeError!) {
    // AdEvent가 Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Show 성공 시 `onAdEventOpened`, `onAdEventClosed` callback이 순차적으로 호출
- `onAdEventFailed`시 [AdiscopeError 참고](./api_documentation.md#model)
<br/><br/><br/>

# Adiscope Error Information
- [Error 정보](./api_documentation.md#model)
<br/><br/>

# [Adiscope Server 연동하기](./reward_callback_info.md)
<br/><br/>

# [iOS 16+ Offerwall 세로 모드 전환 적용 방법(가로모드 전용일 경우)](./apple_orientations.md)
<br/><br/>

# Adiscope Old Release Note
- [Version 정보](./old_release_note.md)
