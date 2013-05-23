#reqdres
##**req**ueste**d** **res**ponse
#What?
reqdres is a set of utilities that extend ```request``` and ```response``` bundled into a piece of connect middleware
#Status
Currently only contains ```res``` utilities
#Install
```
npm install reqdres
```

#Example

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