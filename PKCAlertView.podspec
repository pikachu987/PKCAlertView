Pod::Spec.new do |s|
  s.name             = 'PKCAlertView'
  s.version          = '0.1.0'
  s.summary          = 'AlertView'
  s.description      = 'UIAlertController -> PKCAlertView'
  s.homepage         = 'https://github.com/pikachu987/PKCAlertView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pikachu987' => 'pikachu77769@gmail.com' }
  s.source           = { :git => 'https://github.com/pikachu987/PKCAlertView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'PKCAlertView/Classes/**/*'
end
