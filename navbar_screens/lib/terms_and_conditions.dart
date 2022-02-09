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
      appBar: AppBar(backgroundColor: Colors.pink[400],
        title: const Text("Terms And Conditions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:16, ),),),
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
          Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: const Text("Terms and conditions: These terms and conditions (“Agreement”) set forth the general terms and conditions of your use of the “Women safer” mobile application (“Mobile Application” or “Service”) and any of its related products and services (collectively, “Services”). This Agreement is legally binding between you (“User”, “you” or “your”) and this Mobile Application developer (“Operator”, “we”, “us” or “our”). If you are entering into this agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this agreement, in which case the terms “User”, “you” or “your” shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this agreement, you must not accept this agreement and may not access and use the Mobile Application and Services. By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services. This terms and conditions policy was created with the help of the terms and conditions generator at https://www.websitepolicies.com/terms-and-conditions-generator"),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Accounts and membership: If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. We may monitor and review new accounts before you may sign in and start using the Services. Providing false contact information of any kind may result in the termination of your account. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. We may suspend, disable, or delete your account (or any part thereof) if we determine that you have violated any provision of this Agreement or that your conduct or content would tend to damage our reputation and goodwill. If we delete your account for the foregoing reasons, you may not re-register for our Services. We may block your email address and Internet protocol address to prevent further registration."),              
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Links to other resources: Although the Mobile Application and Services may link to other resources (such as websites, mobile applications, etc.), we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked resource, unless specifically stated herein. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any businesses or individuals or the content of their resources. We do not assume any responsibility or liability for the actions, products, services, and content of any other third parties. You should carefully review the legal statements and other conditions of use of any resource which you access through a link in the Mobile Application. Your linking to any other off-site resources is at your own risk."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Prohibited uses: In addition to other terms as set forth in the Agreement, you are prohibited from using the Mobile Application and Services or Content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Mobile Application and Services, third party products and services, or the Internet; (h) to spam, phish, pharm, pretext, spider, crawl, or scrape; (i) for any obscene or immoral purpose; or (j) to interfere with or circumvent the security features of the Mobile Application and Services, third party products and services, or the Internet. We reserve the right to terminate your use of the Mobile Application and Services for violating any of the prohibited uses."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Intellectual property rights: “Intellectual Property Rights” means all present and future rights conferred by statute, common law or equity in or in relation to any copyright and related rights, trademarks, designs, patents, inventions, goodwill and the right to sue for passing off, rights to inventions, rights to use, and all other intellectual property rights, in each case whether registered or unregistered and including all applications and rights to apply for and be granted, rights to claim priority from, such rights and all similar or equivalent rights or forms of protection and any other results of intellectual activity which subsist or will subsist now or in the future in any part of the world. This Agreement does not transfer to you any intellectual property owned by the Operator or third parties, and all rights, titles, and interests in and to such property will remain (as between the parties) solely with the Operator. All trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services, are trademarks or registered trademarks of the Operator or its licensors. Other trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services may be the trademarks of other third parties. Your use of the Mobile Application and Services grants you no right or license to reproduce or otherwise use any of the Operator or third party trademarks."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Severability: All rights and restrictions contained in this Agreement may be exercised and shall be applicable and binding only to the extent that they do not violate any applicable laws and are intended to be limited to the extent necessary so that they will not render this Agreement illegal, invalid or unenforceable. If any provision or portion of any provision of this Agreement shall be held to be illegal, invalid or unenforceable by a court of competent jurisdiction, it is the intention of the parties that the remaining provisions or portions thereof shall constitute their agreement with respect to the subject matter hereof, and all such remaining provisions or portions thereof shall remain in full force and effect."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Dispute resolution: The formation, interpretation, and performance of this Agreement and any disputes arising out of it shall be governed by the substantive and procedural laws of Pakistan without regard to its rules on conflicts or choice of law and, to the extent applicable, the laws of Pakistan. The exclusive jurisdiction and venue for actions related to the subject matter hereof shall be the courts located in Pakistan, and you hereby submit to the personal jurisdiction of such courts. You hereby waive any right to a jury trial in any proceeding arising out of or related to this Agreement. The United Nations Convention on Contracts for the International Sale of Goods does not apply to this Agreement."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Changes and amendments: We reserve the right to modify this Agreement or its terms related to the Mobile Application and Services at any time at our discretion. When we do, we will post a notification in the Mobile Application, send you an email to notify you. We may also provide notice to you in other ways at our discretion, such as through the contact information you have provided. An updated version of this Agreement will be effective immediately upon the posting of the revised Agreement unless otherwise specified. Your continued use of the Mobile Application and Services after the effective date of the revised Agreement (or such other act specified at that time) will constitute your consent to those changes."),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Acceptance of these terms: You acknowledge that you have read this Agreement and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to access or use the Mobile Application and Services.",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Contacting us",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("If you have any questions, concerns, or complaints regarding this Agreement, we encourage you to contact us using the details below:",textDirection: TextDirection.ltr),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: const Text("Womensafer@hotmail.com",textDirection: TextDirection.ltr),
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