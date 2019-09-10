Pod::Spec.new do |s|
  s.author       = { "author" => "author@domain.cn" }
  s.description  = "ReactNativeAndroidLocationSwitch"
  s.homepage     = "https://github.com/philiWeitz/react-native-location-switch"
  s.license      = "Apache-2.0"
  s.name         = "ReactNativeAndroidLocationSwitch"
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/philiWeitz/react-native-android-location-switch.git", :tag => "master" }
  s.source_files = "ReactNativeAndroidLocationSwitch/**/*.{h,m}"
  s.summary      = "ReactNativeAndroidLocationSwitch"
  s.version      = "1.0.0"

  s.dependency "React"

end
