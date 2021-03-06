<p align="center">
  <img width="100" src="app-icon.png" />
   <br>
  <h1 align = "center">Spotify Home :notes:</h1>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.1-brightgreen.svg" />
    <a href="https://twitter.com/azhar_dev">
        <img src="https://img.shields.io/badge/Contact-%40azhar__dev-blue" alt="Twitter: @azhar_dev" />
    </a>
</p>

The project is a clone of the Spotify home screen UI with networking data from the Spotify Web API. The login feature is implemented using the official SpotifyLogin SDK. 

The purpose of the app is to implement a Design System using design tokens, Objective C and Swift interoperability, and Unit tests. The Project includes the Sketch file that was used to design the UI. The code is documented using Jazzy docs, this can be found within `/docs`. 

## Getting started

:exclamation: You need to set up a client app on the [Spotify developer site](https://developer.spotify.com/dashboard/). Use the client id, client secret, and redirect URL from there inside the SpotifyAuthService class. Check the [SpotifyLogin github page](https://github.com/spotify/SpotifyLogin) for detailed steps on how to set this up.

Run `carthage update --platform iOS` to install the dependencies.

<br>
<p align="center">
  <img width="360" src="spt-clone-preview.gif">
</p>


## Documentation
#### 21% documented, in progress
[Spotify-Home Documentation](https://iamazhar.github.io/spotify-home/)

## Swift Style Guide

Code follows the [Raywenderlich style guide](https://github.com/raywenderlich/swift-style-guide).

## Dependencies

Carthage frameworks used
- github "spotify/SpotifyLogin"
- github "onevcat/Kingfisher" ~> 5.0

## Folder Structure and Architecture

Each module will have its folder. eg -
- Views
- View Models
- Design_System
- Resources
- Extensions
- Controllers
- Common
- Networking
- Bridging-Header.h
- Frameworks (Folder for 3rd party code which does not have Cocoapods)
- AppDelegate.swift
- LaunchScreen.storyboard
- Info.plist
