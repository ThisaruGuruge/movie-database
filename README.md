# Movie Database

This is a sample Ballerina repository for a movie database. It demonstrates how to use Ballerina persistence support to store and retrieve data from a database and expose it as a GraphQL service.

## Prerequisites

1. Download and install [Ballerina](https://ballerina.io/downloads/).
2. Install Ballerina [VSCode plugin](https://marketplace.visualstudio.com/items?itemName=WSO2.ballerina).
3. A MySQL database.
    Optionally, you can use the docker-compose file provided in the repository to start a MySQL database using Docker.

## Getting Started

1. Clone the repository.

2. Navigate to the `movie-database` directory.

    ```bash
    cd movie-database
    ```

3. Start the MySQL database using Docker.

    ```bash
    docker-compose up
    ```

4. Generate the persistence layer by running the following command.

    ```bash
    bal persist generate
    ```

5. Run the Ballerina service.

    ```bash
    bal run
    ```
