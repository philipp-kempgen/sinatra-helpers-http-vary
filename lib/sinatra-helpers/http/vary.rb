require 'sinatra/base'

module Sinatra
	module Helpers
		module Http
			
			def vary( header_name )
				if header_name.to_s == '*'
					headers['Vary'] = '*'
				else
					vary_headers = headers['Vary'].to_s.
						split( /\s*(?:,\s*)+/ )
					
					if vary_headers.include?( '*' )
						headers['Vary'] = '*'
					else
						headers['Vary'] =
							vary_headers.
							push( header_name.to_s ).
							uniq( & :downcase ).
							join( ',' )
					end
				end
				return headers['Vary']
			end
			
			#def vary=( str )
			#	headers['Vary'] = str
			#end
			
		end
	end
	
	#helpers Helpers::Http
	#::Sinatra::Base.helpers Helpers::Http
end

