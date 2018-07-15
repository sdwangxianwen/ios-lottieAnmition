
Pod::Spec.new do |s|
s.name         = 'ios-lotieAnmitionView'
s.version      = '0.0.1'
s.summary      = '创建lottie动画'
s.homepage     = 'https://github.com/sdwangxianwen/ios-lottieAnmition.git'
s.license      = 'MIT'
s.authors      = {'wangwenwen' => '870183756@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/sdwangxianwen/ios-lottieAnmition.git', :tag => s.version}
s.source_files = 'ios-lotieAnmitionView/**/*'
s.requires_arc = true
end
