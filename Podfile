# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Adiscope-iOS-Sample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  pod 'Adiscope', '1.6.4.1'
  # pod 'AdiscopeMediaAppLovin', '1.6.0.0'
  # pod 'AdiscopeMediaAdMob', '1.6.0.0'
  # pod 'AdiscopeMediaAdColony', '1.6.0.0'
  # pod 'AdiscopeMediaFAN', '1.6.1.0'
  # pod 'AdiscopeMediaMobVista', '1.6.4.0'
  pod 'AdiscopeMediaUnityAds', '1.6.0.0'
  # pod 'AdiscopeMediaVungle', '1.6.0.0'

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
