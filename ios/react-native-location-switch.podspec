require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))


Pod::Spec.new do |s|
  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.name         = package['name']
  s.summary      = package['description']
  s.version      = package['version']

  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/philiWeitz/react-native-android-location-switch.git", :tag => "master" }
  s.source_files = "*.{h,m}"

  s.dependency 'React'


end
