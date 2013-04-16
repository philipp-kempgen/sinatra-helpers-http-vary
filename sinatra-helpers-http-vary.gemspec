# -*- encoding: utf-8 -*-

#lib_dir = File.expand_path( '../lib/', __FILE__ )
#$LOAD_PATH.unshift( lib_dir )

#require 'my_lib/version'

spec = Gem::Specification.new { |s|
	s.name         = 'sinatra-helpers-http-vary'
	s.version      = '0.1.0'
	s.summary      = "Sinatra helpers to set the HTTP Vary header."
	s.description  = "Helpers for setting the HTTP Vary header in Sinatra."
	s.author       = "Philipp Kempgen"
	s.homepage     = 'https://github.com/philipp-kempgen/sinatra-helpers-http-vary'
	s.platform     = Gem::Platform::RUBY
	s.require_path = 'lib'
	s.executables  = []
	s.files        = Dir.glob( '{lib,bin}/**/*' ) + %w(
		README.md
	)
	
	s.add_dependency "sinatra", "~> 1.3"
}


# Local Variables:
# mode: ruby
# indent-tabs-mode: t
# End:

