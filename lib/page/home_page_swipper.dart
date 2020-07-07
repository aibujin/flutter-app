import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePageWsipper extends StatelessWidget {
  final List picture;
  const HomePageWsipper({Key key,this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
      height: 188.0,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        itemCount: picture.length,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.blue,
            size: 8.0,
            activeSize: 10.0,
            activeColor: Colors.white
          )
        ),
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Image.network("${picture[index]['image']}",fit:BoxFit.fill);
        },
      )
    );
  }
}