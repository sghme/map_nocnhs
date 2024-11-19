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
                'Welcome to the MAPNOCNHS web-based management panel. This system is designed to manage and update the MAPNOCNHS mobile mapping application for New Ormoc City National High School, ensuring that the information displayed on the map remains accurate and up-to-date. By accessing or using our system, you agree to comply with and be bound by these terms and conditions. We are committed to safeguarding your personal information in compliance with the Data Protection Act of 2012.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('1. Data Collection'),
              Text(
                'We collect personal data to ensure an efficient experience with the system. The types of personal data collected include names and email addresses.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('2. Methods of Data Collection'),
              Text(
                'Data is collected through user account registration for administrative access to the system.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('3. Purpose of Data Collection'),
              Text(
                'Your data is used to provide and enhance our services, communicate with you, and fulfill legal obligations.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('4. Legal Basis for Processing'),
              Text(
                'We process personal data based on user consent, legal compliance, and the legitimate interest of NOCNHS Admin Map System.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('5. Data Sharing and Disclosure'),
              Text(
                'We may share your data with service providers involved in maintaining our system or with legal authorities if required by law.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('6. User Rights'),
              Text(
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
              _buildSectionTitle('7. Data Security'),
              Text(
                'We use security measures like encryption, access controls, and regular security audits to protect your data. In case of a data breach, we will notify you and relevant authorities in accordance with the law.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('8. Data Retention'),
              Text(
                'Your personal data is retained only as long as necessary for the purposes it was collected or as required by law. When no longer needed, data will be securely deleted.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('9. Changes to Terms and Conditions'),
              Text(
                'We reserve the right to update these terms at any time. Any changes will be posted on this page, and your continued use of the system signifies acceptance of the revised terms.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('10. Contact Information'),
              Text(
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
              SizedBox(height: 20.0), // Add some space before the footer
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '©2024 NOCNHS | All Rights Reserved.\nDeveloped by ',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'XTRIVENTECH',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.black, // You can change this to match your design
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
