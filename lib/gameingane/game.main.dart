import 'package:flutter/material.dart';
import 'package:ludo/conf/multiornot.dart';
import 'package:ludo/gameingane/ludo_provider.dart';
import 'package:ludo/gameingane/main_screen.dart';
import 'package:ludo/gameingane/providers/two_player.provider.dart';
import 'package:ludo/twoplayer/main.two.dart';
import 'package:provider/provider.dart';
class GameEngineMain extends StatefulWidget {
  const GameEngineMain({super.key});

  @override
  State<GameEngineMain> createState() => _GameEngineMainState();
}

class _GameEngineMainState extends State<GameEngineMain> {
   @override
  void initState() {

    super.initState();PlayerChose.player = true;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const ClassForProvider(),
  );
  }
}

class ClassForProvider extends StatefulWidget {
  const ClassForProvider({super.key});

  @override
  State<ClassForProvider> createState() => _ClassForProviderState();
}

class _ClassForProviderState extends State<ClassForProvider> {
  
  @override
  Widget build(BuildContext context) {
     precacheImage(const AssetImage("assets/images/thankyou.gif"), context);
    precacheImage(const AssetImage("assets/images/board.png"), context);
    precacheImage(const AssetImage("assets/images/dice/1.png"), context);
    precacheImage(const AssetImage("assets/images/dice/2.png"), context);
    precacheImage(const AssetImage("assets/images/dice/3.png"), context);
    precacheImage(const AssetImage("assets/images/dice/4.png"), context);
    precacheImage(const AssetImage("assets/images/dice/5.png"), context);
    precacheImage(const AssetImage("assets/images/dice/6.png"), context);
    precacheImage(const AssetImage("assets/images/dice/draw.gif"), context);
    precacheImage(const AssetImage("assets/images/crown/1st.png"), context);
    precacheImage(const AssetImage("assets/images/crown/2nd.png"), context);
    precacheImage(const AssetImage("assets/images/crown/3rd.png"), context);
    return const LudoGameEngineMainScreen();
  }
}

class GameEngineMain2 extends StatefulWidget {
  const GameEngineMain2({super.key});

  @override
  State<GameEngineMain2> createState() => _GameEngineMain2State();
}

class _GameEngineMain2State extends State<GameEngineMain2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();PlayerChose.player = false;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const ClassForProvider(),
  );
  }
}

class ClassForProvider2 extends StatefulWidget {
  const ClassForProvider2({super.key});

  @override
  State<ClassForProvider2> createState() => _ClassForProvider2State();
}

class _ClassForProvider2State extends State<ClassForProvider2> {
   @override
  void initState() {
    ///Initialize images and precache it
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     precacheImage(const AssetImage("assets/images/thankyou.gif"), context);
    precacheImage(const AssetImage("assets/images/board.png"), context);
    precacheImage(const AssetImage("assets/images/dice/1.png"), context);
    precacheImage(const AssetImage("assets/images/dice/2.png"), context);
    precacheImage(const AssetImage("assets/images/dice/3.png"), context);
    precacheImage(const AssetImage("assets/images/dice/4.png"), context);
    precacheImage(const AssetImage("assets/images/dice/5.png"), context);
    precacheImage(const AssetImage("assets/images/dice/6.png"), context);
    precacheImage(const AssetImage("assets/images/dice/draw.gif"), context);
    precacheImage(const AssetImage("assets/images/crown/1st.png"), context);
    precacheImage(const AssetImage("assets/images/crown/2nd.png"), context);
    precacheImage(const AssetImage("assets/images/crown/3rd.png"), context);
    return const Ludo2GameEngineMainScreen();
  }
}