import 'package:flutter/material.dart';

class Terms_And_Conditions extends StatefulWidget {
  const Terms_And_Conditions({ Key? key }) : super(key: key);

  @override
  _Terms_And_ConditionsState createState() => _Terms_And_ConditionsState();
}

class _Terms_And_ConditionsState extends State<Terms_And_Conditions> {
  final Padding = EdgeInsets.only(left: 10, right: 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.pinkAccent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  
                
              ),
            
            backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 5.0),
              child: const Text("Terms and conditions:", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 15.0),
            child: const Text("These terms and conditions (“Agreement”) set forth the general terms and conditions of your use of the “Women safer” mobile application (“Mobile Application” or “Service”) and any of its related products and services (collectively, “Services”). This Agreement is legally binding between you (“User”, “you” or “your”) and this Mobile Application developer (“Operator”, “we”, “us” or “our”). If you are entering into this agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this agreement, in which case the terms “User”, “you” or “your” shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this agreement, you must not accept this agreement and may not access and use the Mobile Application and Services. By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services. This terms and conditions policy was created with the help of the terms and conditions generator at https://www.websitepolicies.com/terms-and-conditions-generator",),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Accounts and membership: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. We may monitor and review new accounts before you may sign in and start using the Services. Providing false contact information of any kind may result in the termination of your account. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. We may suspend, disable, or delete your account (or any part thereof) if we determine that you have violated any provision of this Agreement or that your conduct or content would tend to damage our reputation and goodwill. If we delete your account for the foregoing reasons, you may not re-register for our Services. We may block your email address and Internet protocol address to prevent further registration."),              
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Links to other resources: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Although the Mobile Application and Services may link to other resources (such as websites, mobile applications, etc.), we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked resource, unless specifically stated herein. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any businesses or individuals or the content of their resources. We do not assume any responsibility or liability for the actions, products, services, and content of any other third parties. You should carefully review the legal statements and other conditions of use of any resource which you access through a link in the Mobile Application. Your linking to any other off-site resources is at your own risk."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Prohibited uses: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("In addition to other terms as set forth in the Agreement, you are prohibited from using the Mobile Application and Services or Content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Mobile Application and Services, third party products and services, or the Internet; (h) to spam, phish, pharm, pretext, spider, crawl, or scrape; (i) for any obscene or immoral purpose; or (j) to interfere with or circumvent the security features of the Mobile Application and Services, third party products and services, or the Internet. We reserve the right to terminate your use of the Mobile Application and Services for violating any of the prohibited uses."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Intellectual property rights: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("“Intellectual Property Rights” means all present and future rights conferred by statute, common law or equity in or in relation to any copyright and related rights, trademarks, designs, patents, inventions, goodwill and the right to sue for passing off, rights to inventions, rights to use, and all other intellectual property rights, in each case whether registered or unregistered and including all applications and rights to apply for and be granted, rights to claim priority from, such rights and all similar or equivalent rights or forms of protection and any other results of intellectual activity which subsist or will subsist now or in the future in any part of the world. This Agreement does not transfer to you any intellectual property owned by the Operator or third parties, and all rights, titles, and interests in and to such property will remain (as between the parties) solely with the Operator. All trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services, are trademarks or registered trademarks of the Operator or its licensors. Other trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services may be the trademarks of other third parties. Your use of the Mobile Application and Services grants you no right or license to reproduce or otherwise use any of the Operator or third party trademarks."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Severability: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("All rights and restrictions contained in this Agreement may be exercised and shall be applicable and binding only to the extent that they do not violate any applicable laws and are intended to be limited to the extent necessary so that they will not render this Agreement illegal, invalid or unenforceable. If any provision or portion of any provision of this Agreement shall be held to be illegal, invalid or unenforceable by a court of competent jurisdiction, it is the intention of the parties that the remaining provisions or portions thereof shall constitute their agreement with respect to the subject matter hereof, and all such remaining provisions or portions thereof shall remain in full force and effect."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Dispute resolution: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("The formation, interpretation, and performance of this Agreement and any disputes arising out of it shall be governed by the substantive and procedural laws of Pakistan without regard to its rules on conflicts or choice of law and, to the extent applicable, the laws of Pakistan. The exclusive jurisdiction and venue for actions related to the subject matter hereof shall be the courts located in Pakistan, and you hereby submit to the personal jurisdiction of such courts. You hereby waive any right to a jury trial in any proceeding arising out of or related to this Agreement. The United Nations Convention on Contracts for the International Sale of Goods does not apply to this Agreement."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Changes and amendments: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("We reserve the right to modify this Agreement or its terms related to the Mobile Application and Services at any time at our discretion. When we do, we will post a notification in the Mobile Application, send you an email to notify you. We may also provide notice to you in other ways at our discretion, such as through the contact information you have provided. An updated version of this Agreement will be effective immediately upon the posting of the revised Agreement unless otherwise specified. Your continued use of the Mobile Application and Services after the effective date of the revised Agreement (or such other act specified at that time) will constitute your consent to those changes."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Acceptance of these terms: ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("You acknowledge that you have read this Agreement and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to access or use the Mobile Application and Services.",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 0, bottom: 15.0),
              child: const Text("Contacting Us ", style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),)
            ),
            
            
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("If you have any questions, concerns, or complaints regarding this Agreement, we encourage you to contact us using the details below:",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("WomenSafer@hotmail.com",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("This document was last updated on February 5, 2022",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 70,),
 
          ],
        ),
      ),
    );
  }
}