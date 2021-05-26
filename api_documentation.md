# Adiscope SDK Documentation for iOS

<br>

- [Interface](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#interface)
  - [Core](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#core)
    - sharedInstance
    - initialize:mediaId:mediaSecret:callBackTag
    - setMainDelegate:delegate
    - setUserId:userID
    - getUnitStatus:unitID
    - setUseOfferWallWarningPopup:useOfferWallWarningPopup
    - setUseCloudFrontProxy:useCloudFrontProxy
    - getSDKVersion
  - [Offerwall](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#offerwall)
    - showOfferWall:unitID
  - [RwardedVideo](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#rwardedvideo)
    - load:unitID
    - isLoaded:unitID
    - show
  - [Interstitial](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#interstitial)
    - loadInterstitial:unitID
    - isLoadedInterstitialUnitID:unitID
    - showInterstitial
- [Delegate](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#delegate)
  - [Core](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#core-1)
    - onInitializedCallback:isSuccess
    - onGetUnitStatus:unitStatus
  - [Offerwall](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#offerwall-1)
    - onOfferwallAdOpened:unitId
    - onOfferwallAdClosed:unitId
    - onOfferwallAdFailedToShow:unitId:error
  - [RewardedVideo](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#rewardedvideo)
    - onRewardedVideoAdLoaded:unitID
    - onRewardedVideoAdFailedToLoad:unitID:error
    - onRewardedVideoAdOpened:unitId
    - onRewardedVideoAdClosed:unitId
    - onRewarded:item
    - onRewardedVideoAdFailedToShow:unitId:error
  - [Interstitial](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#interstitial-1)
    - onInterstitialAdLoaded:unitID
    - onInterstitialAdFailedToLoad:unitID:error
    - onInterstitialAdOpened:unitId
    - onInterstitialAdClosed:unitId
    - onInterstitialAdFailedToShow:unitId:error
- [Model](https://github.com/adiscope/Adiscope-iOS-Sample/blob/2.0.0/api_documentation.md#model)
  - AdiscopeUnitStatus
  - AdiscopeError
  - AdiscopeRewardItem


<br><br>


### Interface
<br>

#### Core
##### + (instancetype)sharedInstance

Adiscope Interface의 singleton객체를 가져옵니다.

<br>

##### - (void)initialize:mediaId:mediaSecret:callBackTag

Adiscope SDK 초기화를 진행합니다.

| Parameters     |              |
| ----------- | ------------------------------------------------------------ |
| mediaId     | Amdin page에서 등록한 해당 application에 대한 ID             |
| mediaSecret | mediaId에 대응되는 Secret key                                |
| callBackTag | 보상 콜백을 복수 개로 등록해서 사용할시에 어떤 보상 콜백을 사용할지 지정. 지정하지 않을시에는 기본 보상콜백이 사용. |

<br>

##### - (void)setMainDelegate:delegate

AdiscopeDelegate callbacks을 위한 delegate 설정합니다.

| Parameters     |              |
| ----------- | ------------------------------------------------------------ |
| delegate | Delegate callbacks을 위한 delegate |

<br>

##### - (BOOL)setUserId:userID

Application 사용자의 Unique Id를 설정. 이 정보는 reward 지급 등에 있어 사용자를 구분하는데 사용합니다.

⚠️ UserID의 최대 길이는 32자 입니다.

| Parameters |                     |
| ---------- | ------------------- |
| userId     | 고유한 유저의 ID 값 |

| Return     |                                     |
| ---------- | ----------------------------------- |
| isSuccesss | UserID의 형식이 잘못 되었을 경우 NO |

<br>

##### - (void)getUnitStatus:unitID

유닛의 상태 정보를 구한다. AdiscopeDelegate의 onGetUnitStatus() callback을 통해 결과를 받습니다.
⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

| Parameters |                                                    |
| ---------- | -------------------------------------------------- |
| unitId     | 얻고자 하는 Offerwall 혹은 Rewarded Video의 UnitID |

<br>

##### - (void)setUseOfferWallWarningPopup:useOfferWallWarningPopup
Adiscope 의 Offerwall ViewController 를 Display 할 때, iOS 설정중 광고 차단 기능이 활성화 되었을 때, 안내 팝업 표시를 설정합니다.
Default 설정은 YES 입니다.

| Parameters |                           |
| ---------- | ------------------------- |
| useOfferWallWarningPopup     | Offerwall 경고 팝업 표시 유/무 |

<br>

##### - (void)setUseCloudFrontProxy:useCloudFrontProxy

AWS Cloud Front Proxy를 사용 유무를 설정합니다.

이 옵션을 사용하게되면, 북미, 유럽에서 게임을 서비스할시에 Adiscope API의 응답속도가 향상됩니다.

| Parameters         |                                 |
| :----------------- | ------------------------------- |
| useCloudFrontProxy | AWS Cloud Front Proxy 사용 유무 |

<br>

##### - (NSString \*)getSDKVersion

Adiscope SDK Version 을 확인합니다.

| Return     |                              |
| :--------- | ---------------------------- |
| NSString * | Adiscope.framework의 Version |

<br>

#### Offerwall

##### - (BOOL)showOfferWall:unitID

Adiscope 의 Offerwall ViewController 를 Display 합니다.

AdiscopeDelegate의 onOfferwallAdOpened(), onOfferwallAdClosed(), onOfferwallAdFailedToShow() callbacks을 통해 Offerwall ViewController 의 Open, Close, Fail 정보를 얻습니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

| Parameters |                           |
| ---------- | ------------------------- |
| unitId     | 보여질 Offerwall의 UnitID |

| Return     |                              |
| ---------- | ---------------------------- |
| isSuccesss | UnitID이 잘못 되었을 경우 NO |

<br>

#### RwardedVideo

##### - (void)load:unitID

Application 에서 사용할 수 있는 모든 Rewarded Video 관련 Framework 를 load 하며, unitId 에 해당하는 광고를 Pre-load 합니다.
AdiscopeDelegate의 onRewardedVideoAdLoaded(), onRewardedVideoAdFailedToLoad() callbacks을 통해 Rewarded Video 의 load 상태 정보를 얻습니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

| Parameters |                                |
| ---------- | ------------------------------ |
| unitId     | 로드 할 RewardedVideo의 UnitID |

<br>

##### - (BOOL)isLoaded:unitID

unitId 에 해당하는 광고가 load 되어 있는지 여부 확인 합니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

⚠️ `show` method 를 call 하기 전, `isLoaded:unitID` 를 통해 show 가능 여부를 확인합니다.

| Parameters |                                           |
| :--------- | ----------------------------------------- |
| unitId     | load 여부를 체크할 RewardedVideo의 UnitID |
| **Return** |                                           |
| BOOL       | show할 광고가 존재할 경우 YES             |

<br>

##### - (BOOL)show

Adiscope 에 설정된 순번으로 load 된 광고를 보여줍니다.

AdiscopeDelegate의 onRewardedVideoAdOpened(), onRewardedVideoAdClosed(), onRewarded(), onRewardedVideoAdFailedToShow() callbacks을 통해 Rewarded Video 의 show 상태 정보를 얻습니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

⚠️ `show` method 를 call 하기 전, `isLoaded:unitID` 를 통해 show 가능 여부를 확인합니다.

⚠️ Rewarded Video 의 정확한 보상정보 처리를 위해 `setUserId:userID` 를 미리 설정해야 합니다.

| Return |                                      |
| :----- | ------------------------------------ |
| BOOL   | 로드된 광고가 가용할 수 없을 경우 NO |

<br>

#### Interstitial

##### - (void)loadInterstitial:unitID

Application 에서 사용할 수 있는 모든 Interstitial 관련 Framework 를 load 하며, unitId 에 해당하는 광고를 Pre-load 합니다.
AdiscopeDelegate의 onInterstitialAdLoaded(), onInterstitialAdFailedToLoad() callbacks을 통해 Rewarded Video 의 load 상태 정보를 얻습니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

| Parameters |                               |
| ---------- | ----------------------------- |
| unitId     | 로드 할 Interstitial의 UnitID |

<br>

##### - (BOOL)isLoadedInterstitialUnitID:unitID

unitId 에 해당하는 광고가 load 되어 있는지 여부 확인 합니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

⚠️ `show` method 를 call 하기 전, `isLoadedInterstitialUnitID:unitID` 를 통해 show 가능 여부를 확인합니다.

| Parameters |                                          |
| :--------- | ---------------------------------------- |
| unitId     | load 여부를 체크할 Interstitial의 UnitID |
| **Return** |                                          |
| BOOL       | show할 광고가 존재할 경우 YES            |

<br>

##### - (void)showInterstitial

Adiscope 에 설정된 순번으로 load 된 광고를 보여줍니다.

AdiscopeDelegate의 onRewardedVideoAdOpened(), onRewardedVideoAdClosed(), onRewarded(), onRewardedVideoAdFailedToShow() callbacks을 통해 Rewarded Video 의 show 상태 정보를 얻습니다.

⚠️ `initialize:mediaId:mediaSecret:callBackTag` 가 먼저 호출되어야 합니다.

⚠️ `show` method 를 call 하기 전, `isLoadedInterstitialUnitID:unitID` 를 통해 show 가능 여부를 확인합니다.

| Return |                                      |
| :----- | ------------------------------------ |
| BOOL   | 로드된 광고가 가용할 수 없을 경우 NO |

<br>

<br>

### Delegate

⚠️ 하단의 callbacks을 수령하려면 미리 delegate 를 설정해야 합니다. `setMainDelegate:delegate` 를 사용합니다.

<br>

#### Core

##### onInitializedCallback:isSuccess

init을 진행한 후, 발생됩니다.

| Parameters |                        |
| :--------- | ---------------------- |
| isSuccess  | Initialize의 성공 결과 |

<br>

##### onGetUnitStatus:unitStatus

UnitID에 대한 정보를 가져 왔을때 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| error      | AdiscopeError 참조      |
| unitStatus | AdiscopeUnitStatus 참조 |

<br>

#### Offerwall

##### onOfferwallAdOpened:unitId

Offerwall이 open 되었을 때 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| unitId     | Open된 UnitID           |

<br>

##### onOfferwallAdClosed:unitId

Offerwall이 close 되었을 때 발생됩니다.

| Parameters |                |
| :--------- | -------------- |
| unitId     | Close된 UnitID |

<br>

##### onOfferwallAdFailedToShow:unitId:error

Offerwall이 open 되었을 때 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| unitID | Show를 요청한 UnitID |
| error      | AdiscopeError 참조      |

<br>

#### RewardedVideo

##### onRewardedVideoAdLoaded:unitID

Rewarded Video 가 Load 되었을 때 발생됩니다.

| Parameters |               |
| :--------- | ------------- |
| unitId     | Load된 UnitID |

<br>

##### onRewardedVideoAdFailedToLoad:unitID:error

다음과 같을때 발생됩니다.

1. Rewarded Video 의 unitID 가 유효하지 않는다.
2. unitID 에 해당하는 모든 3rd party 의 Video를 Load 하는데, 실패했다.

| Parameters |                      |
| :--------- | -------------------- |
| unitID     | 로드를 요청한 UnitID |
| error      | AdiscopeError 참조   |

<br>

##### onRewardedVideoAdOpened:unitId

Rewarded Video 를 재생한 ViewController 가 open 되었을 때 발생됩니다.

| Parameters |               |
| :--------- | ------------- |
| unitId     | Open된 UnitID |

<br>

##### onRewardedVideoAdClosed:unitId

Rewarded Video 를 재생한 ViewController 가 close 되었을 때 발생됩니다.

| Parameters |                |
| :--------- | -------------- |
| unitId     | Close된 UnitID |

<br>

##### onRewarded:item

Rewarded Video 의 보상을 받을 수 있을 때, 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| item       | AdiscopeRewardItem 참조 |

<br>

##### onRewardedVideoAdFailedToShow:unitId:error

Rewarded Video 를 재생할 수 없을 경우 발생됩니다.

| Parameters |                      |
| :--------- | -------------------- |
| unitID     | Show를 요청한 UnitID |
| error      | AdiscopeError 참조   |

<br>

#### Interstitial

##### onInterstitialAdLoaded:unitID

Interstitial 가 Load 되었을 때 발생됩니다.

| Parameters |               |
| :--------- | ------------- |
| unitId     | Load된 UnitID |

<br>

##### onInterstitialAdFailedToLoad:unitID:error

다음과 같을때 발생됩니다.

1. Interstitial 의 unitID 가 유효하지 않는다.
2. unitID 에 해당하는 모든 3rd party 의 Video를 Load 하는데, 실패했다.

| Parameters |                      |
| :--------- | -------------------- |
| unitID     | 로드를 요청한 UnitID |
| error      | AdiscopeError 참조   |

<br>

##### onInterstitialAdOpened:unitId

Interstitial 를 재생한 ViewController 가 open 되었을 때 발생됩니다.

| Parameters |               |
| :--------- | ------------- |
| unitId     | Open된 UnitID |

<br>

##### onInterstitialAdClosed:unitId

Interstitial 를 재생한 ViewController 가 close 되었을 때 발생됩니다.

| Parameters |                |
| :--------- | -------------- |
| unitId     | Close된 UnitID |

<br>

##### onInterstitialAdFailedToShow:unitId:error

Interstitial 를 재생할 수 없을 경우 발생됩니다.

| Parameters |                      |
| :--------- | -------------------- |
| unitID     | Show를 요청한 UnitID |
| error      | AdiscopeError 참조   |

<br>

#### Model

##### AdiscopeUnitStatus

| Variable | Description      |
| :------- | ---------------- |
| error   | AdiscopeErrorCode 참조 |
| isLive   | 유닛 수익화 상태 |
| isActive | 유닛 활성화 상태 |

<br>

##### AdiscopeError

| Variable    | Description                      |
| :---------- | -------------------------------- |
| code        | error's code (AdiscopeErrorCode) |
| description | error's description              |

| Error Code       | Cause |
| ---------------- | ----- |
| INTERNAL_ERROR   | Adiscope Sdk 내부 오류 혹은 Adiscope Server 오류 |
| MEDIATION_ERROR  | Mediation 광고 Network의 3rd party sdk 오류 |
| INITIALIZE_ERROR | Adiscope.Sdk.Initialize 시 mediaId/mediaSecret이 유효하지 않음 |
| SERVER_SETTING_ERROR | 광고를 보여주기 위해 필요한 내부 설정값 오류. AndroidManifest에 설정된 값이거나 Runtime 시 server로 부터 전달 받은 값이 정확하지 않음, Adiscope admin 설정의 수익화, 유닛 활성화가 OFF인 경우 |
| INVALID_REQUEST | Show시, 입력한 unitId 오류 |
| NETWORK_ERROR | Network read/write timed out 혹은 Network connection 오류 |
| NO_FILL | 하루에 볼 수 있는 Rewarded Video 광고의 횟수를 모두 소진 하였을 경우 |
| TIME_LIMIT | Rewarded Video 광고를 한번 보여주고 난 후 일정 시간 (30초~60초, Adiscope admin page에서 설정된 시간 간격)이 지나기 전에 다시 Show를 시도할 경우 |
| NOT_EXIST_IDFA | iOS 디바이스에서 추출된 IDFA 값이 없거나, UserTracking의 추적 중지일 경우 |
| GOOGLE_FAMILY_ERROR (Only Android) | - |
| INVALID_ADID (Only Android) | - |
| TIME_OUT | 세팅한 기간 내에 Mediation 광고 네트워크의 로드 성공 콜백이 오지 않은 경우 |
| SHOW_CALLED_BEFORE_LOAD | RewardedVideoAd.Show()를 Load() 없이 실행하였을 경우 |

<br>

##### AdiscopeRewardItem

| Variable | Description              |
| :------- | ------------------------ |
| unitId   | Rewarded Video 의 unitID |
| type     | 보상 단위                |
| amount   | 보상 수량                |

