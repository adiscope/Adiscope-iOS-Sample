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
  
  
  
### URL Scheme 방식

* #### URL Scheme 을 선언 하여 앱이 해당 url 에 대해서 응답 받을수 있도록 하는 부분
<img width="812" alt="image" src="https://user-images.githubusercontent.com/60415962/230042908-96e13047-8cf4-4050-99dc-5717b5882887.png">

* 위 이미지를 참고 하여 애디스콥 담당자에게 전달 받은 media_id 값을 조합한 형태로 URL_Scheme 을 기입 하여 준다.

    * #### 들어온 Url 을 받아서 처리를 해주는 부분
        * Swift
      ```
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
        * objective-c
      ```
      // NSObject<UIApplicationDelegate> 를 재구현한 클래스에서 아래 함수를 오버라이딩 하여 아래 처럼 처리 해준다.
  
      - (BOOL)application:(UIApplication*)app openURL:(NSURL*)url options:(NSDictionary<NSString*, id>*)options {
          [[AdiscopeInterface sharedInstance] showOfferwallDetail:[url absoluteString]];
          return YES;
      }
       ```

### Universal-Link 방식

<img width="639" alt="image" src="https://user-images.githubusercontent.com/60415962/230047315-6d32692a-8569-4698-89b3-2633aae08892.png">

* +capability를 눌러서 Associated Domains 를 추가 해준다

<img width="762" alt="image" src="https://user-images.githubusercontent.com/60415962/230047552-23fd3537-80c6-4a87-9c7f-eaad09b147d4.png">

* 위 이미지 같은 화면이 추가가 되면 Domains 에 애디스콥 담당자와 사전에 협의한 도메인 규칙으로 applinks url 을 설정 해준다.

    * #### 들어온 Url 을 받아서 처리를 해주는 부분
        * Swift

          ```
              @main
              class AppDelegate: UIResponder, UIApplicationDelegate {
                func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
                    // Universal Link 방식 진입점
                    let url = userActivity.webpageURL;
                    let urlStr = url?.absoluteString ?? ""
                    AdiscopeInterface.sharedInstance().showOfferwallDetail(urlStr)
                    return true;
                }
              }
          ```

            * objective-c
          ```
            // NSObject<UIApplicationDelegate> 를 재구현한 클래스에서 아래 함수를 오버라이딩 하여 아래 처럼 처리 해준다.
      
            - (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity
                restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
            {
                NSURL* url = userActivity.webpageURL;
                if (url)
                    UnitySetAbsoluteURL(url.absoluteString.UTF8String);
                [[AdiscopeInterface sharedInstance] showOfferwallDetail:[url absoluteString]];
                return YES;
            }
          ```
<br>

    * 💡 매체측에서 운영 중인 도메인에 등록하여 사용할 경우에는 사전에 협의가 필요하며, </br> 이때 애디스콥 SDK의 코드 수정이 필요하므로 해당 방법은 권장하지 않음

</br>

* 전달 주신 json 파일을 애디스콥에서 도메인에 등록하고 매체에 노티를 드린 시점부터 Universal-Link 사용이 가능해집니다.

* 이 Universal-Link는 딥링크와 동일하게 내부 코드에서도 활용할 수 있으며, 딥링크 목차의 예시 코드와 동일하게 적용할 수 있습니다.
  </br></br>

## 기능별 장단점 요약
|  | showDetail() | Url-Scheme                                                                                                                                                                                     | Universal-Link                                                                                                                                                                                                                                |
| --- | --- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 사용 용도 | 앱 내에서 특정 오퍼월 아이템의 상세 화면으로 이동하고자 할 때 사용 | 앱 내부/외부에서 특정 오퍼월 아이템의 상세 화면으로 이동하고자 할 때 사용                                                                                                                                                     | 실제 운영 중인 https 도메인의 링크로 앱의 상세 화면에 연결할 수 있으며, 앱 내부/외부에서 특정 오퍼월 아이템 상세 화면으로 이동할 수 있음                                                                                                                                                            |
| 장점 | Url-Scheme , Universal-Link와는 다르게 소통 비용이 들지 않음. sdk 버전을 2.1.7.0 이상으로 업데이트만 한다면, 기존의 sdk 함수를 사용하던 방식처럼 오퍼월 상세 페이지 이동 기능을 적용할 수 있음 | 앱의 외부(모바일 웹, 앱)에서 오퍼월 상세 화면으로 바로 이동할 수 있고, 내부 코드에서도 규약된 url를 사용하여 오퍼월 상세 화면로 이동할 수 있음 </br> (다만, 현재로서는 앱이 실행 중인 상태에서만 Url-Scheme 가 작동되며, 앱이 구동되지 않은 상태에서 Url-Scheme 가 작동되고자 한다면 앱 구동 시점에 애디스콥 이니셜라이징이 완료되어야 함) | Url-Scheme 처럼 매체의 내부 코드로 해당 url를 활용하여 오퍼월 상세 화면으로 이동시킬 수 있음. 또한 매체 앱의 외부(모바일 웹, 앱)에서 링크를 클릭했을 때 오퍼월 상세 화면으로 바로 이동할 수 있도록 하여 확장성 증대를 기대할 수 있음 </br> (다만, 현재로서는 앱이 실행 중인 상태에서만 Universal-Link가 작동되며, 앱이 구동되지 않은 상태에서 Universal-Link가 작동되고자 한다면 앱 구동 시점에 애디스콥 이니셜라이징이 완료되어야 함) |
| 단점 | 고정된 광고 아이템의 상세 화면으로만 이동이 가능하므로 확장성이 없음 | 각 앱별로 고유 Url-Scheme 를 점유할 수 없으므로, 같은 uri 스킴을 사용할 시에는 충돌이 일어나 앱을 선택하는 창이 뜰 수 있음 </br> (애디스콥측에서 규정한 스킴은 각 매체마다 고유하도록 설계하였으나, 제3의 앱이 해당 Url-Scheme 를 사용할 경우 충돌이 일어날 수 있음)                                         | https 사이트 내에 앱을 연결할 수 있도록 하는 association file을 매체에서 제공해야 함. 해당 방법으로 상세페이지 이동 기능을 적용할 시 다른 방법보다 앱 내에서 특정 화면으로 이동하고자 할 때 사용소통 비용이 커짐                                                                                                            |
| 참고 사항 | - | 애디스콥측의 오퍼월 화면에 intent-filter를 적용하였으므로 매체에서 별도로 작업할 사항은 없음                                                                                                                                      | 매체는 애디스콥측에 json 파일을 제공하고, 애디스콥측의 도메인에 해당 json 파일을 등록함 </br> (매체측에서 운영 중인 도메인에 등록하여 사용할 경우에는 사전에 협의가 필요하고, 애디스콥 SDK측 코드 수정이 필요하므로 권장하지 않음)                                                                                                     |
