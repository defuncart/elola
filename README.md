# ¿El o La?

A fun Spanish nouns game.

## Getting Started

If you would like to build the app yourself, then you simply need:

- Flutter beta
- Dart >= 2.7
- Xcode >= 11.3
- Android SDK >= 29.0.4
- Chrome

A web version of the app can be found at [http://defuncart.com/elola](http://defuncart.com/elola).

## Git Flow

This project adheres to the following Git Flow:

**master** contains the latest dev build. This may be unstable and may contain bugs. Stable releases are tagged.

**feature/XX** is a branch implementing a given feature.

**release/x.y.z** is a release candidate. After this is approved, the branch is merged into *master* and a tag *x.y.z* is created.

Once a branch is merged into *master*, it is automatically deleted.

A simple CI pipeline is used to automatically test each feature before being merged into *master*:

- Static code analysis
- Unit & widget tests
- AOT compilation
- Android build
- iOS build
- Web build

Each merge into *master* triggers a job which publishes a web version of the app.

## Contributing

The project isn't actively looking for contributors, however feel free to contact James here on GitHub or [Twitter](https://twitter.com/defuncart).

## Credits

Concept, Design and Programming by James Leahy.
