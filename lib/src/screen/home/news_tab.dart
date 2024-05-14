import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/screen/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:bola_zone/src/theme/widgets/widgets.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'News',
        centerTitle: true,
        textColor: AppsTheme.color.neutral.shade100,
        color: AppsTheme.color.primaryGreen,
      ),
      backgroundColor: AppsTheme.color.neutral.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsError) {
                  return const Center(
                    child: ErrorScreen(),
                  );
                }
                if (state is NewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is NewsSuccess) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 20.height,
                      itemCount: state.news.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: 5.w),
                      itemBuilder: (context, index) {
                        NewsModel data = state.news[index];
                        return Container(
                            margin: EdgeInsets.only(top: index == 0 ? 20 : 0),
                            child: NewsCard(news: data));
                      },
                    ),
                  );
                }
                return const Center(
                  child: Text('No Data'),
                );
              },
            ),
          ),
          100.height,
        ],
      ),
    );
  }
}
