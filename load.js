var err = require('./err');
var pJson = require('./package.json');

var raven = require('raven');
var sentryDsn = 'https://f26ed01279dd47dba21ee4d6cc364eda:fbd060eab91247539dc2f56bfb1192d7@app.getsentry.com/67648';
var releaseInfo = {release: pJson.version};
console.log(releaseInfo);
var ravenClient = new raven.Client(sentryDsn, releaseInfo);

window.addEventListener('error', function(e) {
  console.error(e.error.stack || e.error.message || e.error);
  ravenClient.captureException(e.error);
});

console.log("asd");


err();

