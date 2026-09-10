import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF539CA4),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF121212),
                        ),
                      ),

                      Text(
                        'Welcome back to Estera. Have a good time',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF888888),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF262626),
                              ),

                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF888888),
                                  size: 20,
                                ),

                                hintText: 'Your Email/ID',
                                hintStyle: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF262626).withOpacity(0.56),
                                ),

                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),

                            Divider(height: 1, color: Colors.grey.shade300),

                            TextField(
                              obscureText: true,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF262626),
                              ),

                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF888888),
                                  size: 20,
                                ),

                                hintText: 'Your Password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF262626).withOpacity(0.56),
                                ),

                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7000FF),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      SizedBox(
                        width: 327,
                        height: 18,
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color(0xFF000000),
                                thickness: 0.8,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                'or continue with',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF727272),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(
                                color: Color(0xFF000000),
                                thickness: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
