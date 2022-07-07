import 'package:employes_data/bloc/user_bloc.dart';
import 'package:employes_data/service/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  int index;
  DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<DioService>(context))..init(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadedState) {
              print(state.usermodels.length);
              final data = state.usermodels[widget.index];
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 55),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(data!.profleImage),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 67, 143, 70)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RowData(txt: "User name", txt1: data.username),
                    RowData(txt: "Email", txt1: data.email),
                    RowData(txt: "Phone", txt1: data.phone),
                    RowData(txt: "Website", txt1: data.website),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 3, top: 12, bottom: 12),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address  : ",
                                    style: _style,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${data.address.street},",
                                            style: _style,
                                          ),
                                          Text(
                                            "${data.address.suite},",
                                            style: _style,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${data.address.city},",
                                        style: _style,
                                      ),
                                      Text(
                                        "Zip Code-${data.address.zipcode}",
                                        style: _style,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 3, top: 5, bottom: 0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Comapny Details  : ",
                                    style: _style,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : ${data.company.name},",
                                        style: _style,
                                      ),
                                      Row(
                                        children: [
                                          Text("Catchhrase : ", style: _style),
                                          Text(
                                            "${data.company.catchPhrase}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Bs : ${data.company.bs},",
                                        style: _style,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  String txt;
  String txt1;

  RowData({Key? key, required this.txt, required this.txt1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 3, top: 12, bottom: 12),
      child: Row(
        children: [
          Text(
            txt,
            style: _style,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            ":",
            style: _style,
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            txt1,
            textAlign: TextAlign.start,
            style: _style,
          ),
        ],
      ),
    );
  }
}

TextStyle _style = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
