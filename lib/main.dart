import 'package:flutter/material.dart';
void main()=>runApp(MyMartApp());
class MyMartApp extends StatelessWidget{
@override Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,title:'My Mart',theme:ThemeData(primarySwatch:Colors.green,useMaterial3:true),home:HomeScreen());
}
class HomeScreen extends StatefulWidget{
@override State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
int _i=0;
final pgs=[MarketPage(),EscrowPage(),OrdersPage(),ProfilePage()];
@override Widget build(BuildContext c)=>Scaffold(body:pgs[_i],bottomNavigationBar:NavigationBar(selectedIndex:_i,onDestinationSelected:(i)=>setState(()=>_i=i),destinations:[NavigationDestination(icon:Icon(Icons.storefront),label:'Market'),NavigationDestination(icon:Icon(Icons.security),label:'Escrow'),NavigationDestination(icon:Icon(Icons.receipt_long),label:'Orders'),NavigationDestination(icon:Icon(Icons.person),label:'Profile')]));
}
class MarketPage extends StatelessWidget{
final products=[{"name":"iPhone 15 Pro","price":"Rs. 285,000","seller":"Ali Mobile","img":"📱"},{"name":"Honda CD 70","price":"Rs. 157,000","seller":"Honda Center","img":"🏍️"},{"name":"Gaming Laptop","price":"Rs. 195,000","seller":"Tech Mart","img":"💻"},{"name":"AirPods Pro","price":"Rs. 42,000","seller":"Audio Store","img":"🎧"}];
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('My Mart',style:TextStyle(fontWeight:FontWeight.bold)),backgroundColor:Colors.green,foregroundColor:Colors.white),body:Column(children:[Container(color:Colors.green.shade50,padding:EdgeInsets.all(16),child:Row(children:[Icon(Icons.verified_user,color:Colors.green,size:32),SizedBox(width:10),Expanded(child:Text('100% Secure Payment with Escrow Protection',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green.shade800)))])),Expanded(child:GridView.builder(padding:EdgeInsets.all(12),gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:0.75),itemCount:products.length,itemBuilder:(ctx,i){var p=products[i];return Card(elevation:3,child:Column(children:[Expanded(child:Center(child:Text(p["img"]!,style:TextStyle(fontSize:60)))),Padding(padding:EdgeInsets.all(8),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(p["name"]!,style:TextStyle(fontWeight:FontWeight.bold)),Text(p["seller"]!,style:TextStyle(fontSize:11,color:Colors.grey)),SizedBox(height:4),Text(p["price"]!,style:TextStyle(color:Colors.green,fontWeight:FontWeight.bold)),SizedBox(height:6),SizedBox(width:double.infinity,child:ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(backgroundColor:Colors.green,foregroundColor:Colors.white),child:Text('Buy with Escrow')))]))])) ;}))]));
}
class EscrowPage extends StatelessWidget{
Widget step(String n,String t,String d,IconData ic)=>Card(margin:EdgeInsets.only(bottom:12),child:ListTile(leading:CircleAvatar(backgroundColor:Colors.green,child:Text(n,style:TextStyle(color:Colors.white))),title:Text(t,style:TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(d),trailing:Icon(ic,color:Colors.green)));
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('How Escrow Works'),backgroundColor:Colors.green,foregroundColor:Colors.white),body:ListView(padding:EdgeInsets.all(20),children:[Icon(Icons.security,size:80,color:Colors.green),SizedBox(height:10),Text('My Mart Escrow Protection',textAlign:TextAlign.center,style:TextStyle(fontSize:22,fontWeight:FontWeight.bold)),SizedBox(height:20),step('1','Buyer Pays to My Mart','Paisa My Mart secure account mein jata hai',Icons.payment),step('2','Seller Ships Product','Seller product bhejta hai',Icons.local_shipping),step('3','Buyer Confirms','Aap check karke confirm karte hain',Icons.check_circle),step('4','Seller Gets Paid','Confirm ke baad seller ko payment',Icons.account_balance_wallet)]));
}
class OrdersPage extends StatelessWidget{
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('My Orders'),backgroundColor:Colors.green,foregroundColor:Colors.white),body:ListView(padding:EdgeInsets.all(16),children:[Card(child:ListTile(leading:Text('📱',style:TextStyle(fontSize:30)),title:Text('iPhone 15 Pro'),subtitle:Text('Escrow: Holding - In Transit'),trailing:Chip(label:Text('In Transit'),backgroundColor:Colors.orange.shade100))),Card(child:ListTile(leading:Text('💻',style:TextStyle(fontSize:30)),title:Text('Gaming Laptop'),subtitle:Text('Escrow: Released - Delivered'),trailing:Chip(label:Text('Delivered'),backgroundColor:Colors.green.shade100)))]));
}
class ProfilePage extends StatelessWidget{
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('My Profile'),backgroundColor:Colors.green,foregroundColor:Colors.white),body:Column(children:[SizedBox(height:20),CircleAvatar(radius:40,backgroundColor:Colors.green,child:Text('IM',style:TextStyle(fontSize:30,color:Colors.white))),SizedBox(height:10),Text('Muhammad Imran',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Text('muhammadimran4700@gmail.com'),SizedBox(height:20),ListTile(leading:Icon(Icons.store),title:Text('Become a Seller')),ListTile(leading:Icon(Icons.support_agent),title:Text('Escrow Support')),Spacer(),Padding(padding:EdgeInsets.all(16),child:Text('My Mart v1.0.0 - Escrow Marketplace',style:TextStyle(color:Colors.grey,fontSize:12))) ]));
}
