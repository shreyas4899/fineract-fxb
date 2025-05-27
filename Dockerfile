# Use a lightweight JDK base image
FROM eclipse-temurin:21-jdk

# Set work directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Install gradle dependencies and build the project (skip tests)
RUN ./gradlew bootJar -x test --no-daemon

# Expose the port
EXPOSE 8080

# Start the Fineract app
CMD ["java", "-jar", "fineract-provider/build/libs/fineract-provider.jar"]
