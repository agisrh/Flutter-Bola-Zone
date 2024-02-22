import 'dart:io';
import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/routes/router.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TeamTab extends StatefulWidget {
  const TeamTab({super.key});

  @override
  State<TeamTab> createState() => _TeamTabState();
}

class _TeamTabState extends State<TeamTab> {
  String _selectedId = "";
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedId != ""
          ? Container(
              margin: EdgeInsets.only(bottom: Platform.isAndroid ? 50 : 100),
              child: FloatingActionButton(
                onPressed: () {
                  context.goNamed(
                    'teams',
                    pathParameters: {"id": _selectedId},
                  );
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            )
          : null,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<TeamBloc, TeamState>(
          builder: (context, state) {
            if (state is TeamLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TeamSuccess) {
              return CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 450.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                ),
                items: state.teams.map((team) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedId == team.teamId) {
                              _selectedId = "";
                            } else {
                              _selectedId = team.teamId!;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: _selectedId == team.teamId
                                ? Border.all(
                                    color: AppsTheme.color.primaryBlue,
                                    width: 3)
                                : null,
                            boxShadow: _selectedId == team.teamId
                                ? [
                                    BoxShadow(
                                      color: Colors.blue.shade100,
                                      blurRadius: 30,
                                      offset: const Offset(0, 10),
                                    )
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: const Offset(0, 5),
                                    )
                                  ],
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.only(top: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ShimmerImage(
                                      team.teamLogo,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  20.height,
                                  Text(
                                    team.teamName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  8.height,
                                  Text(
                                    team.teamVenue,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
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
                }).toList(),
              );
            }
            return const Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}
