import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcodeapp/bloc/home/home_bloc.dart';
import 'package:qrcodeapp/bloc/home/home_event.dart';
import 'package:qrcodeapp/bloc/home/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
                child: Column(
              children: [
                Icon(
                  Icons.qr_code_rounded,
                  size: 100,
                ),
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator()
              ],
            ));
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (state is UserProfileLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('./lib/assets/person.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.name,
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(state.job),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.05,
                              left: size.width * 0.12),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.info_outline)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.settings)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
