# Adiscope for iOS Integration

## SDK Download
- [최신 SDK 다운로드](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.10.3/AdiscopeIosSdk-3.10.3.zip)
  - Releases에 이전 버전 다운로드 가능 ([이동](../../releases))

## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 15.1 +

## Installation
### Manual
Framework를 Project내에 옮깁니다. Adiscope.xcframework는 필수이며, 반드시 하단에서 설명할 Xcode Project에 추가할 파일은 옮긴 프로젝트 내에있는 Framework파일들을 선택합니다.

**Adiscope SDK for iOS Structure**

| Framework               | Essential | Third-party Frameworks                                       |
| ---------------------------------- | --------- | ------------------------------------------------------------ |
| Adiscope                           | YES       |                                                              |
| AdiscopeMediaAdMob                 | NO        | (**Essential**)<br/>GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework<br/>(**Optional**)<br/>LiftoffMonetizeAdapter.xcframework, MetaAdapter.xcframework<br/>MintegralAdapter.xcframework, PangleAdapter.xcframework<br/>VungleAdsSDK.xcframework, FBAudiencenetwork.xcframework<br/>MTGSDK.xcframework, MTGSDKBanner.xcframework<br/>MTGSDKBidding.xcframework, MTGSDKInterstitialVideo.xcframework<br/>MTGSDKNewInterstitial.xcframework, MTGSDKReward.xcframework<br/>MTGSDKSplash.xcframework, PAGAdSDK.xcframework<br/>BURelyFoundation_Global.xcframework, PAGAdSDK.bundle  |
| AdiscopeMediaAdManager             | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework  |
| AdiscopeMediaChartBoost            | NO        | ChartboostSDK.xcframework  |
| AdiscopeMediaPangle                | NO        | PAGAdSDK.xcframework, BURelyFoundation_Global.xcframework<br/>PAGAdSDK.bundle  |
| AdiscopeMediaVungle                | NO        | VungleAdsSDK.xcframework  |
| AdiscopeMediaMax                   | NO        | AppLovinSDK.xcframework  |
| AdiscopeMediaMaxAdapterAdMob       | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework  |
| AdiscopeMediaMaxAdapterAmazon      | NO        | DTBiOSSDK.xcframework  |
| AdiscopeMediaMaxAdapterBidMachine  | NO        | BidMachine.xcframework, StackModules.xcframework<br/>StackProductPresentation.xcframework, StackRendering.xcframework<br/>OMSDK_Appodeal.xcframework  |
| AdiscopeMediaMaxAdapterDTExchange  | NO        | IASDKCore.xcframework  |
| AdiscopeMediaMaxAdapterFan         | NO        | FBAudienceNetwork.xcframework  |
| AdiscopeMediaMaxAdapterInMobi      | NO        | InMobiSDK.xcframework  |
| AdiscopeMediaMaxAdapterMobVista    | NO        | MTGSDK.xcframework, MTGSDKBanner.xcframework<br/>MTGSDKBidding.xcframework,MTGSDKInterstitialVideo.xcframework<br/>MTGSDKNewInterstitial.xcframework, MTGSDKReward.xcframework<br/>MTGSDKSplash.xcframework  |
| AdiscopeMediaMaxAdapterMoloco      | NO        | MolocoSDK.xcframework  |
| AdiscopeMediaMaxAdapterOgury       | NO        | OguryAds.xcframework, OguryChoiceManager.xcframework<br/>OguryCore.xcframework, OgurySdk.xcframework<br/>OMSDK_Ogury.xcframework  |
| AdiscopeMediaMaxAdapterPangle      | NO        | PAGAdSDK.xcframework, BURelyFoundation_Global.xcframework<br/>PAGAdSDK.bundle  |
| AdiscopeMediaMaxAdapterUnityAds    | NO        | UnityAds.xcframework  |
| AdiscopeMediaMaxAdapterVungle      | NO        | VungleAdsSDK.xcframework  |



1. (**Swift**) Bridge 추가
   - 새로운 헤더 파일 생성 (ProjectName-Bridging-Header.h)
   - Xcode Project / Build Settings Tab 접근
   - Objective-C Bridging Header에 생성한 헤더를 입력
   - Header에 다음을 추가
```object-c
#import <Adiscope/Adiscope.h>
```
2. Adiscope.xcframework 추가
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 Adiscope.xcframework 를 추가 후 Embed & Sign 으로 변경
3. Build Settings 수정<br/>
![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
   - TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가
3. (**Optional**) RewardedVideo, Interstitial을 사용하기 위한 Framework들을 추가
   - Xcode Project / Build Phase Tab 접근
   - Link Binary With Libraries에 사용할 Framework들을 추가 
     - *Vungle을 사용한다고 가정시에 이하 Framework를 Link Binary With Libraries에 추가한다.*
       - *AdiscopeMediaVungle.xcframework*
       - *VungleSDK.xcframework*
4. (**Optional**) Max 사용시 Embed & Sign 설정
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 AppLovinSDK.xcframework, DTBiOSSDK.xcframework, InMobiSDK.xcframework, MolocoSDK.xcframework, OMSDK_Appodeal.xcframework, OMSDK_Ogury.xcframework 를 추가 후 Embed & Sign 으로 변경
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 libbz2.tbd, libc++.tbd, libc++abi.tbd, libiconv.tbd, libresolv.9.tbd, libsqlite3.tbd, libxml2.tbd, libz.tbd 추가
