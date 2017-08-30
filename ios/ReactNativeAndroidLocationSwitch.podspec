
Pod::Spec.new do |s|
  s.name         = "ReactNativeAndroidLocationSwitch"
  s.version      = "1.0.0"
  s.summary      = "ReactNativeAndroidLocationSwitch"
  s.description  = <<-DESC
                  ReactNativeAndroidLocationSwitch
                   DESC
  s.homepage     = ""
  s.license      = "Apache-2.0"
  # s.license      = { :type => "Apache-2.0", :file => "../LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/philiWeitz/react-native-android-location-switch.git", :tag => "master" }
  s.source_files  = "ReactNativeAndroidLocationSwitch/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  