require 'sinatra/base'

# see Sinatra
module Sinatra
	# see Sinatra
	module Helpers
		
		# HTTP helpers
		module HTTP
			
			# Helpers to set the HTTP "`Vary`" header.
			#
			# Usage:
			#
			# Include the module in your Sinatra application:
			#
			#   helpers ::Sinatra::Helpers::HTTP::Vary
			#
			module Vary
				
				VARY_HEADER = 'Vary'.freeze
				VARY_UNSPECIFIED = '*'.freeze
				
				# Sets the HTTP "`Vary`" header in Sinatra's response
				# `headers`.
				#
				# @param   hdr_name  [String]   The HTTP header name.
				# @return                       The updated `headers`.
				#
				def vary!( hdr_name )
					hdr_name = hdr_name.to_s  if ! hdr_name.kind_of?( ::String )
					
					# Shortcut to avoid expensive splitting in the
					# simple "*" case:
					if hdr_name == VARY_UNSPECIFIED
						headers[ VARY_HEADER ] = VARY_UNSPECIFIED.dup  unless (headers[ VARY_HEADER ] == VARY_UNSPECIFIED)
						
					# Normal operation:
					else
						vary_hdrs = headers[ VARY_HEADER ].to_s.
							split( /\s*(?:,\s*)+/ )
						
						if vary_hdrs.include?( VARY_UNSPECIFIED )
							headers[ VARY_HEADER ] = VARY_UNSPECIFIED.dup
						else
							headers[ VARY_HEADER ] =
								vary_hdrs.
								push( hdr_name ).
								uniq( & :downcase ).
								join( ',' )
						end
					end
					return headers[ VARY_HEADER ]
				end
				
				#def vary=( str )
				#	headers[ VARY_HEADER ] = str
				#end
				
			end
		end
	end
	
	#helpers Helpers::HTTP::Vary
	#::Sinatra::Base.helpers Helpers::HTTP::Vary
end

