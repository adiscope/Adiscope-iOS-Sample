# Old Release Note
<br/>

> ## Version 2.1.5.0
> _2022-12-16_
> * Offerwall 멀티 유닛 적용
> * adcolony adapter 삭제

<br/>

> ## Version 2.1.4.1
> _2022-10-21_
> * iOS 16 화면 회전 이슈 수정

<br/>

> ## Version 2.1.3.1
> _2022-10-21_
> * iOS 16 화면 회전 이슈 수정

<br/>

> ## Version 2.1.4.0
> _2022-10-05_
> * Offerwall CPCA ui 수정
> * Rewarded Video
>   * bidding 관련 로직 이슈 수정
>   * 탭조이 init 이슈 수정

<br/>

> ## Version 2.1.3.0
> _2022-07-29_
> * Offerwall 신규 상품 추가 (CPCA)
> * Rewarded Video
>   * 안전성 개선
>   * 일부 이벤트 중복 호출 수정

<br/>

> ## Version 2.1.2.0
> _2022-06-24_
> * setUserID의 제한이 32자에서 64자로 늘어남
> * UnityAds의 인터스티셜 영상 재생 추가
> * Offerwall이 IDFA가 없어도 접근 할 수 있도록 변경
> * Network 버전 업데이트
>   * Tapjoy 12.7.1 -> 12.10.0
>   * UnityAds 3.7.5 -> 4.2.1
>   * Chartboost 8.3.1 -> 8.5.0

<br/>

> ## Version 2.1.1.0
> _2022-04-29_
> * SKAdNetwork 업데이트

<br/>

> ## Version 2.1.0.0
> _2022-04-01_
> * 문의하기 광고타입에 따라 필수값 변화
> * 오퍼월 표시방식 개선
> * 신규 네트워크 추가 Ironsource(7.2.0)
> * 신규 Interstitial 네트워크 추가 Vungle(6.10.3)

<br/>

> ## Version 2.0.9.1
> _2022-03-24_
> * 오퍼월 참여로직 개선
> * Interstitial 일부 로드 문제 개선

<br/>

> ## Version 2.0.9.0
> _2022-03-08_
> * 오퍼월 참여로직 개선

<br/>

> ## Version 2.0.8.0
> _2021-11-15_
> * RV 및 Offerwall 기능 개선
> * Adiscope Error에 XB3TraceID 추가

<br/>

> ## Version 2.0.7.0
> _2021-12-31_
> * Core및 Adapter 안전성 업데이트
> * 네트워크 업데이트
>   * unityAds 3.5.0 → 3.7.5

<br/>

> ## Version 2.0.6.0
> _2021-10-22_
> * Update Third-Party Framework
>   * Admob, Admanger 8.11.0
>   * FAN 6.7.0
>   * Mobvista 7.0.3.0
>   * Vungle 6.10.3

<br/>

> ## Version 2.0.5.0
> _2021-10-01_
> * Update Facebook Third-Party Framework 6.5.0 -> 6.5.1 (Core >= 11.0)

<br/>

> ## Version 2.0.4
> _2021-09-01_
> * Apply the Timeout: Interstitial Instances (10s)
> * New Section in Contact Us: "Order Identifier"

<br/>

> ## Version 2.0.3
> _2021-07-26_
> * New Interstitial Network: AdManager
> * Update Network Version
>   * admob 7.65.0 → 8.7.0
> * Show Offerwall에서 원하는 탭(CPS)을 필터하는 기능 추가
> * Admin에서 Offerwall Tab의 순서를 변경시 앱에 적용

<br/>

> ## Version 2.0.2
> _2021-06-24_
> * 로드 방식 변경 (최우선의 수익구조)
> * Network 버전 업데이트
>   * adcolony 4.3.1.0 → 4.6.1.0
>   * fan 6.2.1 → 6.5.0
> * Interface 변경
>   * initialize요청에 대한 결과의 delegate 추가
>   * rewardedVideo의 delegate에서 요청에 대한 unitID를 내려주도록 변경
>   * loadAll 삭제

<br/>

