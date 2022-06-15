# iOS에서 Adiscope 설정하기
## 준비하기 
* Adiscope의 Admin페이지에서 `Media ID`와 `Secret Key`를 생성합니다. (외부 사용자는 담당자를 통해서 할당 받습니다.)
* Rewarded Video나 Offerwall을 사용하기 위해서는 `지면`에 해당하는 `Unit ID`가 필요합니다. Adiscope의 Admin페이지에서 생성하여 준비합니다. (외부 사용자는 담당자를 통해서 할당 받습니다.)
* Adiscope.framework를 연동합니다. [(연동하기)](https://github.com/...)
<br><br>

## Initialize
* Adiscope의 서비스를 이용하기 위해서는 초기화 과정이 필요합니다. iOS는 다음과 같이 초기화를 진행 할 수 있습니다.
```swift
if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
    adiscopeSDK.setMainDelegate(self)
    adiscopeSDK.setUserId("MyUserID")
    adiscopeSDK.initialize(mediaID, mediaSecret: secretKey, callBackTag: "")
}
```

* Callback Tag는 각 Server-Side에서 오는 Callback을 구분 할 수 있도록 하는 Tag입니다. 사용하지 않는다면 빈값으로 설정합니다.
* 이후 `initialize`의 성공관련 응답은 `setMainDelegate`를 통한 Delegate로 확인 할 수 있습니다.
```swift
- (void)onInitialized:(BOOL)isSuccess 
```
<br><br>

## Rewarded Video
* <span style='color: #fff5b1'><주의> 먼저 Initialize와 Set UserID를 진행을 완료해야 합니다.</span>
* <span style='color: #fff5b1'><주의> Adiscope.framework외에 사용할 Network를 연동해야 합니다. [(연동하기)](https://abcdefg.com)</span>
* 다음의 코드로 광고를 요청 할 수 있습니다. 
```swift
adiscopeSDK.load(rewardedVideoUnitID)
```

* 성공적인 Load에 대한 응답을 받았다면 Show요청으로 광고를 송출합니다. 
```swift
adiscopeSDK.show()
```

<br><br>
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
* <span style='color: #fff5b1'><주의> onRewarded의 콜백은 실제 지급에 대한 요청이 아닙니다. Adiscope는 Server-Side Callback을 지원하고 있습니다.</span>
<br><br>
