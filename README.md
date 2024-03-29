# WHERE2EAT README

# Idea Overview

WHERE2Eat is an iOS app that will be used to help individuals, pairs, or groups schedule their meals by narrowing down dining options based on group preferences (such as dietary preferences) and availability. The goals of our project are to simplify the decision-making process for friend groups with keeping all dietary preferences in mind, to promote exploration of new restaurants and cuisines, to enhance group interaction and engagement, and to save time by providing all necessary information in one place.  


# Project Goals 
- Allow groups to find an ideal meal location for everyone
- Cater to dietary preferences so that everyone is able to enjoy the chosen place
- Motivate individuals to explore new cuisines and places they don't usually go to
- Find a restaurant that is at a location that is accessible and ideal for all in the group  

# Repository Layout
Frontend Folder
- File to connect iCloud for Google account login
- File to store user's profile and preferences
- File to generate food location options
- File to generate link and create new session
- File to create chatroom for group to communicate
- File to create calender availabilities
- File to check history of locations visited
- File to check the calendar for days of the current month

 Backend Folder
 - File for getting restaurant APIs
 - File for getting user APIs
 - File for messaging table
 - Filr for generating restaurants to source as options 


- # Repository Updates
  - Building/Running the System
      - Download XCode
      - Clone this file
      - Download iOS 17.2
      - Open up where2eat.xcodeproj in the simulator to run it
  - How to Test the System
    - Run the simulator
    - Make sure the interactions work as expected (text boxes, buttons, navigation bar) lead to the expected output
    - Use the Accessibility Inspector on XCode by going to Developer Tools and then Accessibility Inspector to test the accesibility
    - Adding new tests
       -To add a new test, make sure to create a YAML workflow file in the .github/workflows
       - Define triggers, jobs, and specify commands you want to have tested
       - Push these changes and examine to review and debug
  
  # Backend

  ## Account setup

1. Install AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

2. Run the following command:

    ```bash
    aws configure sso
    ```

    You will be prompted to provide the following information:

    - SSO start URL: `https://where2eat.awsapps.com/start`
    - SSO Region: `us-east-1`

    This will open a new tab in your default web browser.

3. Follow the instructions in the new tab to set up your account.

4. You will then be prompted to provide the following default settings:

    - CLI default client Region and default output format, both can be empty
    - CLI profile name: This is what you will use to specify to use this profile in the command line

The `cdk.json` file tells the CDK Toolkit how to execute your app.

## Deploying backend

In the backend directory:

```bash
npm i
```

To see changes in the backend stack:
```bash
npx cdk diff --profile [profile name created above]
```
Next, to deploy:
```bash
npx cdk deploy --profile [profile name created above]
```

## Useful commands

* `npm run build`   compile typescript to js
* `npm run watch`   watch for changes and compile
* `npm run test`    perform the jest unit tests
* `npx cdk deploy`  deploy this stack to your default AWS account/region
* `npx cdk diff`    compare deployed stack with current state
* `npx cdk synth`   emits the synthesized CloudFormation template

   
  - # Technical Processes
    - Version Control
      - Using GitHub with regular commits and updates to the appropriate folders
    - Bug Tracking
      - Documented in our project live document
   -  Testing and CI
       - Using GitHub Actions that every push triggers
       - Makes sure that every change complies with what is expected in terms of any change not breaking the code
    
- # Working Use Cases
  - Can view some past template sessions
  - Can enter information to create a new session
  - Sharable session ID for users to join sessions
  - Can utilize the chat room to talk to other users
  - Generate location recommendations based on user's preferences
