# Adiscope for [Swift Package Manager(SPM)](https://www.swift.org/documentation/package-manager/) Integration

## Requirements
### Build Settings 수정
- TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가<br/>

![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
<br/>

### Meta, Ogury 추가 연동
- Meta, Ogury는 Swift Package Manager(SPM)을 지원하지 않기 때문에 [CocoaPods](../README.md) 또는 [수동설치](./Installation_manual.md) 방식으로 추가
#### 1. CocoaPods
##### A. AppLovin MAX 사용 시 Podfile
```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AdiscopeMediaMaxAdapterFan', '4.2.0'
    pod 'AdiscopeMediaMaxAdapterOgury', '4.2.0'
end
```
<br/>

##### B. AdmobDF 사용 시 Podfile
```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AdiscopeMediaAdMob', '4.2.0'
end
```
- 위 설정 시, SPM에서 'https://github.com/adiscope/AdiscopeMediaAdMob-SwiftPackageManager.git' 주소는 제외 처리해야 함
<br/>

#### 2. 수동설치
##### A. Max 사용 시
- 다음 xcframework 파일을 프로젝트에 수동으로 추가
  - AdiscopeMediaMaxAdapterFan.xcframework
  - FBAudienceNetwork.xcframework
  - AdiscopeMediaMaxAdapterOgury.xcframework
  - OguryAds.xcframework
  - OguryCore.xcframework
  - OgurySdk.xcframework
  - OMSDK_Ogury.xcframework
- `OMSDK_Ogury.xcframework`는 Embed & Sign 으로 변경
<br/>

##### B. AdmobDF 사용 시
- 다음 xcframework 파일을 프로젝트에 수동으로 추가
  - MetaAdapter.xcframework
  - FBAudiencenetwork.xcframework
<br/><br/><br/>

## Installation
1. Xcode에서 File > Add Package Dependencies로 이동
2. 아래 Adiscope Swift Package Manager GitHub 주소를 입력
3. 사용할 패키지 버전 선택 후 설치
```html
https://github.com/adiscope/Adiscope-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeAdEvent-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaAdManager-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaAdMob-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaChartBoost-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaPangle-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaVungle-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMax-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterAdManager-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterAdMob-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterAmazon-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterBidMachine-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterChartBoost-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterDTExchange-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterInMobi-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterIronSource-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterMobVista-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterMoloco-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterPangle-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterUnityAds-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterVungle-SwiftPackageManager.git
```