> ## Version 1.6.6
> _2021-03-17_
> * Fan Biding Kit 기능 변경
> * 일부 RV에 물량이 있음에도 물량없음에 대한 이슈
> * 오퍼월 최상단 고정 이슈

<br/>

> ## Version 1.6.4
> _2021-01-21_
> * SKAdnetwork.plist 파일 추가
> * 시스템 안정화
> * 네트워크 추가: Tapjoy (12.7.1)
> * 네트워크 업데이트: FAN (6.2.1)
> * iPhone 12 Model 일부 UI 버그 수정
> * Campaign 항목의 금액이 보다 상세히 표시

<br/>

> ## Version 1.6.1
> _2020-11-24_
> * FAN iOS 14 대응 버전 업데이트
>   * FAN 5.9.0 -> 6.2.0

<br/>

> ## Version 1.6.0
> _2020-11-16_
> * 멀티인스턴스 적용 및 적용에 따른 구조 변경

<br/>

> ## Version 1.5.9
> _2020-10-22_
> * iOS14 대응을 위해 네트워크 사의 sdk version update
>   * adcolony:  4.1.2.0 -> 4.3.1.0
>   * admob:  7.55.1 -> 7.65.0
>     * Third-Party프레임워크 추가 (PromisesObjC.framework, UserMessagingPlatform.framework)
> * ATT Popup으로 Offerwall에 진입시에 유저에게 동의를 구하도록 변경
>   * ATT Popup을 위해서 info.plist에 "Privacy - Tracking Usage Description"를 추가해 주세요.

<br/>

> ## Version 1.5.5
> _2020-09-22_
> * iOS 14 대응
>   * Offerwall 접근 불가 수정

<br/>

> ## Version 1.5.1
> _2020-08-12_
> * 오퍼월 기능 개선

<br/>

> ## Version 1.5.0
> _2020-08-06_
> * 오퍼월 기능 개선

<br/>

> ## Version 1.4.0.200623
> _2020-06-23_
> * Interstitial Ad를 시청 가능
> * Offerwall에서 하단의 합계가 보상받을 수 있는 총 합계로 변경
>   * 설치 실행형과 참여형의 총 합계
> * Offerwall의 Reward 금액이 클 경우에 Round-Down
>   * 천만 단위까지는 유지. (ex: 2300만 5200골드)
>   * 천만 단위 이상으로는 가장 큰 단위만 표시 (ex: 23억, 2조)
> * 문의하기 기능 개선
>   * 참여중인 광고탭에서 문의하기 버튼 생성
>   * 도움말 / 궁금해요 탭에서 문의하기탭의 편의성 개선

<br/>

> ## Version 1.2.3.200602
> _2020-06-02_
> * Admob network sdk-신규 API 사용

<br/>

> ## Version 1.2.2.200515
> _2020-05-15_
> * Vungle network sdk 업데이트 : 6.4.6 -> 6.5.3
> * Adiscope Vungle Adapter부분의 Log를 개선하였습니다.
> * Vungle의 캐싱기능이 업데이트 되었습니다. (Cache Optimization 2.0)

<br/>

> ## Version 1.2.0.20200218
> _2020-02-18_
> * GoogleMobileAds.framework, GoogleAppMeasurement.framework, GoogleUtilities.framework, nanopb.framework 교체 (Admob - 7.55.1)

<br/>

> ## Version 1.1.9.20200206
> _2020-02-06_
> * VungleSDK.framework (6.4.6), UnityAds.framework (3.4.2)

<br/>

> ## Version 1.1.8.20200131
> _2020-01-31_
> * AdiscopeMediaFAN.framework(1.0.7), FBAudienceNetwork.framework (5.6.1)

<br/>

> ## Version 1.1.7.20200129
> _2020-01-29_
> * Youappi SDK (YouAppiMoat.framework), AdiscopeMediaYouAppi.framework 제거
> * Applovin SDK 교체 (AppLovinSDK.framework, 6.11.1)
> * Guide 수정 - Youappi SDK 셋팅 관련 제거

<br/>

> ## Version 1.1.6.20191212
> _2019-12-12_
> * 통합오퍼월 네트워크 광고 재참여 기능 추가

