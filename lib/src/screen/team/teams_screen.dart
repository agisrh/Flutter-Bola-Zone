import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:bola_zone/src/theme/widgets/widgets.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Club',
        textColor: AppsTheme.color.neutral.shade100,
        color: AppsTheme.color.primaryGreen,
      ),
      backgroundColor: AppsTheme.color.neutral.shade300,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<TeamBloc, TeamState>(
            builder: (context, state) {
              if (state is TeamLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TeamSuccess) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: state.teams.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    TeamModel team = state.teams[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppsTheme.color.neutral.shade100,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(138, 149, 158, 0.2),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.network(team.teamLogo, height: 70),
                                SizedBox(height: 5.h),
                                Text(
                                  team.teamName,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: Text('No Data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
