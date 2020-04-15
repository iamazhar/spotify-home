<p align="center>
   <img width="200" src="app-icon.png" />
</p>

<p align="center">
  <h1 align = "center">Spotify Home</h1>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.1-brightgreen.svg" />
    <a href="https://twitter.com/azhar_dev">
        <img src="https://img.shields.io/badge/Contact-%40azhar__dev-blue" alt="Twitter: @azhar_dev" />
    </a>
</p>

:exclamation: You need to set up a client app on the [Spotify developer site](https://developer.spotify.com/dashboard/). Use the client id, client secret, and redirect URL from there inside the SpotifyAuthService class. Check the [SpotifyLogin github page](https://github.com/spotify/SpotifyLogin) for detailed steps on how to set this up.

The project is a clone of the Spotify home screen UI with networking data from the Spotify Web API. The login feature is implemented using the official SpotifyLogin SDK. 

The purpose of the app is to implement a Desing System using design tokens, Objective C and Swift interoperability, and Unit tests. The Project includes the Sketch file that was used to design the UI. The code is documented using Jazzy docs, this can be found within `/docs`. 

<p align="center">
  <img width="360" src="spt-clone-preview.gif">
</p>


## Documentation
#### 21% documented, in progress
[Spotify-Home Documentation](https://iamazhar.github.io/Spotify-Home/)

## Swift Style Guide

Code follows Raywenderlich style guide.

## Dependencies

Thrid party framewoks and Library are managed using Cocoapods.

Carthage used
- github "spotify/SpotifyLogin"
- github "onevcat/Kingfisher" ~> 5.0

## Folder Structure and Architecture

Each Module Will have its own folder. eg -
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
