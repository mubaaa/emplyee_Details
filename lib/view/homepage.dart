import 'package:employes_data/bloc/user_bloc.dart';
import 'package:employes_data/model/model.dart';
import 'package:employes_data/service/dio_service.dart';
import 'package:employes_data/view/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Company company = Company(
    namee: "nill",
    bs: "nill",
    catchPhrase: "nill",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<DioService>(context))..init(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadedState) {
              print(' length ::: ${state.usermodels.length}');
              return Center(
                  child: ListView.builder(
                      itemCount: state.usermodels.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailPage(
                                      index: index,
                                    ),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                  state.usermodels[index]!.profleImage),
                              radius: 25,
                            ),
                            title: Text(
                              state.usermodels[index]!.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                                "Company : ${state.usermodels[index]!.company == null ? company.namee : state.usermodels[index]!.company.name}"));
                      }));
            }
            if (state is UserLoadingState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

// import 'package:sample_project/service/dio_service.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
 


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ValueListenableBuilder(
//           valueListenable: dbBox.listenable(),
//           builder: (
//             context,
//             Box<List> box,
//             Widget? child,
//           ) {
//             final data = box.get("list");
//             if (data != null) {
//               return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                         // backgroundImage: NetworkImage(data[index].profileImage),
//                         // radius: 25,
//                         ),
//                     title: Text(
//                       data[index].name,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(data[index].company.name),
//                   );
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }

























