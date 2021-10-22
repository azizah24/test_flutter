import 'package:flutter/material.dart';
import 'package:test_apps/provider/profil_provider.dart';
import 'package:test_apps/theme.dart';

class TampilanProfil extends StatefulWidget {
  ProfilMViewModel? model;
  TampilanProfil({this.model});

  @override
  _TampilanProfilState createState() => _TampilanProfilState();
}

class _TampilanProfilState extends State<TampilanProfil> {
  @override
  Widget build(BuildContext context) {
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
                    Text('${widget.model?.full_name}', style: blackstyle,),
                    SizedBox(height: 5,),
                    Text('${widget.model?.mogawers_code}', style: redstyle,),
                    SizedBox(height: 5,),
                    Text('${widget.model?.email}'),
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
                              Text('Rp${widget.model?.balance}')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.card_giftcard_outlined, color: Colors.black,),
                              SizedBox(height: 5,),
                              Text('${widget.model?.points} pts')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.group_outlined, color: Colors.black,),
                              SizedBox(height: 5,),
                              Text('${widget.model?.downline_count} downlines')
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
                          child: widget.model?.gawean_selesai != null ? Text(
                            '${widget.model?.gawean_selesai}', style: putihstyle.copyWith(
                            fontSize: 14,
                          ),
                          ) : CircularProgressIndicator(),
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
              ),
              SizedBox(height: 15,),
            ],
          ),
        )
      ],
    );
  }
}
