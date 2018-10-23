# iTunes Music Player Demo App

"iTunes Music Player Demo App" is a iOS Native Application develoeped using Swift 4 programming language. This App will let the user

  - To browse through list of Music Albums
  - To Search for Music
  - Get information about the Album and stream preview

User can also:
  - Filter from the local search result
  - Do easy refresh by pulling the Tableview down
  - View the App in all devices(iPhones,iPads,iPods) in any orientation

### Compatibility 

* Deployment Target - 8.0
* The application supports iOS 8+
* iTunes Music Player Demo App is an Universal App compatible for all iPhones and iPads

### Concepts Used

* Used AVFoundation framework for playing Audio
* Created CABasicAnimation for artwork image in Player view
* Used Async request for NSURLConnection
* Time taking process like JSON parsing and Loading image data are done in seperate thread
* Exception handled while parsing JSON
* Table images lazy loaded in different thread to avoid performace issue

### Design

* Used Size Classes to create adaptive layout
* Implemented custom design is implemented to WR-HC in player view
* Constraints added for UIObjects
* Stackview not used as the application supports from iOS 8
* Two images Pause and Play.png added to project which is used in Player view(DetailViewController)
* Helvatica font is used all over the project
* Font color Black is maintained all over the Project

#### Testing

* UI Testing done in All devices in All Orientations
    * iPhone SE
    * iPhone 5, 5S
    * iPhone 6, 6+
    * iPhone 6S, 6S+
    * iPhone 7, 7+
	* iPhone 8, 8+
	* iPhone X
    * iPad Air, Air 2 , Pro
* App tested for multiple search and navigation between views
* Leak test done with Instruments
* CPU and Memory utilization verified

#### Issues

* m4a audio format is not playing
* Table imageview image size is not constant

### Cleanup

* All print and All Breakpoints Removed
* Files structured into respective Folders
* Project built with 0 errors and Warnings
* Comments added for all classes and methods
* Naming conventions as per Apple Guideleines
* Camel case for variables and methods

### Areas to improve
This app can be further improved
* By implementing Unit Testing
* By Using Size classes and differentiate iPad and iPhone design more
* By adding more rich design (like UICollectionview and UIKitDynamic animation)
* By Adding Tab screen to play local songs in device and play online stream preview
* By Adding Buy button
* Make images in table cell to constant size
