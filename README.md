# Twu.Bucketlist.iOS

Project Final Report
Noah Solorzano
Jonathan Ninan

Device: iPhone 11

App Title: twu.bucketlist.ios/Bucketlist-2/**BucketList**.xcodeproj


The App is a tool used to keep track of tasks one wishes to complete, in other words,
a Bucket List. The app starts up with a prepopulated list as an example. You can click
on each item to open a different screen in which you can edit the name,latitude, longitude and
description of each task, with a save button at the top right corner to save changes made.
There is a buton on the bottom right corner of the app that allows one to add a new item 
to the list. Each item has a checkbox that marks an item as completed and move the item
to the bottom of the list. Swiping on an item allows for its deletion.

The first lesson learned was the mistake of choosing SwiftUI instead of Storyboard for
the user interface. Our first builds were not connecting to the animations when 
attempting to put the project in the simulator. To check for parameters we used if
statements along with an alert (when checking to see if all fields are filled when
adding or editing an item in the list.) For the checkboxes, we utilized a custom
cell as a boolean (checked or unchecked) and then applied an if statement to link 
its action to reference it when telling the code to move the item to the bottom 
of the list.This action was implemented using stack logic.
We learned about model to structure our application. To use it we
imported Foundation. In a separate file we defined the attributes. It helps retain
dummy data and the information attached to each item on the list so that the array
holds an index and at the index the nodes reference their individual data efficiently.
Pushview controller pushes a view controller onto our array stack.
Popview controller pops the top view controller from the array stack.
We used protocol when having issues with segues.



iOS mini-app

Swiping on an item gives the ability to delete it from the list.
The "+" button also adds an item.