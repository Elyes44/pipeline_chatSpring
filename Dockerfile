FROM openjdk:11
WORKDIR /app
COPY target/chat-1.0.jar /app/chat.jar
ENTRYPOINT ["java", "-jar", "chat.jar"]
