import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:koality_chat/theme.dart';
import 'package:koality_chat/widgets/avatar.dart';

import '../helpers.dart';
import '../models/story_data.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Text('Test');
          }),
        )
      ],
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
            child: Text(
              'Stories',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: AppColors.textFaded),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final faker = Faker();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: _StoryCard(
                        storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl(),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 11, letterSpacing: 0.3, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}