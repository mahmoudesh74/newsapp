import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/cubits/popular_cubit/popular_cubit.dart';
import 'package:project/peresentstion/components/home_screen_card.dart';
import 'package:project/peresentstion/screens/info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Popular list", style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<PopularCubit,PopularState>(
        listener: (context, state) {
state is PopularError?debugPrint("anerror occured"):null;
        },
        builder: (context, state) {
          return state is PopularLoading?Center(
            child: CircularProgressIndicator(color: Colors.green,),

          ):

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: ListView.separated(itemBuilder: (context, i) {
              return InkWell(onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (builder) =>
                    InfoScreen(
                        id:int.parse(PopularCubit.get(context).popularList[i].id.toString()),name:PopularCubit.get(context).popularList[i].name??"")));
              },
                  child: HomeScreenCard(name:PopularCubit.get(context).popularList[i].name??"No name"),
              );
            },
                separatorBuilder: (context, i) {
                  return const SizedBox(height: 15,);
                },
                itemCount: PopularCubit.get(context).popularList.length),
          );
        },
      ),
    );
  }
}
