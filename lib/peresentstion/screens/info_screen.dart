import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/app/app_consts.dart';
import 'package:project/data/cubits/popular_info_cubit/popular_info_cubit.dart';
import 'package:project/peresentstion/screens/image_previewer.dart';

class InfoScreen extends StatefulWidget {
  int id;
  String name;
   InfoScreen({super.key,required this.id,required this.name});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
PopularInfoCubit.get(context).getPopularInfo(id: widget.id);
PopularInfoCubit.get(context).getPopularImage(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularInfoCubit, PopularInfoState>(
  listener: (context, state) {
    state is PopularInfoError?debugPrint("an error occured"):null;
  },
  builder: (context, state) {
    return state is PopularInfoLoading||state is PopularImageLoading?Center(child: CircularProgressIndicator(color: Colors.green,)
      ,):
     Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white,size: 30),
          backgroundColor: Colors.green,
        title:  Center(child: Text("Details about"+" "+PopularInfoCubit.get(context).popularInfoModel.alsoKnownAs![0],style: TextStyle(fontSize: 20,color: Colors.white),)),

    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(

        children: [
          Container(
            height: MediaQuery.of(context).size.height/2-40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50),
              bottomRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text("Birth Day"+PopularInfoCubit.get(context).popularInfoModel.birthday.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text("Place of borth"+PopularInfoCubit.get(context).popularInfoModel.placeOfBirth.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
            ),
          ),
          SizedBox(
            height:MediaQuery.of(context).size.height/2-40 ,
            child: ListView.separated(itemBuilder: (context,i){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>ImagePreviewer(
                    height:PopularInfoCubit.get(context).imageModel.profiles![i].height??100 ,
                  width:PopularInfoCubit.get(context).imageModel.profiles![i].width??100  ,
                  path:PopularInfoCubit.get(context).imageModel.profiles![i].filePath??""  ,
                  )));
                },
                  child: Image.network(AppConsts.imageBaseUrl+PopularInfoCubit.get(context).imageModel.profiles![i].filePath!,height: 200,width: 200,));
            },
                separatorBuilder: (context,i){
              return SizedBox(height: 15,);
                },
                itemCount: PopularInfoCubit.get(context).imageModel.profiles!.length),
          )
        ],
      ),
    ),
    );
  },
);
  }
}
