import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/screen/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:bola_zone/src/theme/widgets/widgets.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Matches',
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
          if (state is MatchError) {
            return const Center(
              child: ErrorScreen(),
            );
          }
          if (state is MatchSuccess) {
            return ListView.separated(
              separatorBuilder: (context, index) => 15.height,
              itemCount: state.matches.length,
              itemBuilder: (context, index) {
                MatchModel nextMatch = state.matches[index];
                if (nextMatch.homeClub != null) {
                  return Column(
                    children: [
                      NextMatchCard(
                        match: nextMatch,
                        showScore: true,
                      ),
                      if (index == state.matches.length - 1)
                        const SizedBox(height: 80),
                    ],
                  );
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
      floatingActionButton: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _iconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppsTheme.color.primaryGreen,
                ),
                onTap: () {
                  if (state.counter > 1) {
                    BlocProvider.of<CounterBloc>(context).add(Decrement());
                    BlocProvider.of<MatchBloc>(context).add(
                      GetMatches(
                          gameweek: state.counter < 10
                              ? '0${state.counter + 1}'
                              : '${state.counter + 1}'),
                    );
                  }
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: AppsTheme.color.primaryGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Gameweek ${state.counter.toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              _iconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppsTheme.color.primaryGreen,
                ),
                onTap: () {
                  BlocProvider.of<CounterBloc>(context).add(Increment());
                  BlocProvider.of<MatchBloc>(context).add(
                    GetMatches(
                        gameweek: state.counter < 10
                            ? '0${state.counter + 1}'
                            : '${state.counter + 1}'),
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _iconButton({required Widget icon, required VoidCallback onTap}) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppsTheme.color.neutral.shade100,
          border: Border.all(color: AppsTheme.color.primaryGreen, width: 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppsTheme.color.primaryGreen.shade200,
              blurRadius: 8,
            )
          ],
        ),
        child: icon,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
