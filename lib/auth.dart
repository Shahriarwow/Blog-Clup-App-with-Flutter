import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int logintap = 0;
  static const int singuptab = 1;
  int selectedTabindex = logintap;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tableStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32, left: 22, top: 55),
            child: Assets.img.icons.logo.svg(width: 120),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.primaryColor),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabindex = logintap;
                              });
                            },
                            child: Text('login'.toUpperCase(),
                                style: tableStyle.apply(
                                    color: selectedTabindex == logintap
                                        ? Colors.white
                                        : Colors.white54))),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabindex = singuptab;
                            });
                          },
                          child: Text('sing up'.toUpperCase(),
                              style: tableStyle.apply(
                                  color: selectedTabindex == singuptab
                                      ? Colors.white
                                      : Colors.white54)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          color: themeData.colorScheme.surface),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child:selectedTabindex==logintap? _Login(themeData: themeData):_Singup(themeData: themeData),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: themeData.textTheme.headline4,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        TextField(
          decoration: InputDecoration(
              label: Text(
            'Username',
            style: themeData.textTheme.subtitle2,
          )),
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: const Text('Login')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            const SizedBox(
              height: 8,
            ),
            TextButton(onPressed: () {}, child: const Text('Reset here'))
          ],
        ),
        const Center(
          child: Text(
            'Or sign in with',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(),
            const SizedBox(
              width: 8,
            ),
            Assets.img.icons.facebook.image(),
            const SizedBox(
              width: 8,
            ),
            Assets.img.icons.twitter.image(),
            const SizedBox(
              width: 8,
            )
          ],
        )
      ],
    );
  }
}

class _Singup extends StatelessWidget {
  const _Singup({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welckome to Blogclup ',
          style: themeData.textTheme.headline4,
        ),
        Text(
          'Please enter your information',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        TextField(
          decoration: InputDecoration(
              label: Text(
            'Full name',
            style: themeData.textTheme.subtitle2,
          )),
        ),
        TextField(
          decoration: InputDecoration(
              label: Text(
            'Username',
            style: themeData.textTheme.subtitle2,
          )),
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {
           

            },
            child: const Text('Sing up')),
            const SizedBox(height: 8,),
        const Center(
          child: Text(
            'Or sign up with',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(),
            const SizedBox(
              width: 8,
            ),
            Assets.img.icons.facebook.image(),
            const SizedBox(
              width: 8,
            ),
            Assets.img.icons.twitter.image(),
            const SizedBox(
              width: 8,
            )
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          label: Text(
            'Password',
            style: widget.themeData.textTheme.subtitle2,
          ),
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(obscureText ? 'Show' : 'Hide',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                )),
          )),
    );
  }
}
