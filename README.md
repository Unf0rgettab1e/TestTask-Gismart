# Technical Task
Create app that shows some special offer/discount to user. After activating this offer, app displays popup screen with exact time when this offer was activated.

> Screen 1. Displays image on the left, and main content on the right. Some labels, countdown timer which starts when app screen is displayed and tappable "Activate Offer" button. “X" button on top-left does nothing
Popup screen

> Screen 2. When tapping “Activate Offer” button, app displays simple popup in the center of the screen and making background darker. Popup contains “Great!” label with shadow of some color and label describing at which time offer was accepted.
    
## General Requirements:
• Project must be uploaded to GitHub and link to this project must be sent to us.
• App MUST be written using UIKit (NOT SwiftUI).
• App can be written in any architecture (mvc, mvp, mvvm, viper, etc.).
• NO 3rd party frameworks must be used for gradient button or timer.
• App must work only in Landscape orientation.
• App must work on iPhone SE (1st gen) and higher.
• App must work on latest iPads.
• UI MUST match design as much as possible, but colors are not important. Screenshots use
blue(r: 65 g: 69 b: 152) and pink(r: 234 g: 72 b: 187).
• All string must be the same as on design.
## UI Requirements:
• All must be displayed correctly, no overlapping, clipping etc. You can change spacings, sizes if something does not fit.
• There will not be any provided sizes/fonts for iPhone SE (1st gen), so you need to handle fitting UI on your own.
## Countdown Timer Requirements:
• Always show 4 boxes. [day]:[hour]:[minute]:[second]
• Always display number with two digits. Example with 5 seconds: 5 is not correct - 05 is
correct.
• Starts from 24 hours and goes down to zero.
• Changing digits MUST be with rolling (or other nice) animation.
• Starts when screen is displayed.
• Timer updates every second.
• Stops when it runs to zero.
• Timer stops when app enters background and be resumed after returning back to the app
(foreground).
## Popup Requirements:
• Activation time in popup must be displayed in the same format as Countdown Timer. Example:  00:00:03:15 - will be displayed as 03:15

 
