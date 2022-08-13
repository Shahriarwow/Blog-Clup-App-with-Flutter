import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    final posts = AppDatabase.posts;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: themedata.colorScheme.background.withOpacity(0),
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_rounded),
            ),
            const SizedBox(
              width: 16,
            )
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themedata.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themedata.colorScheme.onBackground
                                .withOpacity(0.2))
                      ]),
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '@joviedan',
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: themedata.textTheme.bodyText1!
                                        .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themedata.textTheme.bodyText1!
                                        .apply(color: themedata.primaryColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About me',
                          style: themedata.textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                            ' Madison Blackstone is a director of user  experience design, with experience managing global teams.',
                            style: themedata.textTheme.bodyText1!
                                .copyWith(fontWeight: FontWeight.w200)),
                      ),
                      const SizedBox(
                        height: 28,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themedata.colorScheme.onBackground
                                .withOpacity(0.2))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: themedata.colorScheme.primary,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff2151CD),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        color: themedata.colorScheme.onPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Post',
                                      style: TextStyle(
                                          color:
                                              themedata.colorScheme.onPrimary,
                                          fontWeight: FontWeight.w200))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: TextStyle(
                                      color: themedata.colorScheme.onPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Following',
                                    style: TextStyle(
                                        color: themedata.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w200))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5K',
                                  style: TextStyle(
                                      color: themedata.colorScheme.onPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Followers',
                                    style: TextStyle(
                                        color: themedata.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w200))
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: themedata.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themedata.textTheme.headline6,
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg()),
                        const Icon(Icons.more_horiz_rounded)
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++)
                    Post(
                      post: posts[i],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
