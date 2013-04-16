Sinatra helpers to set the HTTP "`Vary`" header.

See [RFC 2616 (HTTP/1.1): Vary](http://tools.ietf.org/html/rfc2616#section-14.44)

Author: Philipp Kempgen, [http://kempgen.net](http://kempgen.net)


## Usage

Include the module in your Sinatra application:

	helpers ::Sinatra::Helpers::HTTP::Vary

Example:

	vary! 'Accept'
	vary! 'Accept-Language'
	# headers['Vary'] is now "Accept, Accept-Language"

Example:

	vary! '*'
	# headers['Vary'] is now "*"

Example:

	vary! '*'
	vary! 'Accept-Language'
	# headers['Vary'] is now "*"

Example:

	vary! 'Accept-Language'
	vary! '*'
	# headers['Vary'] is now "*"

