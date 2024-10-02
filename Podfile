# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'




source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'

target 'Takhawi' do
  # Comment the next line if you don't want to use dynamic frameworks

  use_frameworks!


  # Pods for Takhawi


  pod 'GoogleMaps'
  pod 'GooglePlaces'
  pod 'GooglePlacePicker'
  pod 'OTPFieldView', :git => 'https://github.com/AbdallaTarek/OTPFieldView.git'
  pod 'EasyTipView', '~> 2.1'
  pod 'lottie-ios'
  pod 'ImageSlideshow', '~> 1.9.0'
  pod 'CountdownLabel'
  pod 'MaterialComponents/TextFields'
  pod 'MaterialComponents/TextControls+FilledTextAreas'
  pod 'MaterialComponents/TextControls+FilledTextFields'
  pod 'MaterialComponents/TextControls+OutlinedTextAreas'
  pod 'MaterialComponents/TextControls+OutlinedTextFields'
  pod 'PureLayout'
  pod 'CollectionViewPagingLayout'
  pod 'HSCycleGalleryView'
  pod 'EDCarousel'
  pod 'EMTNeumorphicView'
  pod 'JDStatusBarNotification'
  pod 'AEOTPTextField'
  pod 'Intercom'
  pod 'FontBlaster', :git => 'https://github.com/ArtSabintsev/FontBlaster.git', :branch => 'swift5.0'
  
  pod 'Socket.IO-Client-Swift', '~> 16.0'
  
  

  post_install do |installer_representation|

    installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
              config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
              config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
              config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
              config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
              config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
          end
      end
  end
  
  
  
end
 
