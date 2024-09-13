# CSTV

This iOS project was created as a challenge for [Fuze.cc](https://fuze.cc/) interview process, but I decided to leave it public as an example of my work.
I also intend to update it every so often to test or play around with some things, including Github features.

> [!IMPORTANT]
> Due to equipment's limitations this project was developed using _Xcode 14.2_, which means I was unable to use some modern features like _Swift Macros_.

## Project Requirements

The candidate must build an app that will display a list of _Counter-Strike_ matches happening across several worldwide tournaments.

- There are 3 screens:
  - Splash Screen - This screen will show the app logo, and should be displayed every time the app is launched for a given amount of time before the main screen is shown.
  - Main Screen (Matches List) - This screen will display a list of matches, beginning from the current date. The list should be sorted so that currently playing matches will appear on top. Each match will show basic data like the League, Teams, date and time, as well as its status. The status can be: Ended, In Progress, and Scheduled.
  - Match Detail Screen - This screen will appear when the user selects a match from the main screen. Aside from the data shown in the matches list, this will also display the players from each team, with their respective names, nicknames, and pictures.
- UI must follow the [Figma](#figma) spec. Attention to detail is a must.
- The [PandaScore](https://pandascore.co/) API will be used for listing the matches as well as fetching match details.
- Dates shown should follow the device local time.
- The app must have pull-to-refresh in the main screen to reload the matches list.
- Usually expected to be finished within one week.
- Optionals:
  - Unit tests
  - MVVM architecture
  - Pagination support
  - Reactive programming (RxSwift / Combine)
  - Responsiveness

### Figma

Content of the Figma file added here for easy of access.

![Figma CSTV](https://github.com/user-attachments/assets/09a2d070-c260-4a6e-8eb0-adddbb5e5f75)

## Implementation

I implemented the project using _SwiftUI_ with _MVVM_. It fulfils all requirements except for pagination support because I lacked the time to properly implement it.

Some other details:

- The app is localized in English and Portuguese and [should show the correct date format for any region](https://github.com/Robuske/CSTV/blob/dcf34ddb8919522a29a3e5db1763af04a2869106/CSTV/List/MatchesList%2BViewModel.swift#L67).
- As stated above, I had to use Xcode 14.2 due to my equipments limitations, it's possible that there will be some differences when running on a newer version.
- I would usually use a tool like [SwiftLint](https://github.com/realm/SwiftLint) for keeping the code style consistent, but I decided to not use any dependencies in this project. For the same reason I ended up not using [SwiftGen](https://github.com/SwiftGen/SwiftGen) for generating code related to the resources, instead I wrote my own code to access them and [included Unit Tests](https://github.com/Robuske/CSTV/blob/dcf34ddb8919522a29a3e5db1763af04a2869106/CSTVTests/MainAssetsTests.swift) to avoid problems.
- Unfortunately the image available on Figma for the splash screen was not a vector and pretty small, so it ends up looking a little weird.
- I usually prefer to use _merge commits_ when merging branches, but due to my mistake while using Xcode's Git tools, the branches were effectively _rebased_ on top of main.
- To run the app properly you'll need to set your _PandaScore API_ token on [PandaEndpoint.accessToken](https://github.com/Robuske/CSTV/blob/dcf34ddb8919522a29a3e5db1763af04a2869106/CSTV/Network/PandaEndpoint.swift#L18).
- Since the Figma specs didn't include details on how to display errors, I left the error treatment very basic.
- Sometimes the _API_ does not have a valid `URL` for an image, so the grey placeholder is kept.

You can check the code as it was at the time of delivery with the tag [v1.0.0](https://github.com/Robuske/CSTV/tree/v1.0.0).

### Demo

Below is a video demo of the app running, the language was set to English and region to United States through the scheme.

https://github.com/user-attachments/assets/3edfeaa5-9481-4bb4-a5e9-b351c3810ebd



