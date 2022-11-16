import 'package:flutter/material.dart';

//Change Color Scheem As required in this file
// const kGreen = Color.fromARGB(255, 62, 173, 0);
const kGreen = Color.fromARGB(255, 188, 144, 44);
const kBlueColor = Colors.blue;
const kBlueAccesentColor = Colors.blueAccent;
const kLightBlackColor = Colors.black38;
const kRedColor = Colors.red;
const kBlackColor = Colors.black;
const kGreyColor = Colors.grey;
const kLightGreyColor = Color.fromARGB(255, 224, 224, 224);
const kGreenAccentColor = Color.fromARGB(255, 188, 144, 44);
// const kGreenColor = Colors.green;
const kAmberColor = Colors.amber;
const kTransparent = Colors.transparent;
const kWhite = Colors.white;
const kDarkGrey = Color.fromARGB(255, 34, 34, 34);
const kPinkColor = Colors.pink;
const kLightPink = Color.fromARGB(255, 244, 143, 177);
const kMediumDarkGrey = Color.fromARGB(255, 77, 76, 76);
const kMediumGrey = Color.fromARGB(255, 103, 101, 101);
const kLightGrey = Color.fromARGB(255, 206, 205, 205);
const kDarkBlue = Color.fromARGB(255, 1, 29, 52);
const kMediumBlue = Color.fromARGB(255, 19, 102, 170);
const kBrightRed = Color.fromARGB(255, 244, 31, 15);

//asset constents
String appName = 'Gharounda';
const currency = 'PKR';
const profiePicute = 'assets/images/1.png';
const logo = 'assets/images/logo4.png';

//Api Key
const apiKey = '00442860-6506-4d01-9ab5-1f4d2267b0e0';
//API URLS
const baseUrl = 'https://gharounda.pk/wp-json/rtcl/v1/';
const loginUrl = baseUrl + 'login';
const signupUrl = baseUrl + 'signup';
const socialLoginUrl = baseUrl + 'social-login';
//category urls
const categoriesUrl = baseUrl + 'categories';
const subCategoriesUrl = baseUrl + 'categories?parent_id=';
//listing urls
const listingConfigUrl = baseUrl + 'listing/form?category_id=';
const listingUrl = baseUrl + 'listings/';
const myListingUrl = baseUrl + 'my/listings';
const addListingUrl = baseUrl + 'listing/form';
const listingTypeUrl = baseUrl + 'listing-types';
const deleteListingUrl = baseUrl + 'my/listings?listing_id=';
const editListingUrl = baseUrl + 'listing/form?listing_id=';
const markAsSoldUrl = baseUrl + 'mark-as-sold?listing_id=';
const listingReviewUrl = baseUrl + 'reviews?listing=';
//fav urls
const favUrl = baseUrl + 'my/favourites';
const featuredListingUrl = baseUrl + 'listings?promotion_in[]=featured';
//location urls
const locationUrl = baseUrl + 'locations';
const locationByIdUrl = baseUrl + 'locations?parent_id=';
//chat urls
const chatUrl = baseUrl + 'my/chat/conversation';
const messageUrl = baseUrl + 'my/chat/message';
const chatlistingByIdUrl = baseUrl + 'my/chat/check?listing_id=';
const myChatUrl = baseUrl + 'my/chat';
//conversation urls
const myConversationsUrl = baseUrl + myChatUrl + '/conversation';
const myConversationsByIdUrl = myConversationsUrl + '?con_id=';
const myConversationsByListingIdUrl = chatUrl + '/check?listing_id=';
const myMessagesUrl = baseUrl + myChatUrl + '/message';
//contact us urls
const sendEmailUrl = baseUrl + 'listing/email-seller';
//membership urls
const membershipPlansUrl = baseUrl + 'plans?type=membership';
const regularPlansUrl = baseUrl + 'plans?type=regular';
//order urls
const ordersUrl = baseUrl + 'orders';
//checkout urls
const checkoutUrl = baseUrl + 'checkout';
const paymentUrl = baseUrl + 'payments';
const paymentGatewayUrl = baseUrl + 'payment-gateways';
const paymentsByIdUrl = baseUrl + 'payments/';
//profile urls
const profileImageUrl = baseUrl + 'my/profile-image';
const profileUrl = baseUrl + 'my';
const resetPasswordUrl = baseUrl + 'reset-password?user_login=';
//push notification urls
const pushNotificationUrl = baseUrl + 'push-notification/register';
//search urls
const listingSearchUrl = baseUrl + 'listings?search=';
const filterSearchUrl = baseUrl + 'listings?price_range=';
const sortSearchUrl = baseUrl + 'listings?orderBy=';
