# Kunstmaan I18n-Swift-Example

Example ios project showing how to use:

* [KunstmaanI18nSwift](https://github.com/Kunstmaan/i18n-swift) Swift library to translate your IOS application on the fly 
* [kuma-i18n-strings](https://github.com/Kunstmaan/i18n-strings) npm package to keep your translations in sync with an online datastore

Translations are managed in a [google spreadsheet](https://docs.google.com/spreadsheets/d/1i4U1XCXdTnxSMaB1SPtOWT68RryGgW6bpprFk3Q42Q0/edit?usp=sharing)

## Installation

Clone this project to your computer and then execute following commands:

```bash
$ pod install
$ npm install
```

## Features

- [x] UIViews are translated via the Interface builder
- [x] On the fly update of UIViews when the language changes
- [x] Debug builds of the project will also collect all untranslated keys and add them to the Localizable.strings file
- [x] Production build of the project will fail when new translations are available or when untranslated keys are found
