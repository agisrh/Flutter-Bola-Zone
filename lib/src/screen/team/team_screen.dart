import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/screen/team/expand_text.dart';
import 'package:bola_zone/src/screen/team/team_widget.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';

class TeamScreen extends StatelessWidget {
  final String teamId;
  const TeamScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    final TeamBloc teamBloc = TeamBloc();
    final PlayerBloc playerBloc = PlayerBloc();
    teamBloc.add(GetTeamProfile(teamId: teamId));
    playerBloc.add(GetPlayers(teamId: teamId));

    return Scaffold(
      body: BlocBuilder<TeamBloc, TeamState>(
        bloc: teamBloc,
        builder: (context, state) {
          if (state is TeamProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TeamProfileSuccess) {
            return Stack(
              children: <Widget>[
                CardSliverAppBar(
                  height: 300,
                  background: Image.asset("assets/images/stadium.jpg",
                      fit: BoxFit.cover),
                  title: Text(
                    state.team.teamName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  titleDescription: Text(
                    state.team.teamVenue,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                  card: NetworkImage(state.team.teamLogo),
                  backButton: true,
                  backButtonColors: const [Colors.white, Colors.black],
                  body: Container(
                    alignment: Alignment.topLeft,
                    color: AppsTheme.color.neutral.shade300,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              roundedMenu(
                                const Icon(Icons.calendar_month_outlined),
                                const Text(
                                  "Match",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              roundedMenu(
                                const Icon(Icons.bar_chart),
                                const Text(
                                  "Statistics",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              roundedMenu(
                                const Icon(Icons.people),
                                const Text(
                                  "Players",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statistic(text: 'Play : ${state.team.gamePlay}'),
                              statistic(text: 'Win : ${state.team.gameWin}'),
                              statistic(text: 'Draw : ${state.team.gameDraw}'),
                              statistic(text: 'Lose : ${state.team.gameLose}'),
                            ],
                          ),
                        ),
                        Container(
                          //height: 65,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: ExpandableText(
                            text: state.team.description ?? "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // BlocBuilder<PlayerBloc, PlayerState>(
                //   bloc: playerBloc,
                //   builder: (context, state) {
                //     if (state is PlayerSuccess) {
                //       List<PlayerModel> playerData =
                //           state.players.getRange(0, 6).toList(); //
                //       return Positioned(
                //         bottom: 20.0,
                //         child: Container(
                //           //color: Colors.white,
                //           padding: const EdgeInsets.symmetric(vertical: 24.0),
                //           height: 170,
                //           width: context.screenWidth,
                //           child: ListView.builder(
                //             scrollDirection: Axis.horizontal,
                //             itemCount: playerData.length,
                //             itemBuilder: (context, i) {
                //               int last = playerData.length - 1;
                //               if (i == last) {
                //                 return Center(
                //                   child: GestureDetector(
                //                     onTap: () {},
                //                     child: Container(
                //                       margin:
                //                           const EdgeInsets.only(right: 20.0),
                //                       child: CircleAvatar(
                //                         radius: 30,
                //                         backgroundColor: AppsTheme
                //                             .color.primaryGreen.shade200,
                //                         child: Icon(
                //                           Icons.arrow_forward_ios,
                //                           color: AppsTheme.color.primaryGreen,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               } else {
                //                 return GestureDetector(
                //                   onTap: () {},
                //                   child: Container(
                //                     margin: EdgeInsets.only(
                //                       left: i == 0 ? 15 : 0,
                //                       right: 15,
                //                     ),
                //                     width: 300,
                //                     child: playerCard(player: state.players[i]),
                //                   ),
                //                 );
                //               }
                //             },
                //           ),
                //         ),
                //       );
                //     }
                //     return Container();
                //   },
                // ),
              ],
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
