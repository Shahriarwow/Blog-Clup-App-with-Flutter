import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/article.dart';
import 'package:flutter_application_1/carousel/carousel_slider.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/gen/fonts.gen.dart';

class HomeScareen extends StatelessWidget {
  const HomeScareen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hi, Shahriar!', style: themeData.textTheme.subtitle1),
                Assets.img.icons.notification.image(width: 32,height: 32)
                
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child:
                    Text('Explor today', style: themeData.textTheme.headline4),
              ),
              _StoryList(stories: stories),
              const SizedBox(
                height: 8,
              ),
            
              const _CategoryList(),
              const _PostList(),
              const SizedBox(
                height: 8,
              ),
             
            ],
            
          ),
          
        ),
        
        
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;

    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            disableCenter: true,
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            left: 65,
            right: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xff0D253C)),
              ]),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover,
                  )),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253C),
                    Colors.transparent,
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(32)),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 42,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 2, 32, 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Stack(
              children: [
                story.isViewed
                    ? _profileImageViewed(context)
                    : _profileImageNormal(),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/img/icons/${story.iconFileName}',
                      height: 24,
                      width: 24,
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(story.name),
      ],
    );
  }

  Container _profileImageNormal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(6),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        radius: Radius.circular(24),
        dashPattern: [5, 3],
        padding: const EdgeInsets.all(7),
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: const Color(0xaa7B8BB2),
        child: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'More',
                    style: TextStyle(color: Color(0xff376AED)),
                  )),
            ],
          ),
        ),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Post(post: post);
            }),
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ArticleScreen() )) ,
      child: Container(
        height: 149,
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Color(0x1a5282ff),
              )
            ]),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    Image.asset('assets/img/posts/small/${post.imageFileName}')),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      post.caption,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.avenir,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff376AED)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.hand_thumbsup,
                            size: 16,
                            color: Theme.of(context).textTheme.bodyText2!.color),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(CupertinoIcons.clock,
                            size: 16,
                            color: Theme.of(context).textTheme.bodyText2!.color),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                                post.isBookmarked
                                    ? CupertinoIcons.bookmark_fill
                                    : CupertinoIcons.bookmark,
                                size: 16,
                                color:
                                    Theme.of(context).textTheme.bodyText2!.color),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9b8487).withOpacity(0.3)),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButomNavigationIthem(
                    iconFileName: 'Home.png',
                    activeIconeFileName: 'Home.png',
                    title: 'Home',
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'Articles.png',
                    activeIconeFileName: 'Articles.png',
                    title: 'Article',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'Search.png',
                    activeIconeFileName: 'Search.png',
                    title: 'Search',
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'Menu.png',
                    activeIconeFileName: 'Menu.png',
                    title: 'Menu',
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButomNavigationIthem extends StatelessWidget {
  final String iconFileName;
  final String activeIconeFileName;
  final String title;

  const ButomNavigationIthem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconeFileName,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/${iconFileName}'),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
