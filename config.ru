require 'sass/plugin/rack'

use Sass::Plugin::Rack
Sass::Plugin.options.merge!(template_location: 'public/css',
                              css_location: 'tmp/css')

use Rack::Static, 
  :urls => ["/images", "/js"],
  :root => "public"

use Rack::Static,
    urls: ['/css'],
    root: File.expand_path('../tmp', __FILE__)

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}