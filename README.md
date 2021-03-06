# A Heroku Goliath Demonstration

This is a little app to demonstrate the power of Heroku's new HTTP stack.

(Hint: A working version of this is up at `http://cedar-fib.heroku.com/` but read the below to realise why it won't work if you bring it up in a browser...)

It uses Goliath to stream a response to HTTP requests, keeping connections alive perpetually (with a little message every 29 seconds) and also sending back generated Fibonacci numbers (and it generates from scratch for each new request).

As it runs on Goliath, not only is the response streamed live, but the server is also capable of handling multiple requests using a single dyno (and quite well, too).

Please note that due to the simplistic use of streaming, some web browsers (such as Google's Chrome) won't render any content from the page that this app throws up and you need to use `curl` or a similar tool to get at the results (some browsers, such as Firefox, however, *do* render the content as it is streamed).

Set-up as follows:

	git clone https://github.com/tekacs/heroku-cedar-streaming-demo.git
	cd heroku-cedar-streaming-demo
	heroku create --stack cedar <appname>
	git push heroku master

And that's it. Try getting at the response (be prepared for a flooded terminal) with:

	curl 'http://<appname>.herokuapp.com/'

And you can cut off the connection with Ctrl-C.

Incidentally, interesting to see is the speed reported by:

	wget 'http://<appname>.herokuapp.com/'

Anyway - have fun!