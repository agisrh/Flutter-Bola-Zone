import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:bola_zone/src/theme/widgets/widgets.dart';

class NextMatchScreen extends StatelessWidget {
  const NextMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchBloc nextMatchBloc = MatchBloc();
    nextMatchBloc.add(GetNextMatches());

    return Scaffold(
      appBar: AppsBar(
        text: 'Upcoming Match',
        textColor: AppsTheme.color.neutral.shade100,
        color: AppsTheme.color.primaryGreen,
      ),
      backgroundColor: AppsTheme.color.neutral.shade300,
      body: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          if (state is MatchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MatchSuccess) {
            return ListView.separated(
              separatorBuilder: (context, index) => 15.height,
              itemCount: state.matches.length,
              itemBuilder: (context, index) {
                MatchModel nextMatch = state.matches[index];
                if (nextMatch.homeClub != null) {
                  return NextMatchCard(match: nextMatch);
                } else {
                  return Container(
                    padding: const EdgeInsets.only(left: 15.0, top: 30.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppsTheme.color.neutral.shade500,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          nextMatch.date ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppsTheme.color.neutral.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
