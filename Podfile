# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Adiscope-iOS-Sample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  pod 'Adiscope', '2.0.6.0'
  # pod 'AdiscopeMediaAppLovin', '2.0.2.0'
  # pod 'AdiscopeMediaAdMob', '2.0.6.0'
  # pod 'AdiscopeMediaAdManager', '2.0.6.0'
  # pod 'AdiscopeMediaFAN', '2.0.6.0'
  # pod 'AdiscopeMediaMobVista', '2.0.6.0'
  # pod 'AdiscopeMediaUnityAds', '2.0.2.0'
  # pod 'AdiscopeMediaVungle', '2.0.6.0'
  # pod 'AdiscopeMediaChartBoost', '2.0.2.0'

end

post_install do |installer|
   installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
           config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
           config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
           config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
       end
   end
end
