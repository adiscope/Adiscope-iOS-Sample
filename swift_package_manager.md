# Adiscope for [Swift Package Manager(SPM)](https://www.swift.org/documentation/package-manager/) Integration

## Requirements
### Build Settings 수정
- TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가<br/>

![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
<br/><br/><br/>

## Installation
1. Xcode에서 File > Add Package Dependencies로 이동
2. 아래 Adiscope Swift Package Manager GitHub 주소를 입력
3. Adisscope 모두 설치 (5.2.0부터)
```html
https://github.com/adiscope/Adiscope-SwiftPackageManager.git
```
<br/>

4. 사용할 패키지 버전 선택 후 설치 (3번 설치 했으면 무시)
<details>
<summary>Adiscope Versions</summary>
<div markdown="1">  

| SDK                                 | 5.2.0 | 5.0.3 | 5.0.2 | 5.0.1 | 5.0.0 |
|-------------------------------------|-------|-------|-------|-------|-------|
| Adiscope                            | 5.2.0 | 5.0.3 | 5.0.2 | 5.0.1 | 5.0.0 |
| AdiscopeCore                        | 5.2.0 |       |       |       |       |
| AdiscopeLuckyEvent                  | 5.2.0 | 5.0.3 |       |       |       |
| AdiscopeMediaAdManager              | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.0 | 5.0.0 |
| AdiscopeMediaAdMob                  | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.0 | 5.0.0 |
| AdiscopeMediaChartBoost             | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.0 | 5.0.0 |
| AdiscopeMediaPangle                 | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.0 | 5.0.0 |
| AdiscopeMediaTnkPub                 | 5.2.0 |       |       |       |       |
| AdiscopeMediaVungle                 | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMax                    | 5.2.0 | 5.0.2 | 5.0.2 | 5.0.1 | 5.0.0 |
| AdiscopeMediaMaxAdapterAdManager    | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterAdMob        | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterAmazon       | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterBidMachine   | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterBigo         | 5.2.0 |       |       |       |       |
| AdiscopeMediaMaxAdapterChartBoost   | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterDTExchange   | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterFan          | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterInMobi       | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterIronSource   | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterLine         | 5.2.0 |       |       |       |       |
| AdiscopeMediaMaxAdapterMobVista     | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterMoloco       | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterOgury        | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterPangle       | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterPubMatic     | 5.2.0 |       |       |       |       |
| AdiscopeMediaMaxAdapterUnityAds     | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |
| AdiscopeMediaMaxAdapterVungle       | 5.2.0 | 5.0.2 | 5.0.0 | 5.0.0 | 5.0.0 |

</div>
</details>

#### 필수
```html
https://github.com/adiscope/AdiscopeCore-SwiftPackageManager.git
```

#### 선택
```html
https://github.com/adiscope/AdiscopeLuckyEvent-SwiftPackageManager.git
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
https://github.com/adiscope/AdiscopeMediaTnkPub-SwiftPackageManager.git
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
https://github.com/adiscope/AdiscopeMediaMaxAdapterBigo-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterChartBoost-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterDTExchange-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterFan-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterInMobi-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterIronSource-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterLine-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterMobVista-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterMoloco-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterOgury-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterPangle-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterPubMatic-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterUnityAds-SwiftPackageManager.git
```
```html
https://github.com/adiscope/AdiscopeMediaMaxAdapterVungle-SwiftPackageManager.git
```
