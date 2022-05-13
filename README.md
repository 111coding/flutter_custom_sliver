# Flutter Custom Sliver
## Features

#### You can use sliver more comfotable!!!
#### Enjoy your coding life!!!

!["screenshot"](https://raw.githubusercontent.com/111coding/flutter_custom_sliver/master/res/screenshot.gif)
!["howtouseit"](https://raw.githubusercontent.com/111coding/flutter_custom_sliver/master/res/howto.jpg)



## Getting started

```yml
dependencies:
  flutter:
    sdk: flutter

    ...

  flutter_custom_sliver: ^0.0.1
```

## Usage

```dart
...
NestedScrollView(
    physics: const ClampingScrollPhysics(),
    headerSliverBuilder: (BuildContext context, bool boxIsScrolled) => [
    /*
     * =============== sliver begin ===============
     */
    CustomSliverAppBar(
        appBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: const [Icon(Icons.arrow_back_ios)]),
        ),
        appBarBackgroundColor: Colors.white,
        expandedSpace: Image.asset(
            "assets/flutter-logo.jpg",
            fit: BoxFit.fitHeight,
        ),
        openedSystemUiOverlayStyle: SystemUiOverlayStyle.light,
        closedSystemUiOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    /*
     * =============== sliver end ===============
     */
],
body: ...
```

