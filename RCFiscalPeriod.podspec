#
# Be sure to run `pod lib lint RCFiscalPeriod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RCFiscalPeriod'
  s.version          = '0.1.0'
  s.summary          = 'NSDate category to calculate fiscal year'

Fiscall year is created to calculate the fiscal period of a specific date with following rule:
Starting day of the year is the first Saturday of the year
One period is equal to four weeks (following first saturday of the year)
One quarter is equal to three period


  s.description      = <<-DESC
Fiscall year is created to calculate the fiscal period of a specific date with following rule:
- Starting day of the year is the first Saturday of the year
- One `period` is equal to four weeks (following first saturday of the year)
- One `quarter` is equal to three `period`

                       DESC

  s.homepage         = 'https://github.com/khemarin/RCFiscalPeriod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Khemarin' => 'loch_khemarin@yahoo.com' }
  s.source           = { :git => 'https://github.com/khemarin/RCFiscalPeriod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RCFiscalPeriod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RCFiscalPeriod' => ['RCFiscalPeriod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
