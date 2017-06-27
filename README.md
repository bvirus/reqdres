# reqdres
__req__ueste **d** __res__ponse
# What?
reqdres is a set of utilities that extend ```request``` and ```response``` bundled into a piece of connect middleware
# Status
Currently only contains ```res``` utilities
# Install
```
npm install reqdres
```

# Example

```javascript
var connect = require("connect");
var reqdres = require("reqdres");
var app = connect();

app.use(redres({
	dir: __dirname+"/views", // the directory to look for views
	ext: ".jade", // the view extension
	template: jade.__express // mostly express compatable (currently no support for extends)
}));


app.use(function(req, res){
	// don't actually work all at once like this
	res.send({some: "json"}, 200); // status code optional, defaults to 200
	res.sendFile("./test.txt"); // streams a file
	res.render("index", {foo: "bar"}, function(err, html){
		// this callback and the locals object are optional
	}); // renders views/index.jade
})
```

# License
The MIT License (MIT)

Copyright (c) 2013 James A. Eschrich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
