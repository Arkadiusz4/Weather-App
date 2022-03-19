// if (_response != null)
//               Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           children: [
//                             Text(
//                               '${_response?.cityName}',
//                               style: GoogleFonts.lato(
//                                 fontSize: 40,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //Image.network(_response!.iconUrl),
//                     SizedBox(
//                       height: 250,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 100,
//                           child: Row(
//                             children: [
//                               Text(
//                                 '${_response?.temperatureInfo.temperature} °C',
//                                 style: TextStyle(
//                                   fontSize: 40,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Image.asset(_response!.iconUrl),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           '${_response?.weatherInfo.description.toUpperCase()}',
//                           style: TextStyle(
//                             fontSize: 25,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),



// Stack(children: [
//         Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     (_response != null)
//                         ? _response!.backgroundImage
//                         : 'assets/images/normal.jpg',
//                   ),
//                   fit: BoxFit.fitHeight,
//                   colorFilter: ColorFilter.mode(
//                       Colors.black.withOpacity(0.2), BlendMode.darken),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 30),
//                       child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: TextField(
//                                     controller: _cityTextController,
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Search for a city...',
//                                       suffixIcon: _cityTextController
//                                                   .text.length >
//                                               0
//                                           ? null
//                                           : IconButton(
//                                               onPressed: () =>
//                                                   _cityTextController.clear(),
//                                               icon: Icon(
//                                                 Icons.clear,
//                                               ),
//                                             ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                               ),
//                               child: IconButton(
//                                 onPressed: _search,
//                                 icon: Icon(Icons.search),
//                               ),
//                             ),
//                           ]),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
            
//           ],
//         ),
//       ]),


/*
AssetImage(
                  (_response != null)
                      ? _response!.backgroundImage
                      : 'assets/images/normal.jpg',
                ),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                    
                    */