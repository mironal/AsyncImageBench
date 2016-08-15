"use strict"

const finalhandler = require('finalhandler')
const http = require('http')
const serveStatic = require('serve-static')

const serve = serveStatic('images')

const server = http.createServer(function onRequest (req, res) {
  serve(req, res, finalhandler(req, res))
})

// Listen
server.listen(3000)

