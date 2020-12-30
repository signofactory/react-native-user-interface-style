import { NativeModules } from 'react-native';

class UserInterfaceStyle {
  static setStyle = (style: 'dark' | 'light' | 'unspecified') => {
    NativeModules.UserInterfaceStyle.setStyle(style);
  };
}

export default UserInterfaceStyle;
