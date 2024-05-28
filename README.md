# WCW/nWo Thunder
A decompilation of the _WCW/nWo Thunder_ video game on PlayStation.

## Building
The project has a `Makefile` that builds an executable from assembly. This expects the main executable from the game disc (**SLUS_007.79**) in the root directory. This file is not provided, so you are expected to have your own copy.

With the executable in the root directory, you should be able to run `make setup`. If that step succeeds, then run `make`. The `Makefile` will, by default, report if the generated executable matches the original.

## Contributing
Contributions are most welcome. Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md)
