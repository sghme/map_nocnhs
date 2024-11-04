import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Welcome to the Mobile Mapping Management Panel for New Ormoc City National High School. By accessing or using our system, you agree to comply with and be bound by these terms and conditions. We are committed to safeguarding your personal information in compliance with the Data Protection Act 2012.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Data Collection\n\n'
                'We collect personal data to ensure an efficient experience with our admin map system. The types of personal data collected include names and email addresses.\n\n'
                '2. Methods of Data Collection\n\n'
                'Data is collected through user account registration for administrative access to the map system.\n\n'
                '3. Purpose of Data Collection\n\n'
                'Your data is used to provide and enhance our services, communicate with you, and fulfill legal obligations.\n\n'
                '4. Legal Basis for Processing\n\n'
                'We process personal data based on user consent, legal compliance, and the legitimate interest of NOCNHS Admin Map System.\n\n'
                '5. Data Sharing and Disclosure\n\n'
                'We may share your data with service providers involved in maintaining our system or with legal authorities if required by law.\n\n'
                '6. User Rights\n\n'
                'You have the right to access, correct, or request deletion of your personal data. For any of these actions, please contact us at:',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text: 'xtriventech@gmail.com',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '7. Data Security\n\n'
                'We use security measures like encryption, access controls, and regular security audits to protect your data. In case of a data breach, we will notify you and relevant authorities in accordance with the law.\n\n'
                '8. Data Retention\n\n'
                'Your personal data is retained only as long as necessary for the purposes it was collected or as required by law. When no longer needed, data will be securely deleted.\n\n'
                '9. Changes to Terms and Conditions\n\n'
                'We reserve the right to update these terms at any time. Any changes will be posted on this page, and your continued use of the system signifies acceptance of the revised terms.\n\n'
                '10. Contact Information\n\n'
                'If you have any questions or concerns regarding these terms, please reach out to us at:',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text: 'xtriventech@gmail.com',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
