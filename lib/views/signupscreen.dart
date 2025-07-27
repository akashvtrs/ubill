import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _businessController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _captchaController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/ubillimage.png', fit: BoxFit.cover),
                const SizedBox(height: 20),
                OutlinedButton(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: Color(0xFF404095)), // purple border
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
    onPressed: () => showFeatureDialog(context),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text(
        'why us',
        style: TextStyle(
          color: Color(0xFF404095),
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 4),
      Icon(
        Icons.help_outline,
        color:  Colors.blue,
        size: 18,
      ),
    ],
  ),
),
  const SizedBox(height: 10),

                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 22 ),
                  ),
                ),
                const SizedBox(height: 10),

                _buildInputField(
                  controller: _businessController,
                  hint: "Business Name",
                  icon: Icons.apartment,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter business name' : null,
                ),

                _buildInputField(
                  controller: _nameController,
                  hint: "Enter your Name",
                  icon: Icons.person,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your name' : null,
                ),

                _buildInputField(
                  controller: _emailController,
                  hint: "Email id",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter email';
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    return emailRegex.hasMatch(value) ? null : 'Enter valid email';
                  },
                ),

                _buildInputField(
                  controller: _phoneController,
                  hint: "Phone Number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter phone number';
                    if (value.length < 10) return 'Enter valid phone number';
                    return null;
                  },
                ),

                _buildInputField(
                  controller: _passwordController,
                  hint: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter password';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),

                _buildInputField(
                  controller: _confirmPasswordController,
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: _obscureConfirmPassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Confirm your password';
                    if (value != _passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Image.asset(
                          'assets/captcha.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 60,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF403F93),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // TODO: implement CAPTCHA refresh logic
                        },
                        icon: const Icon(Icons.refresh, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                _buildInputField(
                  controller: _captchaController,
                  hint: "Enter Captcha Code",
                  icon: Icons.verified_user,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter CAPTCHA' : null,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process registration
                        print("Registering user...");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF403F93),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row( 
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFF403F93),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggleVisibility,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? obscure : false,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Icon(icon,  size: 20,color: Colors.black),
                      ),
                             hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color:  Colors.black,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
  void showFeatureDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor:  const Color(0xFFD8D9EA),
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD8D9EA), // light purple background
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 📊 Illustration Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/dialogbackground.png', // replace with your asset
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20), 
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1. Billing and Estimate", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("2. Inventory Management", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("3. Payrolls", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("4. Final Accounting", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("5. GST Filing support", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔙 Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF404095),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("Back", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
