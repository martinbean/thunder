# Contributing guidelines
Contributions are most welcome.

Create a PR with the function(s) you wish to contribute matching C code for. A GitHub Actions workflow will build the project. If the build produces a matching executable, then it can be merged.

## Coding conventions and style guide
Some conventions I’ve stuck to:

* Using snake_case for function names, i.e. `decode_data` instead of `DecodeData`. This helps distinguish game functions from PsyQ library functions, which do use PascalCase (i.e. `GsInitGraph`).
* Use tabs for indentation. It occupies one character, and users can choose how many spaces that maps to in their text editor/IDE.

However, if someone has a strong argument for a change to the above then I’m happy to hear it, as I do not program in C day to day.
