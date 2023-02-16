import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/home_layout/home_layout_screen.dart';
import '../../shared/component/component.dart';
import '../../shared/network/local/cach_helper.dart';
import '../../shared/style/color/color.dart';


class BoardingModel
{
  final String image;
 final String title;


 BoardingModel({
   required this.image,
   required this.title,
});

}
List<BoardingModel> boarding = [
  BoardingModel(
      image:'assets/image/book.jpg' ,
      title: 'Writing content and ads',

  ),
  BoardingModel(
      image:'assets/image/graphic.jpg' ,
      title: 'Graphic designs',

  ),
  BoardingModel(
      image:'assets/image/web.jpg' ,
      title: 'Developing corporate websites and setting up electronic stores',

  ),
  BoardingModel(
      image:'assets/image/media.jpg' ,
      title: 'Managing social media pages',

  ),
];
bool isLast = false;





var boarderController =PageController();
class OnBoardingScreen extends StatefulWidget {


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mazid App',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(

              onPressed: ()
              {
                navigateAndFinish(context, HomeScreen());

              },
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 20.0,

                ),
              ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boarderController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder:(context,index) => buildPageItem(boarding[index]),
                itemCount: boarding.length,
                physics:BouncingScrollPhysics(),

              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [

                SmoothPageIndicator(


                  controller: boarderController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: defaultColor,
                    expansionFactor: 4,
                    spacing: 0.5,
                  ),
                  count: 4,
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast)
                      {
                        navigateAndFinish(context, HomeScreen());
                      }else
                      {
                        boarderController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }

                    },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ) ,

    );
  }
}



Widget buildPageItem(BoardingModel model)
{
 return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ),
  );
}