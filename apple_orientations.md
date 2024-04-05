# iOS 16+ Offerwall 세로 모드 전환 적용 방법
- 적용하는 App이 `Portrait`를 사용하지 않을 경우 필수로 적용   
<br/>

## 코드 적용
- AppDelegate 에서 추가
```cpp
#import <Adiscope/Adiscope.h>
```
```cpp    
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {

    //***** Adiscope Start *****//
    if (AdiscopeInterface.sharedInstance.isOfferwallViewPortrait) {
        return UIInterfaceOrientationPortrait;
    }
    //****** Adiscope End ******//

    return UIInterfaceOrientationMaskAll;
}
```
<br/>

## Offerwall 세로 모드 전환 이유
- 사용성으로 세로 모드로 고정해 지원
<br/>

## iOS 16+에서 직접 코드 수정 필요 이유
- [application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window] 함수에 추가 없으면   
  requestGeometryUpdate(_:errorHandler:) 에서 오류 발생   
  `Error Domain=UISceneErrorDomain Code=101 "None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight" UserInfo={NSLocalizedDescription=None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight}"`   
<br/>

## 참고 자료
- [iOS 16+에서 requestGeometryUpdate 추가](https://developer.apple.com/documentation/uikit/uiwindowscene/3975944-requestgeometryupdate/)
