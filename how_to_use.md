# iOS에서 Adiscope 설정하기
## 준비하기
* Adiscope의 Admin페이지에서 `Media ID`와 `Secret Key`를 생성합니다. (외부 사용자는 담당자를 통해서 할당 받습니다.)
* Rewarded Video나 Offerwall을 사용하기 위해서는 `지면`에 해당하는 `Unit ID`가 필요합니다. Adiscope의 Admin페이지에서 생성하여 준비합니다. (외부 사용자는 담당자를 통해서 할당 받습니다.)
* Adiscope.framework를 연동합니다. [(연동하기)](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/Installation_manual.md#installation)
  <br><br>

## Initialize
* Adiscope의 서비스를 이용하기 위해서는 초기화 과정이 필요합니다. iOS는 다음과 같이 초기화를 진행 할 수 있습니다.
* <span style='color: #fff5b1'><주의> setUserId는 64자까지 설정 할 수 있습니다.</span>
```swift
if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
    adiscopeSDK.setMainDelegate(self)
    adiscopeSDK.setUserId("MyUserID")
    adiscopeSDK.initialize(mediaID, mediaSecret: secretKey, callBackTag: "")
}
```

* Callback Tag는 각 Server-Side에서 오는 Callback을 구분 할 수 있도록 하는 **Tag**입니다. 사용하지 않는다면 빈값으로 설정합니다.
* 이후 `initialize`의 성공관련 응답은 `setMainDelegate`를 통한 Delegate로 확인 할 수 있습니다.
```swift
- (void)onInitialized:(BOOL)isSuccess 
```
<br><br>

## Rewarded Video
* <span style='color: #fff5b1'><주의> 먼저 Initialize와 Set UserID를 진행을 완료해야 합니다.</span>
* <span style='color: #fff5b1'><주의> Adiscope.framework외에 사용할 Network를 연동해야 합니다. [(연동하기)](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/Installation_manual.md#installation)</span>

### 광고 요청 및 재생
* 다음의 코드로 광고를 요청 할 수 있습니다.
* <span style='color: #fff5b1'><주의> Load이후 setUserID를 호출할 경우 isLoaded Flag가 False로 반환됩니다. </span>
```swift
adiscopeSDK.load(rewardedVideoUnitID)
```

* 성공적인 Load에 대한 응답을 받았다면 Show요청으로 광고를 송출합니다.
```swift
adiscopeSDK.show()
```

<br>

### Rewarded Video Callbacks
* Rewarded Video에 해당하는 응답입니다. `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있습니다.
```swift
// Load Callbacks
- (void)onRewardedVideoAdLoaded:(NSString *)unitID
- (void)onRewardedVideoAdFailedToLoad:(NSString *)unitID Error:(AdiscopeError *)error

// Show Callbacks
- (void)onRewardedVideoAdOpened:(NSString *)unitID
- (void)onRewardedVideoAdClosed:(NSString *)unitID
- (void)onRewardedVideoAdFailedToShow:(NSString *)unitID Error:(AdiscopeError *)error
// Rewarded Callback

- (void)onRewarded:(NSString *)unitID Item:(AdiscopeRewardItem *)item
```
* <span style='color: #fff5b1'><주의> onRewarded의 응답은 실제 지급에 대한 요청이 아닙니다. Adiscope는 Server-Side Callback을 지원하고 있습니다.</span>
  <br><br>

## Offerwall
* <span style='color: #fff5b1'><주의> 먼저 Initialize와 Set UserID를 진행을 완료해야 합니다.</span>

### Offerwall 보여주기
* 다음의 코드로 Offerwall 전면을 보여 줄 수 있습니다.
```swift
adiscopeSDK.showOfferwall(offerwallUnitID)
```
### Offerwall 특정 아이템 보여주기

```
* 다음의 코드로 Offerwall 특정 아이템 페이지를  보여 줄 수 있습니다.
adiscopeSDK.showOfferwallDetail(offerwallUnitID, offerwallItemId)
adiscopeSDK.showOfferwallDetail(url)
```

* Offerwall을 보여 줄 때, 다른 옵션을 사용하고자 한다면 [다음](https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/api_documentation.md#offerwall)을 참조 해 주세요.

<br>

### Offerwall Callbacks
* Offerwall을 표시 할 때, 관련 응답은 다음과 같습니다.
```swift
- (void)onOfferwallAdOpened:(NSString *)unitID;
- (void)onOfferwallAdClosed:(NSString *)unitID;
- (void)onOfferwallAdFailedToShow:(NSString *)unitID Error:(AdiscopeError *)error;
```

## Offerwall 상세화면 바로 가기
[참고 link]
* <span style='color: #fff5b1'>https://developer.apple.com/ios/universal-links/</span>
* <span style='color: #fff5b1'>https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app</span>

### 함수 호출 방식
* 아래 링크 참조 하시면 됩니다.
  * #### https://github.com/adiscope/Adiscope-iOS-Sample/blob/main/api_documentation.md#offerwall
  
