import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
          width: 111,
          
          height: 48,
          decoration: BoxDecoration(
              color: themedata.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: themedata.colorScheme.primary.withOpacity(0.5))
              ]),
          child: InkWell(
            onTap: () {
              showsnackBar(context, 'Liked');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.vector.svg(),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '2.1k',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: themedata.colorScheme.onPrimary),
                ),
              ],
            ),
          )),
      backgroundColor: themedata.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'Four Things Every Woman Needs To Know',
                      style: themedata.textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        Assets.img.stories.placeholder.image(fit: BoxFit.cover),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themedata.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text('2m ago ')
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showsnackBar(context, 'Bookmarked');
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themedata.colorScheme.primary,
                            )),
                        IconButton(
                            onPressed: () {
                              showsnackBar(context, 'Shaired');
                            },
                            icon: Icon(CupertinoIcons.share,
                                color: themedata.colorScheme.primary))
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.img.background.singlePost.image()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      'A man’s sexuality is never your mind responsibility.',
                      style: themedata.textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 110),
                    child: Text(
                      'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                      style: themedata.textTheme.bodyText2,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [themedata.colorScheme.surface,
                              themedata.colorScheme.surface.withOpacity(0)],
                      ),
                      
                      ),
            ),
          ),
        ],
      ),
    );
  }

  void showsnackBar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
