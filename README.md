# Introduction

This is a simple location-based app that uses foursquare's places API.
<br>
I chose **Redux** as a design pattern for this project because of its testablity and maintainability. although I didn't have enough time to write unit tests but I wrote a very simple one to showcase this matter :) 
<br>
I chose **SwiftUI** instead of UIKit because redux is a reactive architecture and SwiftUI is way more reactive-friendly and I think it's cool to try some new frameworks specially when developing non-production apps.
<br>
I chose **Realm** for data caching over core data because realm's engine is faster and simpler than ORM-based enignes like core data.


# Reference links

https://github.com/kitasuke/SwiftUI-Flux
<br>
What i used to implement Redux. This framework leverages Apple's **Combine** framework.


https://github.com/SDWebImage/SDWebImageSwiftUI
<br>
What i used to handle image-caching.


https://github.com/arturdev/Unrealm
<br>
Realm is great and all, but it doesn't support structs. Oh Well :). This is what i used to make realm struct-friendly and get rid of all the hassle that is required to convert structs to classes so that realm can make an understaning of them.


# Screenshots

