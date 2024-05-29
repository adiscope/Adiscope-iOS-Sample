# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'Adiscope-iOS-Sample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Adiscope', '3.7.0'
  pod 'AdiscopeMediaAdManager', '3.6.0'
  pod 'AdiscopeMediaAdMob', '3.7.0'
  pod 'AdiscopeMediaAppLovin', '3.6.1'
  pod 'AdiscopeMediaChartBoost', '3.6.0'
  pod 'AdiscopeMediaFAN', '3.6.0'
  pod 'AdiscopeMediaMax', '3.6.1'
  pod 'AdiscopeMediaMobVista', '3.6.0'
  pod 'AdiscopeMediaPangle', '3.6.0'
  pod 'AdiscopeMediaUnityAds', '3.6.0'
  pod 'AdiscopeMediaVungle', '3.6.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
