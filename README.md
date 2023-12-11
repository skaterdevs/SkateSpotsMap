# Introduction
## Background
Our app is a crowd-sourced platform focused on collecting and displaying information about skating locations for skaters of all levels. We offer a place where users can share their favorite skate spots with the wider community, quickly search for spots that fit their specifications, and rate existing locations they've visited through reviews. Our app also includes a Clip Feed that allows users to view and upload videos showing off their amazing tricks to the rest of the world.

## Implementation
### Google Maps SDK for iOS
The core function of our app——displaying user-submitted skate spots——is achieved by utilizing the Google Maps SDK for iOS. We went to great lengths to integrate the API using SwiftUI, as Google Maps SDK is not native to SwiftUI, and was intended for use with UIKit and Storyboards. Therefore, we had to circumvent a lot of the built-in deterrence put into place by painstakingly bridging UIKit and SwiftUI functionalities such as the primary Google Map view, which was otherwise unavailable to us. This SDK also enabled us to accomplish a lot of customization, such as using our custom markers in the embedded Google Map view, letting users easily locate and distinguish between skate spots based on kickout factor.

### AWS S3
Media content is stored in an AWS S3 bucket. The Amplify plugin is used to perform data upload and download. With our bucket public, it allows our app to easily upload and stream video content for our Clips Feed feature.

# SkateSpotsMap Development Setup Guide
## GitHub Setup
GitHub now requires tokens to authenticate whenever making any changes to a repo.
1. Go to github.com and click on your profile and click on Settings
2. Scroll down and click on Developer Settings located in the left hand side of the page
3. Click on Personal Access Tokens and then Fine-grained tokens
4. Click on Generate New Token
5. Fill out the form
   - For the Resource Owner, select skaterdevs
   - For Repository Access, select Only Select Repositories
   - Click on the button and select the private repo SkateSpotsMap
   - For Permissions, enable read and write permissions for the following from the Repository Permissions category
      - Commit Statuses
      - Contents
      - Issues
      - Pull requests
6. Click on Generate New Token
7. Notify me that you have generated your token so I can approve it
   - NOTE: Make sure to copy this key somewhere else as you will not be able to see it again!
  
## Cloning the Project
### Option 1: Xcode
1. Upon opening Xcode, click Clone an existing project
2. If you had not setup your Github credentials on Xcode before, it will prompt you to do so
3. You should now be able to see repos you have access to
4. Click on SkateSpotsMap
5. Once the project has been cloned, exit Xcode

### Option 2: CLI
1. Open a terminal window
2. Navigate to the directory you want to clone the repo to
3. Use git clone [https://github.com/skaterdevs/SkateSpotsMap.git](https://github.com/skaterdevs/SkateSpotsMap.git)

## Working with the Project
### Opening
1. From now on, to open the project in Xcode, YOU MUST click on the ‘SkateSpotsMap.xcworkspace’ file. This is due to some quirks from cocoapods.

### Building
Before building, make sure the selected scheme is 'SkateSpotsMap' and not anything else. Otherwise, our dependencies will not be found by Xcode.

### Credentials
#### API Key
1. For security reasons, the API key is not hardcoded and is stored in a file and referened by our app
2. Simply place the 'contents.txt' file inside the SkateSpotsMap folder

#### GoogleService-Info.plist
1. For more security reasons, the plist is not in the repo. This file has to be manually added.
2. Download the file (ask Jason for it) into the rootDirectory/SkateSpotsMap folder where all the other Swift files are located

#### Amplify
In order to use AWS S3 (storage), we must interface with it through a package called Amplify. This has already been installed and set up. However, if you just do a fresh clone, it will not build as two files are missing. Place the files in the root directory of the project.


# Testing Issues
## Firebase Usage and Data Repositories
No unit tests were written for functions that directly dealt with Firebase (including the data repositories), as testing proved difficult due to the time needed to communicate with Firebase itself. Since none of the functions were explicitly async or used async functions, testing in async wasn't possible. Additionally, using system delays to provide time for Firebase communication caused XCTAsserts to be meaningless (passing when it should fail). As such, these activites (i.e. creating Firebase objects or updating them) were testing manually using the Firebase Web UI and the device simulator.

The following files contain firebase functions:
1. SkateSpotRepository.swift
2. UserRepository.swift
3. SkateSpotViewModel.swift (add & destroy)
4. ReviewViewModel.swift (add & destroy)
5. UserViewModel.swift (add & destroy)

## Core Location
Functions involving Core Location were left without unit tests as we were unable to find a way to artifically set precise latitude and longitude values for unit testing purposes. However, it was possible to set precise latitude and longitude values for the device simulator, as such, function testing for core location was done manually using the simulator.

The following files contain functions that specifically use Core Location:
1. LocationManager.swift
2. SkateSpotViewModel.swift (getDist)

## UI
For the purposes of this project, no UI tests were implemented meaning any functionality in View files didn't receive unit tests, but were instead tested manually.

Additionally, some ViewModel files contained functions that dealt specifically with UI features and as such were left without unit tests and were tested manually. The following View Model files contain UI functions:
1. SkateSpotViewModel.swift (appleMapsRedirect)
2. GoogleMapViewModel
3. MarkerViewModel
4. AddSpotGoogleMapViewModel
