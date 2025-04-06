# WCW/nWo Thunder
[![Build](https://github.com/martinbean/thunder/actions/workflows/build.yml/badge.svg)](https://github.com/martinbean/thunder/actions/workflows/build.yml)

A decompilation of the _WCW/nWo Thunder_ video game on PlayStation.

![WCW/nWo Thunder cover art](art/cover.jpg)

## Building

### Prerequisites
The following files need to be present in the **disc** sub-directory:

- **SLUS_007.79** (found in the ISO)
- **WGAME.BIN**
- **WMENU.BIN**

> [!IMPORTANT]
> The **WGAME.BIN** and **WMENU.BIN** files are also found in the ISO, but they need to be decoded first. A tool for decoding these files can be found in the [**tools/rle**](tools/rle) directory.

Then you can run the following Make recipes:

```sh
make setup
make # Does the actual build
make check # Checks the generated binaries have the expected checksums
```

> [!TIP]
> If you are on a non-Linux environment (including macOS), there is a [**Dockerfile**](Dockerfile) that will install the required packages, and can be used to run `make` commands instead.

## Contributing
Contributions are most welcome. Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md)

> [!NOTE]
> There is also an effort to decompile this game’s prequel, _WCW Nitro_, here: https://github.com/martinbean/nitro
