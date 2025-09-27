**_Karate + Maven Test Automation Framework_**

1. Project Overview

This is a Karate API test automation framework built with Maven and JUnit 5.It is designed to test the RESTful API provided by https://api.restful-api.dev/objects 
It tests RESTful API Objects and validates:

•	CRUD flows (Create, Read, Update, Delete)
•	Schema validation (type checks instead of hard-coded values)
•	Negative testing for invalid inputs
•	Data-driven execution
•	Parallel test runs
•	HTML report generation
It provides hands-on practice in end-to-end API test automation using Karate DSL with JUnit 5.

2. Prerequisites

Make sure the following are installed:

•	Java 21

•	Maven 4.0.0

•	IDE -IntelliJ IDEA 

3. Project Overview

•	Test Framework: Karate (with JUnit 5)
•	Build Tool: Maven
•	Config File: karate-config.js → defines base URL, timeouts, env settings
•	Features: Gherkin .feature files for API scenarios
•	Reports: Karate auto-generated HTML reports
4. Project Structure
   karate-crud-restful
   ├── pom.xml                       # Maven configuration (dependencies & plugins)
   ├── src
   │   └── test
   │       ├── java
   │       │   └── runners
   │       │       └── RunTest.java  # JUnit 5 runner for Karate tests
   │       │
   │       └── resources
   │           ├── feature           # Karate feature files (Gherkin)
   │           │   ├── data_driven.feature
   │           │   ├── Negative.feature
   │           │   ├── object1.feature
   │           │   ├── objects_crud.feature
   │           │   ├── SchemaValidation.feature
   │           │   └── TagsFilter.feature
   │           │
   │           ├── schema            # JSON schemas for validation
   │           │   ├── Normal-get by id.json
   │           │   ├── Update-Schema.json
   │           │   └── User-Schema.json
   │           │
   │           └── karate-config.js  # Global Karate configuration (baseUrl, env, timeouts)
   │
   ├── target                        # Compiled files + Karate HTML reports
   └── .idea / External Libraries    # IDE-specific files (IntelliJ)

5. How to Run Tests
🔹 Run All Tests
mvn clean test
🔹 Run by Tag

Run only scenarios tagged with @crud:
mvn test -Dkarate.options="--tags @crud"
Multiple tags:
mvn test -Dkarate.options="--tags @crud --tags @negative"
🔹 Run Specific Feature
mvn test -Dkarate.options="classpath:features/objects.feature"
🔹 Run by Scenario Name
mvn test -Dkarate.options="--name 'Create an object successfully'"

🔹 Run in Parallel
Karate supports parallel execution by default (JUnit 5). Run with multiple threads:
mvn clean test -Dthreads=5

6. Running from IntelliJ

•	Open Run class/Debug Configurations → Add new JUnit run configuration

•	Point it to your Karate runner class or a specific .feature file

•	To apply tags in IntelliJ:

o	Maven Execute maven Goal( vedio icon)command type( mvn………..)

o	-Dkarate.options="--tags @crud"--- Enter

•	You can right-click any .feature file or scenario → Run directly

7. Tags Used

•	@crud → CRUD flow tests
•	@schema → Schema validation tests
•	@negative → Invalid input/error cases
•	@dataDriven → Data-driven tests


8. Report Generation

Location--
Reports are generated under:  target/karate-reports/


