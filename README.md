# Adiscope for iOS Integration
[![GitHub package.json version](https://img.shields.io/badge/Unity-3.3.1-blue)](https://github.com/adiscope/Adiscope-Unity-UPM)
[![GitHub package.json version](https://img.shields.io/badge/Android-3.3.1-blue)](https://github.com/adiscope/Adiscope-Android-Sample)
[![GitHub package.json version](https://img.shields.io/badge/iOS-3.3.1-blue)](../../releases)

- iOS 12.0 + / iPadOS 13.0 + / Xcode 11.0 +
<br/>

## Contents
#### [Installation](#installation-1)
- [1. CocoaPods](#1-cocoapods)
- [2. Manual Installation](#2-manual-installation)
#### [Setup Xcode](#setup-xcode-1)
- [1. info.plist 수정](#1-infoplist-수정)
- [2. AppDelegate 추가](2-appdelegate-추가)
#### [MAX Ad Review](#max-ad-review-1)
#### [Adiscope Overview](#adiscope-overview-1)
- [1. Import](#1-import)
- [2. Initialize](#2-initialize)
- [3. 사용자 정보 설정](#3-사용자-정보-설정)
- [4. Offerwall](#4-offerwall)
- [5. RewardedVideo](#5-rewardedvideo)
- [6. Interstitial](#6-interstitial)
- [7. RewardedInterstitial](#7-rewardedinterstitial)
#### [Adiscope Error Information](./blob/main/api_documentation.md#model)
#### [Adiscope Server 연동하기](https://github.com/adiscope/Adiscope-Android-Sample/blob/2.1.2.0/docs/reward_callback_info.md)
<br/><br/><br/>

## Installation
### 1. CocoaPods
- CocoaPods는 Cocoa Projects의 Dependency를 관리할 수 있음

#### A. CocoaPods Install
```csharp
$ gem install cocoapods
```
- 명령어를 사용하여 설치 진행
<br/><br/>

#### B. Podfile
```csharp
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Adiscope', '3.3.1'
    pod 'AdiscopeMediaAdManager', '3.3.0'
    pod 'AdiscopeMediaAdMob', '3.3.0'
    pod 'AdiscopeMediaAppLovin', '3.3.0'
    pod 'AdiscopeMediaChartBoost', '3.3.0'
    pod 'AdiscopeMediaFAN', '3.3.0'
    pod 'AdiscopeMediaIronsource', '3.3.0'
    pod 'AdiscopeMediaMax', '3.3.0'
    pod 'AdiscopeMediaMobVista', '3.3.0'
    pod 'AdiscopeMediaPangle', '3.3.0'
    pod 'AdiscopeMediaUnityAds', '3.3.0'
    pod 'AdiscopeMediaVungle', '3.3.0'
end
```
- CocoaPods의 Xcode Project내에 Podfile에서 기술
<br/><br/>

#### C. Pod Install
```csharp
$ pod install --repo-update
```
- 다음의 명령어를 실행해서 Library를 Xcode Project로 추가
<br/><br/><br/>

### 2. Manual Installation
- [Manual Installation Guide](./blob/main/Installation_manual.md)
<br/><br/><br/><br/>

## Setup Xcode
### 1. info.plist 수정
#### A. AdiscopeMediaId, AdiscopeMediaSecret 추가
```csharp
<key>AdiscopeMediaId</key>
<string></string>
<key>AdiscopeMediaSecret</key>
<string></string>
```
<br/>

#### B. App Tracking Permission 추가
```csharp
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
<br/>

#### C. SKAdNetwork 추가 ([Download](./releases/download/3.2.0/AdiscopeSkAdNetworks.plist))
```csharp
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
- Xcode 12.0 이상이거나 Max를 사용하면 SKAdNetwork Download File 내용 추가 ([Download](./releases/download/3.2.0/AdiscopeSkAdNetworks.plist))
<br/><br/>

#### D. Admob 사용 시 추가
```csharp
<key>GADIsAdManagerApp</key>
<true/>
<key>GADApplicationIdentifier</key>
<string></string>
```
- "GADIsAdManagerApp" 설정 및 GADApplicationIdentifier의 Key 설정
<br/><br/>

#### E. Max, AppLovin 사용 시 추가
```csharp
<key>AppLovinSdkKey</key>
<string></string>
```
- AppLovinSdkKey의 Key 설정
<br/><br/><br/>

### 2. AppDelegate 추가
#### A. Max 사용 시 추가
```csharp
var window: UIWindow?
```
- window 추가
<br/><br/><br/>

## MAX Ad Review
#### 1. 목적: MAX 노출 소재에 대한 지표 확인하여, 수익화 증대
#### 2. 내용: MAX 노출 소재에 대한 imp, 클릭수, eCPM 등의 지표 확인이 필요
#### 3. 기대효과: 소재 별 지표를 다른 네트워크에 공유하여, 더 높은 eCPM으로 해당 소재 광고를 받을 수 있게 하는 것이 기대효과, 아직 한번도 진행해 보지 않아서, 목표 기대효과는 측정하지 못함
#### 4. 개발방법
[AppLovinQualityServiceSetup-ios.rb 파일 다운로드](./releases/download/3.2.0/AppLovinQualityServiceSetup-ios.rb)
- 다운로드 받은 파일을 iOS 프로젝트의 xcodeproj 파일이 있는 곳에 옮김
- 터미널로 접속해서 다운받은 파일로 이동 후 아래 명령어 실행
```csharp
ruby AppLovinQualityServiceSetup-ios.rb
```
<br/><br/><br/>

# Adiscope Overview
## 1. Import
```swift
import Adiscope
```
<br/><br/>

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
<br/><br/>

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
<br/><br/>

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
<br/><br/>

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
- `Show`가 실행되면 `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출
- `onOfferwallAdOpened`가 호출되었다면 이후 `onOfferwallAdClosed`가 항상 호출
<br/><br/>

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
<br/>

### C. Offerwall 특정 아이템 상세 페이지 이동
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
let OFFERWALL_ITEM_ID = "";      // 관리자를 통해 확인
let OFFERWALL_URL = "";          // 관리자를 통해 확인
AdiscopeInterface.sharedInstance().showOfferwallDetail(OFFERWALL_UNIT_ID, OFFERWALL_ITEM_ID)
AdiscopeInterface.sharedInstance().showOfferwallDetail(OFFERWALL_URL)
```
- [기타 옵션](./blob/main/api_documentation.md#offerwall)
<br/><br/>

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
<br/><br/>

## 5. RewardedVideo
### A. Load
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().load(UNIT_ID)
```
- Initialize와 사용자 정보 설정의 진행 완료 후 Load 호출
- Load 후 사용자 정보 설정을 호출할 경우 isLoaded Flag가 False로 반환(Load 취소)
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- RewardedVideo의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- 광고가 Show되는 동안 다음 광고를 load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
<br/><br/>

### B. IsLoaded
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
if (AdiscopeInterface.sharedInstance().isLoaded(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 load 되었는지 상태를 확인
<br/><br/>

### C. Show
```swift
AdiscopeInterface.sharedInstance().show()
```
- 마지막으로 load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 load를 호출
- Show method는 중복하여 호출 할 수 없음
- `Show`가 실행되면 `onRewardedVideoAdOpened`와 `onRewardedVideoAdFailedToShow` 중 하나가 항상 호출
- `onRewardedVideoAdOpened`가 호출되었다면 이후 `onRewardedVideoAdClosed`가 항상 호출
- RewardedVideo의 `Load`와 `Show`는 pair로 호출
<br/><br/>

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
<br/><br/>

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
- `Load` 성공 시 `onRewardedVideoAdLoaded`, 실패 시 `onRewardedVideoAdFailed`가 호출
- `Show` 성공 시 `onRewardedVideoAdOpened`, `onRewardedVideoAdClosed`가 순차적으로 호출되고, 실패시 `onRewardedVideoAdFailed`가 호출
<br/><br/><br/>

## 6. Interstitial
### A. Load
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().loadInterstitial(UNIT_ID)
```
- Initialize 진행 완료 후 Load 호출
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- Interstitial의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- 광고가 Show되는 동안 다음 광고를 load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
<br/><br/>

### B. IsLoaded
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
if (AdiscopeInterface.sharedInstance().isLoadedInterstitialUnitID(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 load 되었는지 상태를 확인
<br/><br/>

### C. Show
```swift
AdiscopeInterface.sharedInstance().showInterstitial()
```
- 마지막으로 load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 load를 호출
- Show method는 중복하여 호출 할 수 없음
- `Show`가 실행되면 `onInterstitialAdOpened`와 `onInterstitialAdFailed` 중 하나가 항상 호출
- `onInterstitialAdOpened`가 호출되었다면 이후 `onInterstitialAdClosed`가 항상 호출
- Interstitial의 `Load`와 `Show`는 pair로 호출
<br/><br/>

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
- `Load` 성공 시 `onInterstitialAdLoaded`, 실패 시 `onInterstitialAdFailed`가 호출
- `Show` 성공 시 `onInterstitialAdOpened`, `onInterstitialAdClosed`가 순차적으로 호출되고, 실패시 `onInterstitialAdFailed`가 호출
<br/><br/><br/>

## 7. RewardedInterstitial
### A. PreLoadAll
```swift
AdiscopeInterface.sharedInstance().preLoadAllRewardedInterstitial()
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 관리자가 설정된 활성화된 모든 유닛들을 Load 진행
<br/><br/>

### B. Unit 지정 PreLoad
```swift
let UNIT_ID1 = "";      // 관리자를 통해 발급
let UNIT_ID2 = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().preLoadRewardedInterstitial([UNIT_ID1, UNIT_ID2, ... ])
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 입력된 유닛들을 Load 진행
<br/><br/>

### C. Show
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().showRewardedInterstitial(UNIT_ID)
```
- 해당 유닛이 Load되어 있으면 안내 팝업을 보여 준 뒤 해당 광고를 사용자에게 보여줌
- ShowRewardedInterstitial method는 중복하여 호출 할 수 없음
- `ShowRewardedInterstitial`가 실행되면 `onRewardedInterstitialAdSkip`와 `onRewardedInterstitialAdOpened`와 `onRewardedInterstitialAdFailed` 중 하나가 항상 호출
- `onRewardedInterstitialAdOpened`가 호출되었다면 이후 `onRewardedInterstitialAdClosed`가 항상 호출
- `onRewardedInterstitialAdClosed`와 `onRewardedInterstitialAdFailed`가 호출 되면 내부에서 해당 유닛을 자동 Load 시킴
<br/><br/>

### D. Unit Status Info
```swift
let UNIT_ID = "";      // 관리자를 통해 발급
AdiscopeInterface.sharedInstance().getRewardedInterstitialUnitStatus(UNIT_ID);
```
- `onRewardedInterstitialResponsedUnitStatus`에서 해당 유닛의 수익화 여부, 활성화 여부를 알 수 있음
<br/><br/>

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
<br/><br/>

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
- `ShowRewardedInterstitial` Skip 시 `onRewardedInterstitialAdSkip`, 성공 시 `onRewardedInterstitialAdOpened`, `onRewardedInterstitialAdClosed`가 순차적으로 호출되고, 실패시 `onRewardedInterstitialAdFailed`가 호출
<br/><br/><br/>

# Adiscope Error Information
- [Error 정보](./blob/main/api_documentation.md#model)
<br/><br/><br/>

# [Adiscope Server 연동하기](https://github.com/adiscope/Adiscope-Android-Sample/blob/2.1.2.0/docs/reward_callback_info.md)
