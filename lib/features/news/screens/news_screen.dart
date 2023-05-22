import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/data/assets_constant.dart';
import 'package:news/features/news/bloc/news_bloc.dart';

import 'package:news/features/news/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AssetsConstants.nyTimeLogo,
          semanticsLabel: 'NewYorkTimes Logo',
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => NewsBloc()..add(NewsFetched()),
          child: const NewsList(),
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          switch (state.status) {
            case NewsStatus.initial:
              return const SizedBox();
            case NewsStatus.loading:
              return const CircularProgressIndicator();
            case NewsStatus.success:
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NewsBloc>().add(NewsFetched());
                },
                child: ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    return NewsCard(
                      news: state.news[index],
                    );
                  },
                ),
              );
            case NewsStatus.failure:
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        context.read<NewsBloc>().add(NewsFetched());
                      },
                      child: const Text("Download News")),
                ],
              );
          }
        },
      ),
    );
  }
}
