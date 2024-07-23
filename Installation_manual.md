# Adiscope for iOS Integration

## SDK Download
- [최신 SDK 다운로드](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeIosSdk-3.8.0.zip)
  - Releases에 이전 버전 다운로드 가능 ([이동](../../releases))

## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 15.1 +

## Installation
### Manual
Framework를 Project내에 옮깁니다. Adiscope.framework는 필수이며, 반드시 하단에서 설명할 Xcode Project에 추가할 파일은 옮긴 프로젝트 내에있는 Framework파일들을 선택합니다.

**Adiscope SDK for iOS Structure**

| Framework               | Essential | Third-party Frameworks                                       |
| ----------------------- | --------- | ------------------------------------------------------------ |
| Adiscope                | YES       |                                                              |
| AdiscopeMediaAdMob      | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework   |
| AdiscopeMediaAdManager  | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework   |
| AdiscopeMediaAppLovin   | NO        | AppLovinSDK.framework                                        |
| AdiscopeMediaChartBoost | NO        | ChartboostSDK.framework                                      |
| AdiscopeMediaFAN        | NO        | FBAudiencenetwork.framework                                  |
| AdiscopeMediaMax        | NO        | AppLovinSDK.framework, InMobiSDK.framework<br/>FBAudiencenetwork.framework, VungleAdsSDK.framework<br/>GoogleMobileAds.framework, UserMessagingPlatform.framework<br/>BURelyAdSDK.framework, BURelyFoundation_Global.framework<br/>PAGAdSDK.framework, PAGAdSDK.bundle<br/>MTGSDK.framework, MTGSDKReward.framework<br/>MTGSDKBanner.framework, MTGSDKBidding.framework<br/>MTGSDKInterstitialVideo.framework, MTGSDKSplash.framework<br/>MTGSDKNewInterstitial.framework, BidMachine.framework<br/>DTBiOSSDK.framework, IASDKCore.framework<br/>MolocoSDK.framework, OguryAds.framework<br/>OguryChoiceManager.framework, OguryCore.framework<br/>OgurySdk.framework, OMSDK_Appodeal.framework<br/>OMSDK_Ogury.framework, StackModules.framework<br/>StackProductPresentation.framework, StackRendering.framework   |
| AdiscopeMediaMobVista   | NO        | MTGSDK.framework, MTGSDKReward.framework                     |
| AdiscopeMediaPangle     | NO        | BURelyAdSDK.framework, BURelyFoundation_Global.framework<br/>PAGAdSDK.framework, PAGAdSDK.bundle  |
| AdiscopeMediaUnityAds   | NO        | UnityAds.framework                                           |
| AdiscopeMediaVungle     | NO        | VungleAdsSDK.framework                                       |



1. (**Swift**) Bridge 추가
   - 새로운 헤더 파일 생성 (ProjectName-Bridging-Header.h)
   - Xcode Project / Build Settings Tab 접근
   - Objective-C Bridging Header에 생성한 헤더를 입력
   - Header에 다음을 추가
```object-c
#import <Adiscope/Adiscope.h>
```
2. Adiscope.framework 추가
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 Adiscope.framework 를 추가 후 Embed & Sign 으로 변경
3. Build Settings 수정<br/>
![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
   - TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가
3. (**Optional**) RewardedVideo, Interstitial을 사용하기 위한 Framework들을 추가
   - Xcode Project / Build Phase Tab 접근
   - Link Binary With Libraries에 사용할 Framework들을 추가 
     - *Vungle을 사용한다고 가정시에 이하 Framework를 Link Binary With Libraries에 추가한다.*
       - *AdiscopeMediaVungle.framework*
       - *VungleSDK.framework*
4. (**Optional**) Max 사용시 Embed & Sign 설정
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 Adiscope.framework, AppLovinSDK.framework, DTBiOSSDK.framework, MolocoSDK.framework, OMSDK_Appodeal.framework, OMSDK_Ogury.framework 를 추가 후 Embed & Sign 으로 변경
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 libbz2.tbd, libc++.tbd, libc++abi.tbd, libiconv.tbd, libresolv.9.tbd, libsqlite3.tbd, libxml2.tbd, libz.tbd 추가
