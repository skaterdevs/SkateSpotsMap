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

### Credentials
#### API Key
1. For security reasons, the API key is not hardcoded and must be stored as an environment variable in your Xcode application
2. Go to Product->Scheme->Edit Scheme
3. At the bottom of the dialog window, uncheck Shared
4. At the top of the dialog window, click on Arguments
5. Add a new entry to environment variables
   - Name: MAPS_API_KEY
   - Value: *contact Jason for value*
6. Click Close

#### GoogleService-Info.plist
1. For more security reasons, the plist is not in the repo. This file has to be manually added.
2. Download the file (ask Jason for it) into the SkateSpotsMap folder where all the other Swift files are located
3. Right click on the SkateSpotsMap folder and select Add Files to ‘SkateSpotsMap’...
4. Select the GoogleService-Info.plist

#### Amplify
In order to use AWS S3 (storage), we must interface with it through a package called Amplify. This has already been installed and set up. However, if you just do a fresh clone, it will not build as two files are missing. These files will be provided to you upon request.

