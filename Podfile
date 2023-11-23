platform :ios, '14.0'
use_frameworks!

target 'PixabayApp' do
  
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher', '~> 7.0'

  target 'PixabayAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PixabayAppUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
