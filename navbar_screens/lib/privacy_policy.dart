import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({ Key? key }) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                      "Privacy Policy",
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
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Privacy Policy ", textDirection: TextDirection.ltr,),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("This SERVICE is provided by WomenSafer at no cost and is intended for use as is. This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service. If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. we will not use or share your information with anyone except as described in this Privacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Women safer unless otherwise defined in this Privacy Policy."),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Information Collection and Use: For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained on your device and is not collected by us  in any way. The app does use third-party services that may collect information used to identify you.Link to the privacy policy of third-party service providers used by the app"),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Google Play Services",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Google Analytics for Firebase",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Firebase Crashlytics",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Facebook",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Log Data",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("I want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics."),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Cookies: Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory. This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Service Providers: We may employ third-party companies and individuals due to the following reasons:"),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("To facilitate our Service;",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("To provide the Service on our behalf;",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("To perform Service-related services; or",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("To assist us in analyzing how our Service is used.",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("We  want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Security: we value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Links to Other Sites: This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, we strongly advise you to review the Privacy Policy of these websites. we have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Children’s Privacy: These Services do not address anyone under the age of 10. we do not knowingly collect personally identifiable information from children under 10 years of age. In the case we discover that a child under 13 has provided me with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that we will be able to do the necessary actions"),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Changes to This Privacy Policy: We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. we will notify you of any changes by posting the new Privacy Policy on this page."),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("This policy is effective as of 2022-02-05",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Contact Us",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
             Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact us at Womensafer@hotmail.com"),
            ),
            SizedBox(height: 10,),
                     SizedBox(height: 70,),
                   ],
        ),
      ),
    );
  }
}