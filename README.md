# doc-mobile

The doc-mobile is a component of a microservices architecture, specifically designed for displaying the **Document Publication and Approval System** on mobile devices.

## Prerequisites - chưa sửa

Before getting started, make sure you have the following tools installed:

1. [Docker](https://www.docker.com/)
2. [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/) (Please use IntelliJ as some configurations are specific to this IDE)
3. [Eclipse Temurin JDK 17.0.5](https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot) (or any 17 version, but it is recommended to use the proposed version)

## Getting Started - chưa sửa

Follow the steps below to set up and use the source code:

1. Clone the repository using the following command: 
    ```
    git clone https://github.com/hcmus-k19-doc/doc-mobile.git
    ```

3. Before using the source code, you need to build it first (this is a required step, not optional). Run the following Maven command:
    ```
    mvn clean install -DskipTests=true
    ```
Note:
- If you want to run the unit tests, remove the `-DskipTests=true` flag.
- If you want to skip the TypeScript generator, add the `-DskipTypescriptGenerator=true` flag.

4. To start the project, you will need to set up PostgreSQL database, RabbitMQ, and Keycloak (our customized Keycloak, [refer](https://github.com/hcmus-k19-doc/doc-keycloak) for more information), and configure the project to integrate with these services. You can set up the properties in the `application-dev.yaml` file located in the `module service`, package `src\main\resources`.
5. We also provide `liquibase` scripts to create the database schema, you can find them in the `module db`.
To run the scripts, you will need to enable `liquibase` and configure the database you want to use in the `application-dev.yaml` file.

You should now be able to run the project.



## Contact
- [Nguyen Ngoc Phuong Anh](https://github.com/nnpanh)
- [Lam Thinh Phat](https://github.com/PhatSankar)
