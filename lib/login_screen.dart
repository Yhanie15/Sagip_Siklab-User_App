import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 130),
              Image.asset('assets/text.png', height: 90),
              const SizedBox(height: 0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: const TextStyle(color: Colors.white70), // Hint text color
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Text color
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white70), // Hint text color
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Text color
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('LOG IN'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: const Text(
                  "Don't have account? Sign up.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDistrict;
  String? _selectedBarangay;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // List of districts and barangays
  final Map<String, List<String>> _barangays = {
    'District 1': [
      'Alicia', 'Bagong Pag-asa', 'Bahay Toro', 'Balingasa', 'Bungad',
      'Damar', 'Damayan', 'Del Monte', 'Katipunan', 'Lourdes', 'Maharlika', 'Manresa',
      'Mariblo', 'Masambong', 'N.S Amoranto', 'Nayong Kanluran', 'Paang Bundok', 'Pag-ibig sa Nayon',
      'Paltok', 'Paraiso', 'Phil-Am', 'Project 6', 'Ramon Magsaysay', 'Saint Peter',
      'Salvacion', 'San Antonio', 'San Isidro Labrador', 'San Jose', 'Santa Cruz', 'Santa Teresita',
      'Sto. Cristo', 'Santo Domingo', 'Seina', 'Talayan', 'Vasra', 'Veterans Village', 'West Triangle'
    ],
    'District 2': ['Bagong Silangan', 'Batasan Hills', 'Commonwealth', 'Holy Spirit', 'Payatas'],
    'District 3': ['Amihan', 'Bagumbayan', 'Bagumbuhay', 'Bayanihan', 'Blue Ridge A', 'Blue Ridge B'],
    'District 4': ['Bagong Lipunan ng Crame', 'Botocan', 'Central', 'Damayang Lagi', 'Don Manuel'],
    'District 5': ['Bagbag', 'Capri', 'Fairview', 'Greater Lagro', 'Gulod'],
    'District 6': ['Apolonio Samson', 'Baesa', 'Balong Bato', 'Culiat', 'New Era'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Create New Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 150),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'First name *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Last name *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email Address *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'District *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownColor: Colors.grey[700],
                  style: const TextStyle(color: Colors.white),
                  value: _selectedDistrict,
                  items: _barangays.keys.map((district) {
                    return DropdownMenuItem(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDistrict = value;
                      _selectedBarangay = null; // Reset barangay when district changes
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a district';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                if (_selectedDistrict != null)
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Barangay *',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    dropdownColor: Colors.grey[700],
                    style: const TextStyle(color: Colors.white),
                    value: _selectedBarangay,
                    items: _barangays[_selectedDistrict]!.map((barangay) {
                      return DropdownMenuItem(
                        value: barangay,
                        child: Text(barangay),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedBarangay = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a barangay';
                      }
                      return null;
                    },
                  ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password *',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: const Text('SIGN UP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
