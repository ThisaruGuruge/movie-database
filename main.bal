import movie_database.datasource;

import ballerina/io;

import thisarug/prettify;

public function main() returns error? {
    final datasource:Client dbClient = check new;

    datasource:Director director1 = {
        id: "1",
        name: "James Cameron",
        birthYear: 1954
    };
    datasource:Director director2 = {
        id: "2",
        name: "Christopher Nolan",
        birthYear: 1970
    };

    datasource:Movie movie1 = {
        id: "1",
        title: "Inception",
        year: 2010,
        directorId: director2.id
    };
    datasource:Movie movie2 = {
        id: "2",
        title: "Interstellar",
        year: 2014,
        directorId: director2.id
    };
    datasource:Movie movie3 = {
        id: "3",
        title: "Tenet",
        year: 2020,
        directorId: director2.id
    };
    datasource:Movie movie4 = {
        id: "4",
        title: "Avatar",
        year: 2009,
        directorId: director1.id
    };
    datasource:Movie movie5 = {
        id: "5",
        title: "Titanic",
        year: 1997,
        directorId: director1.id
    };

    _ = check dbClient->/directors.post([director1, director2]);
    _ = check dbClient->/movies.post([movie1, movie2, movie3, movie4, movie5]);

    stream<datasource:Director, error?> directorStream = dbClient->/directors;
    datasource:Director[] directors = check from datasource:Director director in directorStream
        select director;
    io:println(prettify:prettify(directors));

    stream<record {|
        string title;
        record {|string name;|} director;
    |}, error?> movieStream = dbClient->/movies;
    record {|
        string title;
        record {|string name;|} director;
    |}[] movies = check from record {|string title; record {|string name;|} director;|} movie in movieStream
        select movie;
    io:println(prettify:prettify(movies));
}