<br/>

> ## Version 1.1.5.20191119
> _2019-11-19_
> * Adcolony SDK 교체 (AdColony.framework)
> * Chartboost SDK 교체 (Chartboost.framework)
> * Adcolony SDK 추가시 iOS Framework에 SafariServices.framework 추가 필요
> * Chartboost SDK 추가시 CHAMoatMobileAppKit.framework 제거 필요

<br/>

> ## Version 1.1.4.20191104
> _2019-11-04_
> * 3rd party (Vungle) 연동 처리 개선
> * RV Show Fail Log 정보 수정 및 기타 기능 개선
> * FAN SDK 교체 (FBSDKCoreKit.framework)

<br/>

> ## Version 1.1.3.20191017
> _2019-10-17_
> * 서버 Data 기준으로 오퍼월의 selected tab 설정
> * isLoaded API 수정 (Adiscope SDK for Android 와 동일한 로직으로 수정)
> * UnityAdis.framework 교체 (3.2.0 -> 3.3.0)

<br/>

> ## Version 1.1.2.20191008
> _2019-10-08_
> * 3rd party Library들의 설정 수정 (iOS framework 추가 및 삭제, 3rd party Framework 추가)
> * Info.plist 설정 수정 (Admob 인 경우)
> * iOS 13 관련 대응 (dark mode ui, full screen)
> * Applovin, Mobvista, UnityAds, Vungle, Admob, FAN 의 framework 교체 및 관련 수정

<br/>

> ## Version 1.1.1.20190813
> _2019-08-13_
> * API Reference.iOS > AdiscopeError 의 Error Code 추가 (8. NOT_EXIST_IDFA)
> * 오퍼월 광고추적제한 시 팝업 노출, 오퍼월 진입불가 (Error Code 전달 - 8. NOT_EXIST_IDFA)

<br/>

> ## Version 1.0.9.20190709
> _2019-07-09_
> * ATS 회피 Key 제거 (support ATS)
> * Top Most Section 추가
> * Orientation 처리 개선 및 UI 수정
> * YouAppi Framework 교체 (4.3.4 -> 4.4.0) 및 관련 수정
> * RV Load Timeout 처리 수정

<br/>

> ## Version 1.0.8.20190415
> _2019-04-15_
> * 통합오퍼월 Sponsopship Type (SP_CPS) 추가 및 관련 처리
> * 통합오퍼월 리포트 작업
> * Mobvista Library 교체 (4.7.0 -> 5.2.2) - caching 처리 logic 개선
> * RV Log 처리 추가 및 기타 기능 개선

<br/>

> ## Version 1.0.7.20190220
> _2019-02-20_
> * 3rd party Rewarded Video Framework 추가 (YouAppi, ChartBoost)
> * Offerwall 처리 개선 - 설치확인 기능의 예외 처리 추가

<br/>

> ## Version 1.0.6.20190118
> _2019-01-18_
> * Offerwall 처리 개선 - 물량없음 관련 예외 처리 추가 및 기타 기능 개선
> * RV 처리 개선 - RV show 처리 성능 개선
> * Xcode 10.1 Build (All Frameworks)

<br/>

> ## Version 1.0.5.20181129
> _2018-11-29_
> * Adiscope Admin에 설정된 네트워크 우선순위대로 광고 show 처리 (1.0.4 오류 수정)

<br/>

> ## Version 1.0.4.20181121
> _2018-11-21_
> * RV media auto caching 제거(UnityAds 제외) 및 기타 기능 개선

<br/>

> ## Version 1.0.3.20181106
> _2018-11-06_
> * 3rd party Rewarded Video Framework 추가 (FAN)
> * 3rd party Rewarded Video Framework 교체 (Adcolony - 3.3.6, UnityAds - 3.0.0, Mobvista - 4.7.0)

<br/>

> ## Version 1.0.2.20181011
> _2018-10-11_
> * 3rd party Rewarded Video Framework 추가 (AppLovin, MobVista)

<br/>

> ## Version 1.0.0.180814
> _2018-08-14_
> * Rewarded Video API 수정으로 인한 3rd-party Framework Load 처리 개선
