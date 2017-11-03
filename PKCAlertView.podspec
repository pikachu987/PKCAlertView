Pod::Spec.new do |s|
  s.name             = 'PKCAlertView'
  s.version          = '0.1.6'
  s.summary          = 'A view that can have the same effect as a UIAlertController with addSubView in the view'
  s.description      = 'In UIViewController, it is inconvenient for UIAlertController screen to come out when screen is changed. In order to get Alert screen from UIView, AlertView should let Alert come out of view from controller.'
  s.homepage         = 'https://github.com/pikachu987/PKCAlertView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pikachu987' => 'pikachu77769@gmail.com' }
  s.source           = { :git => 'https://github.com/pikachu987/PKCAlertView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'PKCAlertView/Classes/**/*'
end
