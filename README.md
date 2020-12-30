# React Native User Interface Style
React Native User Interface Style ("RNUIS") is a React Native package to override userInterfaceStyle on iOS 13.0+. It extends react native’s built-in Appearance API by providing a way for users to override the app’s color scheme on **iOS only**.

The package implements Apple's UIView `overrideUserInterfaceStyle` property to override the app's color scheme (light / dark / unspecified).

<a href="https://buymeacoffee.com/signofactory" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## Getting started
1. Install the library using either Yarn:

```
yarn add react-native-user-interface-style
```
or npm:
```
npm install --save react-native-user-interface-style
```

2. Install to Xcode:

```
npx pod-install
```
Or, if you already have installed [Cocoapods](https://cocoapods.org/) on your system:
```
cd ios && pod install
```

3. Include the library in your code:

```javascript
import UserInterfaceStyle from "react-native-user-interface-style";
```

4. Compile and have fun!

## Properties
- `style` (String)
  - `unspecified` - system (light/dark) appearance
  - `light` - light mode
  - `dark` - dark mode

## Usage
### Overriding the app's appearance User Interface Style value
You can use the `setStyle` method from UserInterfaceStyle to override the current appearance of the app:
```javascript
import UserInterfaceStyle from 'react-native';

const setUserInferfaceStyle = (style) => {
  UserInterfaceStyle.setStyle(style)
};
```

## Example
Below you can find an example of a simple application using `setStyle` from RNUIS and `useColorScheme` from RN to change the and read the appearance of the system:
```javascript
import React from 'react';
import { Text, SafeAreaView, Button, StyleSheet, PlatformColor } from 'react-native';
import UserInterfaceStyle from "react-native-user-interface-style";

function App() {
  // Sets the User Interface Style
  const setUserInferfaceStyle = (style) => {
    UserInterfaceStyle.setStyle(style)
  };
  
  return (
    <SafeAreaView style={[styles.container, {backgroundColor: PlatformColor('systemBackground')}]}>
      <Text style={[styles.text, {color: PlatformColor('label')}]}>Color scheme: {scheme}</Text>
      <Button onPress={() => setUserInferfaceStyle('unspecified')}>System</Button>
      <Button onPress={() => setUserInferfaceStyle('light')}>Light</Button>
      <Button onPress={() => setUserInferfaceStyle('dark')}>Dark</Button>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```
