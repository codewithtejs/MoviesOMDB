# MoviesOMDB App

## Overview
This project is an implementation of an app that can search the OMDB (Open Movie Database) for movies. It uses the OMDB API to fetch search results based on user input.

## OMDB API
- Documentation: [OMDB API Documentation](http://www.omdbapi.com/)
- Free API key: [OMDB API Key](http://www.omdbapi.com/apikey.aspx)

## Features
- Search for movies using the OMDB API.
- Display search results with movie posters, titles, and years of release.
- Each search result includes a button (non-functional in this implementation).
- Search results are updated dynamically as the user types.

## GitHub Repository
- Repository: [MoviesOMDB](https://github.com/codewithtejs/MoviesOMDB.git)

## How to Use
1. Clone the repository to your local machine.
2. Obtain a free API key from OMDB API (if you don't have one already) and replace my key in the code with your actual API key.
3. Run the app on a suitable platform or emulator.
4. Enter a search term to retrieve movies from OMDB.

## Note
- This app is for demonstration purposes and does not include functionality for the button in the search results.
## Tests
The project includes XCTest cases to ensure the correctness of the `MovieListViewModel` class. These tests cover scenarios such as fetching movies, error handling, and accessing movie view models. You can run these tests to verify the functionality of the app.

To run the tests, open the project in Xcode and select the "Product" menu, then choose "Test" (or press `Command` + `U`). This will run all the XCTest cases in the project and display the results in the Xcode console.

