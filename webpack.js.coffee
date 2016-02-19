webpack = require 'webpack'

module.exports =
  entry: './load.js'
  devtool: 'source-map'
  debug: true
  target: 'electron'
  output:
    path: './'
    filename: 'app.js'
    sourceMapFilename: 'app.js.map'
    libraryTarget: "commonjs2"
  resolve:
    extensions: ['', '.coffee', '.js']
  resolveLoader:
    modulesDirectories: ['node_modules']
  plugins: [
    new webpack.NoErrorsPlugin()
    new webpack.optimize.UglifyJsPlugin()
  ]
  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
      {
        test: /\.json$/
        loaders: ['json-loader']
      },
    ]
    noParse: /\.min\.js/
