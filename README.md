# Adiscope for iOS Integration
[![GitHub package.json version](https://img.shields.io/badge/iOS-3.8.2-blue)](../../releases)
[![GitHub package.json version](https://img.shields.io/badge/Android-3.8.1-blue)](https://github.com/adiscope/Adiscope-Android-Sample)
[![GitHub package.json version](https://img.shields.io/badge/Unity-3.8.2-blue)](https://github.com/adiscope/Adiscope-Unity-UPM)
[![GitHub package.json version](https://img.shields.io/badge/Flutter-3.8.2-blue)](https://pub.dev/packages/adiscope_flutter_plugin)
[![GitHub package.json version](https://img.shields.io/badge/ReactNative-3.8.2-blue)](https://www.npmjs.com/package/@adiscope.ad/adiscope-react-native)

- iOS 12.0 + / iPadOS 13.0 + / Xcode 15.1 +
<br/>

## Contents
#### [Installation](#installation-1)
- [1. CocoaPods](#1-cocoapods)
- [2. Manual Installation](#2-manual-installation)
#### [Setup Xcode](#setup-xcode-1)
- [1. info.plist 수정](#1-infoplist-수정)
- [2. AppDelegate 추가](#2-appdelegate-추가)
- [3. Privacy Manifest 정책 적용](#3-privacy-manifest-정책-적용)
#### [Adiscope Overview](#adiscope-overview-1)
- [1. Import](#1-import)
- [2. Initialize](#2-initialize)
- [3. 사용자 정보 설정](#3-사용자-정보-설정)
- [4. Offerwall](#4-offerwall)
- [5. RewardedVideo](#5-rewardedvideo)
- [6. Interstitial](#6-interstitial)
- [7. RewardedInterstitial](#7-rewardedinterstitial)
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
```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '3.8.2'
    pod 'AdiscopeMediaAdManager', '3.8.1'
    pod 'AdiscopeMediaAdMob', '3.8.1'
    pod 'AdiscopeMediaAppLovin', '3.8.1'
    pod 'AdiscopeMediaChartBoost', '3.8.1'
    pod 'AdiscopeMediaFAN', '3.8.1'
    pod 'AdiscopeMediaMax', '3.8.2'
    pod 'AdiscopeMediaMobVista', '3.8.1'
    pod 'AdiscopeMediaPangle', '3.8.1'
    pod 'AdiscopeMediaUnityAds', '3.8.1'
    pod 'AdiscopeMediaVungle', '3.8.1'
end
```
- CocoaPods의 Xcode Project내에 Podfile에서 기술
<br/>

#### C. Pod Install
```ruby
pod install --repo-update
```
- 다음의 명령어를 실행해서 Library를 Xcode Project로 추가    
- Xcode Project에 포함시키기 위해서 Xcode 재실행
<br/><br/><br/>

### 2. Manual Installation
- [Manual Installation Guide](./Installation_manual.md)    
<br/><br/><br/><br/>

## Setup Xcode
### 1. info.plist 수정
#### A. AdiscopeMediaId, AdiscopeMediaSecret 추가
```xml
<key>AdiscopeMediaId</key>
<string></string>
<key>AdiscopeMediaSecret</key>
<string></string>
```
<br/>

#### B. App Tracking Permission 추가
```xml
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
<br/>

#### C. SKAdNetwork 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeSkAdNetworks.plist))
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
- Xcode 12.0 이상이거나 Max를 사용하면 SKAdNetwork Download File 내용 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeSkAdNetworks.plist))
<br/>

#### D. Admob 사용 시 추가
```xml
<key>GADIsAdManagerApp</key>
<true/>
<key>GADApplicationIdentifier</key>
<string></string>
```
- "GADIsAdManagerApp" 설정 및 GADApplicationIdentifier의 Key 설정
<br/>

#### E. Max, AppLovin 사용 시 추가
```xml
<key>AppLovinSdkKey</key>
<string></string>
```
- AppLovinSdkKey의 Key 설정    
<br/><br/><br/>

### 2. AppDelegate 추가
#### A. Max 사용 시 추가
```swift
var window: UIWindow?
```
- window 추가    
<br/><br/><br/>

### 3. Privacy Manifest 정책 적용
- 2024년 5월 1일부터 출시/업데이트 되는 앱에 대해 3rd Party Framework의 개인정보 추가
- [참고](https://developer.apple.com/videos/play/wwdc2023/10060)    
<br/><br/><br/><br/>

# Adiscope Overview
- 1, 2, 3 은 필수 처리
- 4, 5, 6, 7 은 선택 처리

## 1. Import
```swift
import Adiscope
```    
<br/><br/><br/>

## 2. Initialize
### A. Code에서 Media 없이 Initialize 방법
```swift
let CALLBACK_TAG = "";    // 관리자를 통해 발급, 기본 ""
if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
    adiscopeSDK.setMainDelegate(self)
    adiscopeSDK.initialize(CALLBACK_TAG)
}
```
- Build된 Project에서 `Info.plist` 파일에서 `AdiscopeMediaId`가 있어야 함 ([Info.plist 확인](./#adiscopemediaid-adiscopemediasecret-추가))
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

## 3. 사용자 정보 설정
```swift
let USER_ID = "";        // set unique user id to identify the user in reward information
AdiscopeInterface.sharedInstance().SetUserId(USER_ID);
```
- `Offerwall`, `RewardedVideo`, `RewardedInterstitial`를 사용하기 위해 ${\color{red}필수}$ 설정
- 64자까지 설정 가능    
<br/><br/><br/>

## 4. Offerwall
### A. Show
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().showOfferwall(OFFERWALL_UNIT_ID)
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

### D. Offerwall for URL Scheme 적용
#### 가. Scheme 등록
<img width="812" alt="image" src="https://user-images.githubusercontent.com/60415962/230042908-96e13047-8cf4-4050-99dc-5717b5882887.png">   
- 위 이미지를 참고 하여 애디스콥 담당자에게 전달 받은 URL_Scheme를 기입    
<br/><br/>

#### 나. URL Scheme 처리
```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // 스킴을 통한 일반 딥링크 방식 진입점
        let urlStr = url.absoluteString
        AdiscopeInterface.sharedInstance().showOfferwallDetail(urlStr)
        return true
    }
}
```
<br/>

#### 다. 기능별 장단점
|  | showDetail() | Url-Scheme                                                                                                                                                                                     |
| --- | --- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 사용 용도 | 앱 내에서 특정 오퍼월 아이템의 상세 화면으로 이동하고자 할 때 사용 | 앱 내부/외부에서 특정 오퍼월 아이템의 상세 화면으로 이동하고자 할 때 사용                                                                                                                                                     |
| 장점 | Url-Scheme , Universal-Link와는 다르게 소통 비용이 들지 않음. sdk 버전을 2.1.7.0 이상으로 업데이트만 한다면, 기존의 sdk 함수를 사용하던 방식처럼 오퍼월 상세 페이지 이동 기능을 적용할 수 있음 | 앱의 외부(모바일 웹, 앱)에서 오퍼월 상세 화면으로 바로 이동할 수 있고, 내부 코드에서도 규약된 url를 사용하여 오퍼월 상세 화면로 이동할 수 있음 </br> (다만, 현재로서는 앱이 실행 중인 상태에서만 Url-Scheme 가 작동되며, 앱이 구동되지 않은 상태에서 Url-Scheme 가 작동되고자 한다면 앱 구동 시점에 애디스콥 이니셜라이징이 완료되어야 함) |
| 단점 | 고정된 광고 아이템의 상세 화면으로만 이동이 가능하므로 확장성이 없음 | 각 앱별로 고유 Url-Scheme 를 점유할 수 없으므로, 같은 uri 스킴을 사용할 시에는 충돌이 일어나 앱을 선택하는 창이 뜰 수 있음 </br> (애디스콥측에서 규정한 스킴은 각 매체마다 고유하도록 설계하였으나, 제3의 앱이 해당 Url-Scheme 를 사용할 경우 충돌이 일어날 수 있음)                                         |
| 참고 사항 | - | 애디스콥측의 오퍼월 화면에 intent-filter를 적용하였으므로 매체에서 별도로 작업할 사항은 없음                                                                                                                                      |
<br/>
<br/><br/><br/>

## 5. RewardedVideo
### A. Load
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().load(UNIT_ID)
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
let UNIT_ID = "";      // 관리자를 통해 발급
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
AdiscopeInterface.sharedInstance().show()
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
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().loadInterstitial(UNIT_ID)
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
let UNIT_ID = "";      // 관리자를 통해 발급
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
AdiscopeInterface.sharedInstance().showInterstitial()
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
AdiscopeInterface.sharedInstance().preLoadAllRewardedInterstitial()
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 관리자가 설정된 활성화된 모든 유닛들을 Load 진행
<br/>

### B. Unit 지정 PreLoad
```swift
let UNIT_ID1 = "";      // 관리자를 통해 발급
let UNIT_ID2 = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().preLoadRewardedInterstitial([UNIT_ID1, UNIT_ID2, ... ])
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

# Adiscope Error Information
- [Error 정보](./api_documentation.md#model)
<br/><br/>

# [Adiscope Server 연동하기](./reward_callback_info.md)
<br/><br/>

# [iOS 16+ Offerwall 세로 모드 전환 적용 방법(가로모드 전용일 경우)](./apple_orientations.md)
<br/><br/>

# Adiscope Old Release Note
- [Version 정보](./old_release_note.md)
