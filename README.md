# Karate Test Automation Project

![Java](https://img.shields.io/badge/Java-21_(Temurin)-orange)
![Maven](https://img.shields.io/badge/Maven-3.9.12-blue)
![Karate](https://img.shields.io/badge/Karate-1.4.1-green)

A sample Karate project for API automation testing.

## Prerequisites

Strict version requirements are enforced for consistency.

- **Java JDK**: 21 (Eclipse Temurin recommended)
- **Apache Maven**: 3.9.12

## Installation Guide

### macOS

Using [Homebrew](https://brew.sh/):

1.  **Install Java 21 (Temurin)**:
    ```bash
    brew install --cask temurin@21
    ```
2.  **Install Maven**:
    ```bash
    brew install maven
    ```
    *Note: If Brew installs a newer version, you may need to specify the version or use SDKMAN.*

### Linux

Using [SDKMAN!](https://sdkman.io/) (Recommended for precise version control):

1.  **Install SDKMAN** (if not installed):
    ```bash
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    ```
2.  **Install Java 21**:
    ```bash
    sdk install java 21.0.2-tem
    ```
3.  **Install Maven 3.9.12**:
    ```bash
    sdk install maven 3.9.12
    ```

### Windows

Option 1: Using [Chocolatey](https://chocolatey.org/):

1.  **Install Java 21**:
    ```powershell
    choco install temurin21jdk
    ```
2.  **Install Maven**:
    ```powershell
    choco install maven --version 3.9.12
    ```

Option 2: Manual Installation:
1.  Download **Eclipse Temurin JDK 21** from [Adoptium](https://adoptium.net/).
2.  Download **Maven 3.9.12** from the [Maven Archives](https://archive.apache.org/dist/maven/maven-3/3.9.12/binaries/).
3.  Add both `bin` folders to your System `PATH`.

## How to Run Tests

Verify your setup:
```bash
java -version
mvn -version
```

Clone this repo:
```bash
git clone https://github.com/danielshamsudin/karate-bootstrap
cd karate-bootstrap
```

Run all tests:
```bash
mvn clean install
mvn test
```

## How to Add New Tests

### 1. Create a Feature File
Create a `.feature` file in a subfolder within `src/test/java/examples/`. For example, `src/test/java/examples/todos/todos.feature`.

```cucumber
Feature: Todos API

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Get all todos
    Given path 'todos'
    When method get
    Then status 200
```

### 2. Create a Test Runner
Create a Java class in the **same folder** as your feature file. It must end with `Test.java` (e.g., `TodosTest.java`).

```java
package examples.todos;

import com.intuit.karate.junit5.Karate;

class TodosTest {
    
    @Karate.Test
    Karate testTodos() {
        return Karate.run("todos").relativeTo(getClass());
    }    
}
```

### 3. Run the Test
You can run this specific test using Maven:
```bash
mvn test -Dtest=TodosTest
```

### 4. Run specific feature file
```bash
mvn test -Dkarate.options="classpath:<feature_file_directory>/<feature_file_name>.feature"
```
