# spring-rest-demo

# Usage

create your ssl cert

```
$ keytool -keystore spring-rest-demo.jks -genkey -alias tomcat -keyalg RSA
```

create your local properties file
```
$ cp config/application.dist.yml config/application.yml

# supply values for <<place holders>> in config/application.yml
```

start the service

```bash
$ ./gradlew build

$ java -jar build/libs/gs-rest-service-0.1.0.jar
```

In browser, navigate to `https://localhost:9443/greeting?name=bob` . You will need to approve use of the self signed ssl cert

