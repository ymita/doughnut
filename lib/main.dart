import 'package:doughnut/learning/learning.dart';
import 'package:doughnut/search/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var idx = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('doughnut'),
        actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.info),
              onPressed: () {
                showDialog<Null>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  child: new AlertDialog(
                    title: new Text('About doughnut', style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                    content: new SingleChildScrollView(
                      child: new ListBody(
                        children: <Widget>[
                          new Text("Version 0.0.1", style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text(' '),
                          new Text(' '),
                          new Text("- Contributors -", style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text("Kazumichi Paul Nishimura"),
                          new Text("Tatsushi Kiryu"),
                          new Text("Yuki Mita"),
                          new Text(' '),
                          new Text(' '),
                          new Text(' '),
                          new Text("- Open Source Licenses -", style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text("xml", maxLines: 1000, style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text('The MIT License'),
                          new Text(' '),
                          new Text('Copyright (c) 2006-2017 Lukas Renggli.'),
                          new Text('All rights reserved.'),
                          new Text(' '),
                          new Text('Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:', maxLines: 1000),
                          new Text('The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.', maxLines: 1000),
                          new Text('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.', maxLines: 1000),
                          new Text(' '),
                          new Text(' '),
                          new Text('Reference: https://pub.dartlang.org/packages/xml'),
                          new Text(' '),
                          new Text(' '),
                          new Text(' '),
                          new Text("tts", maxLines: 1000, style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text('unknown (LICENSE)'),
                          new Text(' '),
                          new Text(' '),
                          new Text('Reference: https://pub.dartlang.org/packages/tts'),
                          new Text(' '),
                          new Text(' '),
                          new Text(' '),
                          new Text("Emoji One", maxLines: 1000, style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(' '),
                          new Text('Creative Commons Attribution-ShareAlike 4.0 International Public License'),
                          new Text(' '),
                          new Text('Section 1 – Definitions.'),
                          new Text(''),
                          new Text('Adapted Material means material subject to Copyright and Similar Rights that is derived from or based upon the Licensed Material and in which the Licensed Material is translated, altered, arranged, transformed, or otherwise modified in a manner requiring permission under the Copyright and Similar Rights held by the Licensor. For purposes of this Public License, where the Licensed Material is a musical work, performance, or sound recording, Adapted Material is always produced where the Licensed Material is synched in timed relation with a moving image.'),
                          new Text('Adapter\'s License means the license You apply to Your Copyright and Similar Rights in Your contributions to Adapted Material in accordance with the terms and conditions of this Public License.'),
                          new Text('BY-SA Compatible License means a license listed at creativecommons.org/compatiblelicenses, approved by Creative Commons as essentially the equivalent of this Public License.'),
                          new Text('Copyright and Similar Rights means copyright and/or similar rights closely related to copyright including, without limitation, performance, broadcast, sound recording, and Sui Generis Database Rights, without regard to how the rights are labeled or categorized. For purposes of this Public License, the rights specified in Section 2(b)(1)-(2) are not Copyright and Similar Rights.'),
                          new Text('Effective Technological Measures means those measures that, in the absence of proper authority, may not be circumvented under laws fulfilling obligations under Article 11 of the WIPO Copyright Treaty adopted on December 20, 1996, and/or similar international agreements.'),
                          new Text('Exceptions and Limitations means fair use, fair dealing, and/or any other exception or limitation to Copyright and Similar Rights that applies to Your use of the Licensed Material.'),
                          new Text('License Elements means the license attributes listed in the name of a Creative Commons Public License. The License Elements of this Public License are Attribution and ShareAlike.'),
                          new Text('Licensed Material means the artistic or literary work, database, or other material to which the Licensor applied this Public License.'),
                          new Text('Licensed Rights means the rights granted to You subject to the terms and conditions of this Public License, which are limited to all Copyright and Similar Rights that apply to Your use of the Licensed Material and that the Licensor has authority to license.'),
                          new Text('Licensor means the individual(s) or entity(ies) granting rights under this Public License.'),
                          new Text('Share means to provide material to the public by any means or process that requires permission under the Licensed Rights, such as reproduction, public display, public performance, distribution, dissemination, communication, or importation, and to make material available to the public including in ways that members of the public may access the material from a place and at a time individually chosen by them.'),
                          new Text('Sui Generis Database Rights means rights other than copyright resulting from Directive 96/9/EC of the European Parliament and of the Council of 11 March 1996 on the legal protection of databases, as amended and/or succeeded, as well as other essentially equivalent rights anywhere in the world.'),
                          new Text('You means the individual or entity exercising the Licensed Rights under this Public License. Your has a corresponding meaning.'),
                          new Text(' '),
                          new Text('Section 2 – Scope.'),
                          new Text(''),
                          new Text('License grant.'),
                          new Text('Subject to the terms and conditions of this Public License, the Licensor hereby grants You a worldwide, royalty-free, non-sublicensable, non-exclusive, irrevocable license to exercise the Licensed Rights in the Licensed Material to:'),
                          new Text('reproduce and Share the Licensed Material, in whole or in part; and'),
                          new Text('produce, reproduce, and Share Adapted Material.'),
                          new Text('Exceptions and Limitations. For the avoidance of doubt, where Exceptions and Limitations apply to Your use, this Public License does not apply, and You do not need to comply with its terms and conditions.'),
                          new Text('Term. The term of this Public License is specified in Section 6(a).'),
                          new Text('Media and formats; technical modifications allowed. The Licensor authorizes You to exercise the Licensed Rights in all media and formats whether now known or hereafter created, and to make technical modifications necessary to do so. The Licensor waives and/or agrees not to assert any right or authority to forbid You from making technical modifications necessary to exercise the Licensed Rights, including technical modifications necessary to circumvent Effective Technological Measures. For purposes of this Public License, simply making modifications authorized by this Section 2(a)(4) never produces Adapted Material.'),
                          new Text('Downstream recipients.'),
                          new Text('Offer from the Licensor – Licensed Material. Every recipient of the Licensed Material automatically receives an offer from the Licensor to exercise the Licensed Rights under the terms and conditions of this Public License.'),
                          new Text('Additional offer from the Licensor – Adapted Material. Every recipient of Adapted Material from You automatically receives an offer from the Licensor to exercise the Licensed Rights in the Adapted Material under the conditions of the Adapter’s License You apply.'),
                          new Text('No downstream restrictions. You may not offer or impose any additional or different terms or conditions on, or apply any Effective Technological Measures to, the Licensed Material if doing so restricts exercise of the Licensed Rights by any recipient of the Licensed Material.'),
                          new Text('No endorsement. Nothing in this Public License constitutes or may be construed as permission to assert or imply that You are, or that Your use of the Licensed Material is, connected with, or sponsored, endorsed, or granted official status by, the Licensor or others designated to receive attribution as provided in Section 3(a)(1)(A)(i).'),
                          new Text('Other rights.'),
                          new Text(''),
                          new Text('Moral rights, such as the right of integrity, are not licensed under this Public License, nor are publicity, privacy, and/or other similar personality rights; however, to the extent possible, the Licensor waives and/or agrees not to assert any such rights held by the Licensor to the limited extent necessary to allow You to exercise the Licensed Rights, but not otherwise.'),
                          new Text('Patent and trademark rights are not licensed under this Public License.'),
                          new Text('To the extent possible, the Licensor waives any right to collect royalties from You for the exercise of the Licensed Rights, whether directly or through a collecting society under any voluntary or waivable statutory or compulsory licensing scheme. In all other cases the Licensor expressly reserves any right to collect such royalties.'),
                          new Text(' '),
                          new Text('Section 3 – License Conditions.'),
                          new Text(''),
                          new Text('Your exercise of the Licensed Rights is expressly made subject to the following conditions.'),
                          new Text(''),
                          new Text('Attribution.'),
                          new Text(''),
                          new Text('If You Share the Licensed Material (including in modified form), You must:'),
                          new Text(''),
                          new Text('retain the following if it is supplied by the Licensor with the Licensed Material:'),
                          new Text('identification of the creator(s) of the Licensed Material and any others designated to receive attribution, in any reasonable manner requested by the Licensor (including by pseudonym if designated);'),
                          new Text('a copyright notice;'),
                          new Text('a notice that refers to this Public License;'),
                          new Text('a notice that refers to the disclaimer of warranties;'),
                          new Text('a URI or hyperlink to the Licensed Material to the extent reasonably practicable;'),
                          new Text('indicate if You modified the Licensed Material and retain an indication of any previous modifications; and'),
                          new Text('indicate the Licensed Material is licensed under this Public License, and include the text of, or the URI or hyperlink to, this Public License.'),
                          new Text('You may satisfy the conditions in Section 3(a)(1) in any reasonable manner based on the medium, means, and context in which You Share the Licensed Material. For example, it may be reasonable to satisfy the conditions by providing a URI or hyperlink to a resource that includes the required information.'),
                          new Text('If requested by the Licensor, You must remove any of the information required by Section 3(a)(1)(A) to the extent reasonably practicable.'),
                          new Text('ShareAlike.'),
                          new Text('In addition to the conditions in Section 3(a), if You Share Adapted Material You produce, the following conditions also apply.'),
                          new Text(''),
                          new Text('The Adapter’s License You apply must be a Creative Commons license with the same License Elements, this version or later, or a BY-SA Compatible License.'),
                          new Text('You must include the text of, or the URI or hyperlink to, the Adapter\'s License You apply. You may satisfy this condition in any reasonable manner based on the medium, means, and context in which You Share Adapted Material.'),
                          new Text('You may not offer or impose any additional or different terms or conditions on, or apply any Effective Technological Measures to, Adapted Material that restrict exercise of the rights granted under the Adapter\'s License You apply.'),
                          new Text(' '),
                          new Text('Section 4 – Sui Generis Database Rights.'),
                          new Text(''),
                          new Text('Where the Licensed Rights include Sui Generis Database Rights that apply to Your use of the Licensed Material:'),
                          new Text(''),
                          new Text('for the avoidance of doubt, Section 2(a)(1) grants You the right to extract, reuse, reproduce, and Share all or a substantial portion of the contents of the database;'),
                          new Text('if You include all or a substantial portion of the database contents in a database in which You have Sui Generis Database Rights, then the database in which You have Sui Generis Database Rights (but not its individual contents) is Adapted Material, including for purposes of Section 3(b); and'),
                          new Text('You must comply with the conditions in Section 3(a) if You Share all or a substantial portion of the contents of the database.'),
                          new Text('For the avoidance of doubt, this Section 4 supplements and does not replace Your obligations under this Public License where the Licensed Rights include other Copyright and Similar Rights.'),
                          new Text(' '),
                          new Text('Section 5 – Disclaimer of Warranties and Limitation of Liability.'),
                          new Text(''),
                          new Text('Unless otherwise separately undertaken by the Licensor, to the extent possible, the Licensor offers the Licensed Material as-is and as-available, and makes no representations or warranties of any kind concerning the Licensed Material, whether express, implied, statutory, or other. This includes, without limitation, warranties of title, merchantability, fitness for a particular purpose, non-infringement, absence of latent or other defects, accuracy, or the presence or absence of errors, whether or not known or discoverable. Where disclaimers of warranties are not allowed in full or in part, this disclaimer may not apply to You.'),
                          new Text('To the extent possible, in no event will the Licensor be liable to You on any legal theory (including, without limitation, negligence) or otherwise for any direct, special, indirect, incidental, consequential, punitive, exemplary, or other losses, costs, expenses, or damages arising out of this Public License or use of the Licensed Material, even if the Licensor has been advised of the possibility of such losses, costs, expenses, or damages. Where a limitation of liability is not allowed in full or in part, this limitation may not apply to You.'),
                          new Text('The disclaimer of warranties and limitation of liability provided above shall be interpreted in a manner that, to the extent possible, most closely approximates an absolute disclaimer and waiver of all liability.'),
                          new Text(' '),
                          new Text('Section 6 – Term and Termination.'),
                          new Text(''),
                          new Text('This Public License applies for the term of the Copyright and Similar Rights licensed here. However, if You fail to comply with this Public License, then Your rights under this Public License terminate automatically.'),
                          new Text('Where Your right to use the Licensed Material has terminated under Section 6(a), it reinstates:'),
                          new Text(''),
                          new Text('automatically as of the date the violation is cured, provided it is cured within 30 days of Your discovery of the violation; or'),
                          new Text('upon express reinstatement by the Licensor.'),
                          new Text('For the avoidance of doubt, this Section 6(b) does not affect any right the Licensor may have to seek remedies for Your violations of this Public License.'),
                          new Text('For the avoidance of doubt, the Licensor may also offer the Licensed Material under separate terms or conditions or stop distributing the Licensed Material at any time; however, doing so will not terminate this Public License.'),
                          new Text('Sections 1, 5, 6, 7, and 8 survive termination of this Public License.'),
                          new Text(' '),
                          new Text('Section 7 – Other Terms and Conditions.'),
                          new Text(''),
                          new Text('The Licensor shall not be bound by any additional or different terms or conditions communicated by You unless expressly agreed.'),
                          new Text('Any arrangements, understandings, or agreements regarding the Licensed Material not stated herein are separate from and independent of the terms and conditions of this Public License.'),
                          new Text(' '),
                          new Text('Section 8 – Interpretation.'),
                          new Text(''),
                          new Text('For the avoidance of doubt, this Public License does not, and shall not be interpreted to, reduce, limit, restrict, or impose conditions on any use of the Licensed Material that could lawfully be made without permission under this Public License.'),
                          new Text('To the extent possible, if any provision of this Public License is deemed unenforceable, it shall be automatically reformed to the minimum extent necessary to make it enforceable. If the provision cannot be reformed, it shall be severed from this Public License without affecting the enforceability of the remaining terms and conditions.'),
                          new Text('No term or condition of this Public License will be waived and no failure to comply consented to unless expressly agreed to by the Licensor.'),
                          new Text('Nothing in this Public License constitutes or may be interpreted as a limitation upon, or waiver of, any privileges and immunities that apply to the Licensor or You, including from the legal processes of any jurisdiction or authority.'),
                          new Text(' '),
                          new Text(' '),
                          new Text('Source: https://github.com/emojione/emojione/tree/2.2.7'),
                          new Text(' '),
                          new Text(' '),
                          new Text('Author: https://github.com/emojione/emojione/graphs/contributors'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
      ),
      body: idx == 0 ? new Search() : new Learning(),
      /// Prevents software keyboard from appearing over TextField.
      resizeToAvoidBottomPadding: false,
      // bottomNavigationBar: new BottomNavigationBar(
      //   currentIndex: idx,
      //   onTap: (int idx) {
      //     setState(() {
      //       this.idx = idx;
      //     });
      //   },
      //   items: <BottomNavigationBarItem>[
      //     new BottomNavigationBarItem(
      //       icon: new Icon(Icons.search),
      //       title: new Text('探す'),
      //     ),
      //     new BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       title: new Text('学ぶ'),
      //     ),
      //   ],
      // ),
    );
  }
}
