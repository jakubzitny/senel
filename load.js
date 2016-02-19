var err = require('./err');
var pJson = require('./package.json');

var raven = require('raven');
var sentryDsn = 'https://f26ed01279dd47dba21ee4d6cc364eda:fbd060eab91247539dc2f56bfb1192d7@app.getsentry.com/67648';
var clientConfig = {
  release: pJson.version,
  dataCallback: function(data) {
    var normalize = function(filename) {
      splitArray = filename.split("/");
      return splitArray[splitArray.length - 1];
    };

    data.exception[0].stacktrace.frames.forEach(function(frame) {
      frame.filename = normalize(frame.filename);
    })

    data.culprit = data.exception[0].stacktrace.frames[0].filename

    console.log(data);
    return data
  }
};
var ravenClient = new raven.Client(sentryDsn, clientConfig);

window.addEventListener('error', function(e) {
  console.error(e.error.stack || e.error.message || e.error);
  ravenClient.captureException(e.error);
});

console.log("asd");


err();

