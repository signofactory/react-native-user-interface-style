# React Native User Interface Style
React Native User Interface Style ("RNUIS") is a React Native package to override userInterfaceStyle on iOS 13.0+. It extends react native’s built-in Appearance API by providing a way for users to override the app’s color scheme on **iOS only**.

The package implements Apple's UIVIEW `overrideUserInterfaceStyle` property to override the app's color scheme (light / dark).

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
  UserInterfaceStyle.setStyle(style
};
```

### Reading the current User Interface Style value
Because we are changing the user’s preferred interface appearance direcly from the native code, you can retrieve the current User Interface Style using the [`Appearance`](https://reactnative.dev/docs/appearance) API or the [`useColorScheme`](https://reactnative.dev/docs/usecolorscheme) hook from React Native. See below an example that uses Functional Components from their documentation:
```javascript
import { Text, useColorScheme } from 'react-native';

const MyComponent = () => {
  const colorScheme = useColorScheme();
  return <Text>useColorScheme(): {colorScheme}</Text>;
};
```

## Example
Below you can find an example (adapted [from Expo](https://docs.expo.io/versions/latest/sdk/appearance/)) of a simple application using `setStyle` from RNUIS and `useColorScheme` from RN to change the and read the appearance of the system:
```javascript
import React from 'react';
import { Text, SafeAreaView, StatusBar, StyleSheet, getColorScheme } from 'react-native';
import UserInterfaceStyle from "react-native-user-interface-style";

function App() {
  const scheme = useColorScheme();

  const themeStatusBarStyle = scheme === 'light' ? 'dark-content' : 'light-content';
  const themeTextStyle = scheme === 'light' ? styles.lightThemeText : styles.darkThemeText;
  const themeContainerStyle =
    scheme === 'light' ? styles.lightContainer : styles.darkContainer;

  return (
    <SafeAreaView style={[styles.container, themeContainerStyle]}>
      <StatusBar barStyle={themeStatusBarStyle} />
      <Text style={[styles.text, themeTextStyle]}>Color scheme: {scheme}</Text>
      <Button onPress={() => {UserInterfaceStyle.setStyle('unspecified')}}>System</Button>
      <Button onPress={() => {UserInterfaceStyle.setStyle('light')}>Light</Button>
      <Button onPress={() => {UserInterfaceStyle.setStyle('dark')}>Dark</Button>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  lightContainer: {
    backgroundColor: '#D0D0C0',
  },
  darkContainer: {
    backgroundColor: '#242C40',
  },
  lightThemeText: {
    color: '#242C40',
  },
  darkThemeText: {
    color: '#D0D0C0',
  },
});
```
