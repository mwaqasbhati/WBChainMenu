#
# Be sure to run `pod lib lint WBChainMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WBChainMenu'
  s.version          = '0.1.1'
  s.summary          = 'This will show horizontal menu to a UITableViewCell with chain animation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This menu will resolve a problem currently iOS devs are facing while adding multiple options in UITableViewCell. I have made this controller with the aim to help and take guidance.'

  s.homepage         = 'https://github.com/mwaqasbhati/WBChainMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mwaqasbhati' => 'm.waqas.bhati@hotmail.com' }
  s.source           = { :git => 'https://github.com/mwaqasbhati/WBChainMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '4.2'
  s.ios.deployment_target = '11.0'

  s.source_files = 'WBChainMenu/Classes/**/*'
  
  #s.resource_bundles = {
  #  'WBChainMenu' => ['WBChainMenu/Assets/*.png']
  #}
  #s.resources = 'WBChainMenu/Assets/*.png'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
