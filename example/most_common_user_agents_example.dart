import 'package:most_common_user_agents/most_common_user_agents.dart';

void main() async {
  final mobile = await UserAgents.mostCommonMobile;
  print(mobile);

  final desktop = await UserAgents.mostCommonDesktop;
  print(desktop);
}
