import 'package:eco_web_mobx/app/shared/auth/auth_controller.dart';
import 'package:eco_web_mobx/app/shared/widgets/opslist/components/circularprogress/circularprogress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_){
      final auth = Modular.get<AuthController>();
      if(auth.status == AuthStatus.login){
        Modular.to.pushReplacementNamed("/home");
      }else if(auth.status == AuthStatus.logoff){
        Modular.to.pushReplacementNamed("/login");
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
