function fn() {
  var env = karate.env || 'dev';
  karate.log('Running in environment:', env);

  var config = {
    baseUrl: 'https://api.restful-api.dev',
    timeout: 5000
  };

  karate.configure('connectTimeout', config.timeout);
  karate.configure('readTimeout', config.timeout);
  return config;
}
