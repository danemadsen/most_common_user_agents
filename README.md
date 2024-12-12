A package for fetching the most common user agents

## Features

Fetch the most common user agents for mobile and desktop devices.

## Usage

A simple usage example:

```dart
import 'package:most_common_user_agents/most_common_user_agents.dart';

void main() async {
  final mobile = await UserAgents.mostCommonMobile;
  print(mobile);

  final desktop = await UserAgents.mostCommonDesktop;
  print(desktop);
}
```
