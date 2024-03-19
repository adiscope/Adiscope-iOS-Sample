# Adiscope for iOS Integration

## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 14.1 +

## Installation
### Manual
Framework를 Project내에 옮깁니다. Adiscope.framework는 필수이며, 반드시 하단에서 설명할 Xcode Project에 추가할 파일은 옮긴 프로젝트 내에있는 Framework파일들을 선택합니다.

**Adiscope SDK for iOS Structure**

| Framework               | Essential | Third-party Frameworks                                       |
| ----------------------- | --------- | ------------------------------------------------------------ |
| Adiscope                | YES       |                                                              |
| AdiscopeMediaAdMob      | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework<br/>FBLPromises.framework, GoogleAppMeasurement.framework<br/>nanopb.framework, GoogleUtilities.framework   |
| AdiscopeMediaAdManager  | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework<br/>FBLPromises.framework, GoogleAppMeasurement.framework<br/>nanopb.framework, GoogleUtilities.framework   |
| AdiscopeMediaAppLovin   | NO        | AppLovinSDK.framework                                        |
| AdiscopeMediaChartBoost | NO        | ChartboostSDK.framework                                      |
| AdiscopeMediaFAN        | NO        | FBAudiencenetwork.framework                                  |
| AdiscopeMediaIronsource | NO        | IronSource.framework                                         |
| AdiscopeMediaMax        | NO        | AppLovinSDK.framework, InMobiSDK.framework<br/>FBAudiencenetwork.framework, VungleAdsSDK.framework<br/>GoogleMobileAds.framework, UserMessagingPlatform.framework<br/>FBLPromises.framework, GoogleAppMeasurement.framework<br/>nanopb.framework, GoogleUtilities.framework<br/>BURelyAdSDK.framework, BURelyFoundation_Global.framework<br/>PAGAdSDK.framework, PAGAdSDK.bundle<br/>MTGSDK.framework, MTGSDKReward.framework<br/>MTGSDKBanner.framework, MTGSDKBidding.framework<br/>MTGSDKInterstitialVideo.framework, MTGSDKSplash.framework<br/>MTGSDKNewInterstitial.framework   |
| AdiscopeMediaMobVista   | NO        | MTGSDK.framework, MTGSDKReward.framework                     |
| AdiscopeMediaPangle     | NO        | BURelyAdSDK.framework, BURelyFoundation_Global.framework<br/>PAGAdSDK.framework, PAGAdSDK.bundle  |
| AdiscopeMediaUnityAds   | NO        | UnityAds.framework                                           |
| AdiscopeMediaVungle     | NO        | VungleAdsSDK.framework                                       |



1. (**Swift**)Bridge 추가
   * 새로운 헤더 파일 생성 (My-Awesome-Project-Bridging-Header.h)
   * Xcode Project / Build Settings Tab 접근
   * Objective-C Bridging Header에 생성한 헤더를 입력
   * Header에 다음을 추가 
2. Adiscope.framework 추가
   * Xcode Project / General Tab 접근
   * Frameworks, Libraries, and Embedded Content 에 Adiscope.framework를 추가
3. (**Optional**)RewardedVideo, Interstitial을 사용하기 위한 Framework들을 추가
   * Xcode Project / Build Phase Tab 접근
   * Link Binary With Libraries에 사용할 Framework들을 추가 
     * *Vungle을 사용한다고 가정시에 이하 Framework를 Link Binary With Libraries에 추가한다.*
       * *AdiscopeMediaVungle.framework*
       * *VungleSDK.framework*
