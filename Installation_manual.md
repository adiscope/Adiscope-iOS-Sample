# Adiscope for iOS Integration


## Requirements
iOS 12.0 + / iPadOS 13.0 +
Xcode 11.0 +



## Installation

### Manual

Framework를 Project내에 옮깁니다. Adiscope.framework는 필수이며, 반드시 하단에서 설명할 Xcode Project에 추가할 파일은 옮긴 프로젝트 내에있는 Framework파일들을 선택합니다.

**Adiscope SDK for iOS Structure**

| Framework               | Essential | Third-party Frameworks                                       |
| ----------------------- | --------- | ------------------------------------------------------------ |
| Adiscope                | YES       |                                                              |
| AdiscopeMediaAdColony   | NO        | AdColony.framework                                           |
| AdiscopeMediaAdMob      | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework   |
| AdiscopeMediaAdManager  | NO        | GoogleMobileAds.framework, UserMessagingPlatform.framework   |
| AdiscopeMediaAppLovin   | NO        | AppLovinSDK.framework                                        |
| AdiscopeMediaChartBoost | NO        | Chartboost.framework                                         |
| AdiscopeMediaFAN        | NO        | FBAudiencenetwork.framework, FBSDKCoreKit_Basics.framework   |
| AdiscopeMediaMobVista   | NO        | MTGSDK.framework, MTGSDKReward.framework                     |
| AdiscopeMediaTapjoy     | NO        | Tapjoy.embeddedframework                                     |
| AdiscopeMediaUnityAds   | NO        | UnityAds.framework                                           |
| AdiscopeMediaVungle     | NO        | VungleSDK.framework                                          |



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
4. (**Optional**)RewardedVideo, Interstitial을 사용하기 위한 Framework들을 추가 (.embeddedframework)
   * Project Root에 .embeddedframework 파일 복사
   * Xcode Project / Build Phase Tab 접근
   * Link Binary With Libraries에 ~.embeddedframework/~.framework 을 추가.
     * *Tapjoy을 사용한다고 가정시에 Tapjoy.embeddedframework 파일을 Xcode Project Root에 복사한다. (MyProject/Tapjoy.embeddedframework)*
     * *복사한 Tapjoy.embeddedframework의 폴더안의 Tapjoy.framework파일을 Link Binary With Libraries에 추가한다.*



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

### 배포를 위한 Simulator Arch 삭제
1. Xcode Project / Build Phase Tab 접근
2. ＋ 버튼을 눌러 New Run Script Phase 선택
3. 추가된 Run Script에 다음을 추가
> "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Adiscope.framework/strip-frameworks.sh"
