
## Parse iOS example

## Features

- Sign up
- Log in
- Log out
- Twitter log in
- Resetting password

## How to Run

1. Clone the repository and open the Xcode project at `Parse.xcodeproj`.

2. Create an app at [Parse](https://parse.com/apps).

3. Copy your new app's application id and client key into `AppDelegate.swift`:

  ```swift
  Parse.setApplicationId("APPLICATION_ID", clientKey: "CLIENT_KEY")
  ```
4. Copy your new Twitter app's Consumer Key and Consumer Secret into `AppDelegate.swift`:

  ```swift
  PFTwitterUtils.initializeWithConsumerKey("YOUR CONSUMER KEY",  consumerSecret:"YOUR CONSUMER SECRET")
  ```
5. Build and run.
