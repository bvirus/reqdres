assert 		= require 'assert'
reqdres 	= require '../index'
connect 	= require 'connect'
app 		= connect()
request		= require 'supertest'
fs			= require 'fs'
jade		= require 'jade'

describe "res", ->
	beforeEach ->
		app = connect()
		app.use reqdres
			dir: __dirname+"/views"
			ext: ".jade"
			template: jade.__express # tests that the api is express compatable
	describe ".send", ->
		it "should send Hello World", (done)->
			app.use (req, res)->
				res.send "Hello World", 200
			request(app)
				.get('/')
				.expect(200)
				.expect("Hello World", done)
		it "and it should send json and have a default 200 status code", (done)->
			app.use (req, res)->
				res.send {name: "Hello World"}
			request(app)
				.get('/')
				.expect(200)
				.expect("Content-Type", "application/json")
				.expect(JSON.stringify({name: "Hello World"}), done)
	describe ".sendFile", ->
		it "should send a file with the correct MIME type", (done)->
			app.use (req, res)->
				p = require("path").join(__dirname, 'test.txt')
				fs.writeFileSync './log.txt', p+"\n"+"----------------------------"
				res.sendFile p
			request(app)
				.get('/')
				.expect(200)
				.expect("Content-Type", "text/plain")
				.expect("Hello World", done)
	describe ".redirect", ->
		it "should redirect me to another path", (done)->
			app.use '/', (req, res)->
				res.redirect '/test'
			app.use '/test', (req, res, next)->
				res.send("Hello World")
			request(app)
				.get('/')
				.expect(303)
				.expect("Location", "/test", done)
	describe ".render", ->
		it "should render the view", (done)->
			app.use (req, res)->
				res.render "index", name: "Test"
			request(app)
				.get('/')
				.expect(200)
				.expect("Content-Type", "text/html")
				.expect("<p>Hello Test</p>", done)