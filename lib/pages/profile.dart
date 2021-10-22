import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_apps/api/api_service.dart';
import 'package:test_apps/provider/profil_provider.dart';
import 'package:test_apps/model/model_profile.dart';
import 'package:test_apps/pages/tampilan_data_profile.dart';
import 'package:test_apps/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var token;
  ModelProfil? modelProfil;
  void getdata() async{

    APIData().readSecureData('token').then((value) async{
      print(value);
      token = value;
      Provider.of<ProfilViewModel>(context, listen: false).getalldata(value);
    } );


  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Widget buildUI(ProfilViewModel profilViewModel) {
    if (profilViewModel.tipe != null) {

      return TampilanProfil(model: profilViewModel.tipe);
    }
    else {

      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.red
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID CARD', style: putihstyle,),
                      Icon(Icons.notifications_none, color: Colors.white,),
                    ],
                  ),
                ),
                SizedBox(height: 50,),

              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        enabled: true,
                        period: Duration(seconds: 3),
                        child: Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        enabled: true,
                        period: Duration(seconds: 3),
                        child: Container(
                          height: 10,
                          width: 80,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        enabled: true,
                        period: Duration(seconds: 3),
                        child: Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 44, right: 44),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Edit Profil', style: putihstyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(

                              children: [
                                Icon(Icons.account_balance_wallet_outlined, color: Colors.black,),
                                SizedBox(height: 5,),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white,
                                  enabled: true,
                                  period: Duration(seconds: 3),
                                  child: Container(
                                    height: 10,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.card_giftcard_outlined, color: Colors.black,),
                                SizedBox(height: 5,),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white,
                                  enabled: true,
                                  period: Duration(seconds: 3),
                                  child: Container(
                                    height: 10,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.group_outlined, color: Colors.black,),
                                SizedBox(height: 5,),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white,
                                  enabled: true,
                                  period: Duration(seconds: 3),
                                  child: Container(
                                    height: 10,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/twitter.png', width: 50,),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 360),
            child: ListView(
              children: [
                Text('Mood', style: greystyle,),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Belum ada mood'),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.red
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Text(
                                'Buat Mood', style: putihstyle.copyWith(
                                fontSize: 14,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Gawean', style: greystyle,),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text('Gawean Selesai'),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.red
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              enabled: true,
                              period: Duration(seconds: 3),
                              child: Container(
                                height: 10,
                                width: 40,
                                color: Colors.white,
                              ),
                            ),
                            // child:  Text(
                            //   '${widget.model?.gawean_selesai}', style: putihstyle.copyWith(
                            //   fontSize: 14,
                            // ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Downline', style: greystyle,),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.qr_code_scanner_outlined),
                                  SizedBox(width: 15,),
                                  Text('My Qr Code'),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              color: Color(0xffF5f5f5)
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.group_add_outlined),
                                  SizedBox(width: 15,),
                                  Text('Tambah Downline'),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Bantuan', style: greystyle,),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.help_center_outlined),
                                SizedBox(width: 15,),
                                Text('FAQ'),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var view = Provider.of<ProfilViewModel> (context);
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(7.0),
              bottomRight: Radius.circular(7.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(7.0),
              bottomRight: Radius.circular(7.0),
            ),
            child: BottomNavigationBar(

              showSelectedLabels: true,
              selectedItemColor: Color(0xffC6C4C4),
              unselectedItemColor: Color(0xffC6C4C4),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Mood',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.work_outline),
                  label: 'Gawean',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.red,),

                  label: 'Profil',
                ),

              ],

            ),
          ),
        ),
      body: SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height,
        child:  buildUI(view),
      ),
    )
    );
  }
}
