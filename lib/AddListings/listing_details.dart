import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:realestapp/Models/AllListings/images.dart';
import '../Utils/color_scheme.dart';

class ListingDetails extends StatefulWidget {
  final String street, price,description;
  final List<ImageModel> image;

  const ListingDetails(
      {Key? key,
      required this.street,
      required this.price,
      required this.image, required this.description})
      : super(key: key);

  @override
  State<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  List<Widget> images = [];
  @override
  void initState() {
    for (int i = 0; i < widget.image.length; i++) {
      images.add(Image.network(
        widget.image[i].url,
        fit: BoxFit.cover,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.street,
          style: const TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: lightGreen,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_horiz,
              color: lightGreen,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: lightGreen,
              indicatorBackgroundColor: mediumGrey,
              children: images,
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.street,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    widget.description,
                    style: const TextStyle(
                      color: mediumGrey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Location',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/map.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Extra Info',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  extraInfo('Bath', '1ba'),
                  extraInfo('Rent or Buy', 'Rent'),
                  extraInfo('Bedrooms', '1bd'),
                  extraInfo('Close to Public', 'Yes'),
                  extraInfo('New Construction', 'No'),
                  extraInfo('Year Built', '2000'),
                  extraInfo('Square Feet', '100ft - 500ft'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: ((context, index) => review(
                            '1',
                            'Frank',
                            '12/03/2021',
                            'A very good propery I have found A very good propery I have found'))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  extraInfo(title, value) {
    return Padding(
      padding: const EdgeInsets.only(right: 60.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkGrey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: mediumGrey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  review(image, name, date, reviewText) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: mediumGrey),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/$image.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, color: darkGrey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      date,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 14,
                          color: mediumGrey,
                          overflow: TextOverflow.clip),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  itemSize: 25,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: lightGreen,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Text(
              reviewText,
              style: const TextStyle(fontSize: 16, color: darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
