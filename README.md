Clone project. Create separate brunch, where all fixes will be committed. Make sure to always open the Xcode workspace ( Lifecake-test.xcworkspace) instead of the project file when building your project. Commit your code after each fix.

- using google is allowed
- you should be able to explain any code changes
- using Xcode instruments highly recommended

Feel free to ask if you have any questions, something is unclear or you are stuck on some task.

Skype: artjom.popov
Email: artjom@lifecake.com

Skype: thelegothief
Email: marks@lifecake.com

Links:
Cocoapod: https://cocoapods.org/
SDWebImage: https://github.com/rs/SDWebImage

App description:
Simple app, that loads 10000 random numbers that are displayed in table view with some images. Numbers are selected randomly from 0 - 100000. Numbers could be loaded / displayed in any order, only requirement is to show number only once. User could open image by tapping on that.

Task 1. Bugs
1) Opening app takes too long. Find some way to optimise that.
2) Scrolling through table view makes images to flicker. This should be fixed.
3) Opening / closing image reduces app free memory (check console logs) and could cause memory warnings. Find memory leaks and fix them.

Task 2. Core Data
1) Currently on each app loading we generate new random numbers. Lets save after first launch all numbers using core data (order should be saved as well)

Is Core Data fast enough for such amount of records? What are possible solutions?

Task 3. Collection View.
Replace UITableView with UICollectionView. View should display one cell in a row. Cell should contain image and number. Tapping cell should open image.

Task 4. Swift
Convert project (fixed one) from objective-c to swift. Probably it will be easier to setup it as new project and commit to new repo / branch. 
