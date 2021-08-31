import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/bloc/home_bloc.dart';
import 'package:sample_app/models/Response.dart';
import 'package:sample_app/utitlities/ShimmerEffect.dart';
import 'package:sample_app/utitlities/class_media_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController _controller = CarouselController();
  HomeBloc request = HomeBloc();

  @override
  Widget build(BuildContext context) {
    request.getAllImage(context, 60);
    return Scaffold(
      body: StreamBuilder(
        stream: request.streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.hasData) {
            return root(snapshot.requireData);
          } else {
            return Container(child: ShimmerEffect());
          }
        },
      ),
    );
  }

  Widget root(Response data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: ClassMediaQuery.notchHeight,),
          carouselView(data),
          SizedBox(
            height: 40,
          ),
          imgShowInGrid(data.images)
        ],
      ),
    );
  }

  Widget carouselView(Response data) {
    return Container(
      height: 250,
      child: CarouselSlider(
        carouselController: _controller,
        items: listCarousel(data),
        //Slider Container properties
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 250,
        ),
      ),
    );
  }

  Widget imgShowInGrid(List<String> listOfImage) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: listOfImage.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            left: ClassMediaQuery.blockSizeHorizontal * 5,
            right: ClassMediaQuery.blockSizeHorizontal * 5,
            bottom: ClassMediaQuery.blockSizeHorizontal * 5,
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  listOfImage[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> listCarousel(Response events) {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(carousel(events.images[i]));
    }
    return list;
  }

  Widget carousel(String image) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
