Pod::Spec.new do |s|
  s.name             = 'MGGridView'
  s.version          = '0.1.0'
  s.summary          = 'MGGridView is simple grid view.'
  s.homepage         = 'https://github.com/magi82/MGGridView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'magi82' => 'bkhwang82@gmail.com' }
  s.source           = { :git => 'https://github.com/magi82/MGGridView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/*.swift'
end
