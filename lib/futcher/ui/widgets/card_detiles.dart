import 'package:flutter/material.dart';

class CardDetiles extends StatefulWidget {
  const CardDetiles({super.key});

  @override
  State<CardDetiles> createState() => _CardDetilesState();
}

class _CardDetilesState extends State<CardDetiles> {

  bool isFavourate = false ;
  @override
  Widget build(BuildContext context) {
    return  Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container( 
                height: 200, 
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/image 6.png"),
                      Text(
                        "Food bourger",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ), 

                      SizedBox(height: 5,) , 

                       Text(
                        "Food bourger descraption",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500, 
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price:  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                              softWrap: true,
                            ),  
                                        
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavourate = !isFavourate ;
                                });
                              }, 
                        
                              icon: Icon(
                                isFavourate ? Icons.favorite : Icons.favorite_border , 
                                color: isFavourate ? Colors.red : Colors.black , 
                                size: 20,
                              ),
                            )
                                        
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}