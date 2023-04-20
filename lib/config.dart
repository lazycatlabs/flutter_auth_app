enum Environment {
  staging("https://reqres.in", "staging"),
  production("https://reqres.in", "production");

  const Environment(this.url, this.env);

  final String url;
  final String env;
}

Environment environment = Environment.staging;
