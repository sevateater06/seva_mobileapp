import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatefulWidget {
  ContactDetails({
    Key key,
    this.post,
  }) : super(key: key);
  final DocumentSnapshot post;

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  initState() {
    super.initState();
  }

  call(_phone) {
    String call1 = 'tel:' + _phone;
    launch(call1);
  }

  sendsms(_smsphone) {
    String sms1 = 'sms:' + _smsphone;
    launch(sms1);
  }

  sendemail(_emailid) {
    String email1 = 'mailto:' + _emailid;
    launch(email1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.post.data["fullName"])),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.0),
                      image: DecorationImage(
                        image: NetworkImage(widget.post.data["photoURL"]),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                          width: 2.0, color: const Color(0xffe4480f)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(15, 15),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.post.data["fullName"],
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: ResponsiveFlutter.of(context).fontSize(4.5),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.post.data["Post"],
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: ResponsiveFlutter.of(context).fontSize(3),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Text(
                          'Phone Number Details:',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe4480f)),
                            ),
                          ),
                          Container(
                            width: ((MediaQuery.of(context).size.width) -
                                (MediaQuery.of(context).size.width * 0.49)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffb9b6b6)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Work Number:',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.call,
                                ),
                                onPressed: () {
                                  call(
                                      widget.post.data["WorkPhone"].toString());
                                },
                              )),
                          Text(
                            widget.post.data["WorkPhone"].toString(),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.sms,
                                ),
                                onPressed: () {
                                  sendsms(
                                      widget.post.data["WorkPhone"].toString());
                                },
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Personal Number:',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.call,
                                ),
                                onPressed: () {
                                  call(widget.post.data["PersonalPhone"]
                                      .toString());
                                },
                              )),
                          Text(
                            widget.post.data["PersonalPhone"].toString(),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(),
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.sms,
                                ),
                                onPressed: () {
                                  sendsms(widget.post.data["PersonalPhone"]
                                      .toString());
                                },
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          'Address Details:',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.31,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe4480f)),
                            ),
                          ),
                          Container(
                            width: ((MediaQuery.of(context).size.width) -
                                (MediaQuery.of(context).size.width * 0.37)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffb9b6b6)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'Address:',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              widget.post.data["address"],
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Email:',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe4480f)),
                            ),
                          ),
                          Container(
                            width: ((MediaQuery.of(context).size.width) -
                                (MediaQuery.of(context).size.width * 0.18)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffb9b6b6)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Email:',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2),
                            child: Text(
                              widget.post.data["email"],
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(),
                              child: new IconButton(
                                icon: new Icon(
                                  Icons.email,
                                ),
                                onPressed: () {
                                  sendemail(widget.post.data["email"]);
                                },
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          'DOB Details:',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe4480f)),
                            ),
                          ),
                          Container(
                            width: ((MediaQuery.of(context).size.width) -
                                (MediaQuery.of(context).size.width * 0.30)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffb9b6b6)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Date of Birth:',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 0),
                            child: Text(
                              widget.post.data["DOB_D"].toString() +
                                  ' / ' +
                                  widget.post.data["DOB_M"].toString() +
                                  ' / ' +
                                  widget.post.data["DOB_Y"].toString(),
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
