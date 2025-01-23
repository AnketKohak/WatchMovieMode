# WatchMovieMode

WatchMovieMode is an iOS application that allows users to browse and view details about movies and TV shows. The app fetches data from an external API and displays it using SwiftUI.

## Features

- Browse a list of movies and TV shows
- View detailed information about each movie or TV show
- Segmented control to switch between movies and TV shows
- Asynchronous image loading with placeholders
- Error handling and loading indicators

## VideoWalkThrough


https://github.com/user-attachments/assets/3c3e6633-ed35-48be-9cba-28f8a35b7463



## Experience

Working on WatchMovieMode has been an enriching experience. Implementing the app using SwiftUI for  declarative UI framework and its integration with Combine for handling asynchronous data. The project structure was organized to separate concerns, making the codebase more maintainable and scalable.

## Features Implemented

1. **Movie and TV Show Browsing**: Users can browse a list of movies and TV shows fetched from an external API.
2. **Detailed View**: Users can view detailed information about each movie or TV show, including title, release date, runtime, user rating, and more.
3. **Segmented Control**: A segmented control allows users to switch between the list of movies and TV shows.
4. **Asynchronous Image Loading**: Images are loaded asynchronously with placeholders to enhance the user experience.
5. **Error Handling and Loading Indicators**: Proper error handling and loading indicators are implemented to provide feedback to users during data fetching.

## Challenges Faced

1. **API Integration**: Integrating with the external API and handling different endpoints for movies and TV shows required careful planning and implementation.

2. **Asynchronous Data Handling**: Managing asynchronous data fetching and updating the UI accordingly was challenging but rewarding with the use of Combine.
3. **Data Retrieval Challeng:**: I encountered a challenge where different APIs were used: one for fetching a list of movies/TV shows, and another for retrieving detailed information about a specific selected item (movie or TV show) using its unique ID.

## Assumptions Made

1. **API Stability**: It is assumed that the external API used for fetching movie and TV show data is stable and reliable.
2. **Network Availability**: The app assumes that the user has a stable internet connection for fetching data from the API.
3. **Data Consistency**: It is assumed that the data returned by the API is consistent and follows the expected format.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/WatchMovieMode.git
    ```
2. Open the project in Xcode:
    ```sh
    cd WatchMovieMode
    open WatchMovieMode.xcodeproj
    ```
3. Build and run the project on your preferred simulator or device.

## Usage

- Launch the app to see a list of movies and TV shows.
- Use the segmented control at the top to switch between movies and TV shows.
- Tap on a movie or TV show to view detailed information.

## Dependencies

- SwiftUI
- Combine

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- API provided by [WatchMode](https://api.watchmode.com/)

## Author

Anket Kohak
