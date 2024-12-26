import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    locale: const Locale('fa', 'IR'),
    builder: (context, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      );
    },
    home: const LoginPage(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YUNA Center',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  const LoginPage(), // Set LoginPage as the initial page
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 130.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to YUNA Center',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.email, color: Colors.red),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock, color: Colors.red),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logging in...')),
                      );
                      // Navigate to HomePage after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),

                // Forgot Password Link
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgetPasswordPage()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),

                // Register Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.red),
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
}



class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 130.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your email address to receive a verification code.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.email, color: Colors.red),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Verification code has been sent to your email!'),
                          duration: Duration(seconds: 1),
                        ),
                      );

                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr, // تنظیم جهت متن به LTR
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo or Image
                Container(
                  width: 130.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create Your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),

                // Sign-Up Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.person, color: Colors.red),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.email, color: Colors.red),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock, color: Colors.red),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password Field
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock, color: Colors.red),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Sign-Up Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Creating account...')),
                      );
                      // Navigate to HomePage after successful sign-up
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),

                // Already Have an Account Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to LoginPage
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.red),
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
}








class HomePage extends StatelessWidget {
  final List<Product> bestSellers = [
    Product(
      name: 'محصول ۱',
      price: '۲,۰۰۰,۰۰۰ تومان',
      imagePath: 'assets/product1.jpg',
      rating: 4.5,
      sales: 250,
    ),
    Product(
      name: 'محصول ۲',
      price: '۱,۵۰۰,۰۰۰ تومان',
      imagePath: 'assets/product2.jpg',
      rating: 4.2,
      sales: 180,
    ),
  ];

  final List<Product> discountedProducts = [
    Product(
      name: 'محصول ۳',
      price: '۵۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product3.jpg',
      rating: 4.0,
      sales: 100,
    ),
    Product(
      name: 'محصول ۴',
      price: '۴۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product4.jpg',
      rating: 4.2,
      sales: 80,
    ),
  ];

  final List<Product> allProducts = [
    Product(
      name: 'محصول ۱',
      price: '۲,۰۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product1.jpg',
      rating: 4.5,
      sales: 250,
    ),
    Product(
      name: 'محصول ۲',
      price: '۱,۵۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product2.jpg',
      rating: 4.2,
      sales: 180,
    ),
    Product(
      name: 'محصول ۳',
      price: '۵۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product3.jpg',
      rating: 4.0,
      sales: 100,
    ),
    Product(
      name: 'محصول ۴',
      price: '۴۰۰,۰۰۰ تومان',
      imagePath: 'assets/images/product4.jpg',
      rating: 4.2,
      sales: 80,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'صفحه اصلی',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                // هدایت به صفحه جستجو
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // نمایش محصولات برتر
                const Text(
                  'محصولات برتر:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestSellers.length,
                    itemBuilder: (context, index) {
                      final product = bestSellers[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(product.imagePath,
                                    height: 100, fit: BoxFit.cover),
                                const SizedBox(height: 8),
                                Text(product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(product.price,
                                    style: const TextStyle(color: Colors.red)),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow[700], size: 16),
                                    Text('${product.rating}'),
                                  ],
                                ),
                                Text('فروش: ${product.sales}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // نمایش تخفیفات شگفت‌انگیز
                const Text(
                  'تخفیفات شگفت‌انگیز:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: discountedProducts.length,
                    itemBuilder: (context, index) {
                      final product = discountedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(product.imagePath,
                                    height: 100, fit: BoxFit.cover),
                                const SizedBox(height: 8),
                                Text(product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(product.price,
                                    style: const TextStyle(color: Colors.red)),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow[700], size: 16),
                                    Text('${product.rating}'),
                                  ],
                                ),
                                Text('فروش: ${product.sales}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // نمایش لیست تمام محصولات به صورت عمودی
                const Text(
                  'محصولات:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,  // Ensure it uses only the required space
                  physics: NeverScrollableScrollPhysics(),  // Disable scrolling in this section
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    final product = allProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              product: product,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(product.imagePath,
                                  height: 100, fit: BoxFit.cover),
                              const SizedBox(height: 8),
                              Text(product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(product.price,
                                  style: const TextStyle(color: Colors.red)),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow[700], size: 16),
                                  Text('${product.rating}'),
                                ],
                              ),
                              Text('فروش: ${product.sales}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2, // مقدار اولیه برای صفحه دسته‌بندی‌ها
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()), // صفحه خانه
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CartPage()), // صفحه سبد خرید
              );
            } else if (index == 3) {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfilePage()), // صفحه حساب کاربری
              // );
            }
            // برای دسته‌بندی‌ها نیازی به کد اضافی نیست چون در همین صفحه هستیم.
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'دسته‌بندی‌ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حساب کاربری',
            ),
          ],
        ),

      ),
    );
  }
}





class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // تصویر محصول
              Center(
                child: Image.asset(
                  product.imagePath,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // نام محصول و قیمت
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'قیمت: ${product.price}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),

              // امتیاز محصول
              Row(
                children: [
                  const Text('امتیاز:', style: TextStyle(fontSize: 16)),
                  Row(
                    children: List.generate(
                      5,
                          (index) => Icon(
                        index < product.rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('${product.rating}', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Text('فروش: ${product.sales}', style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 16),

              // توضیحات محصول
              const Text(
                'توضیحات:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product.description ?? 'توضیحاتی برای این محصول موجود نیست.',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 16),

              // دکمه‌های افزودن به سبد خرید و علاقه‌مندی‌ها
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} به سبد خرید اضافه شد')),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('افزودن به سبد خرید'),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // نظرات کاربران
              const Text(
                'نظرات کاربران:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Card(
                    child: ListTile(
                      title: const Text('علی'),
                      subtitle: const Text('محصول خیلی خوب بود!'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.thumb_up, color: Colors.green),
                          SizedBox(width: 8),
                          Text('12'),
                          SizedBox(width: 16),
                          Icon(Icons.thumb_down, color: Colors.red),
                          SizedBox(width: 8),
                          Text('2'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('سارا'),
                      subtitle: const Text('کیفیت محصول متوسط بود.'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.thumb_up, color: Colors.green),
                          SizedBox(width: 8),
                          Text('5'),
                          SizedBox(width: 16),
                          Icon(Icons.thumb_down, color: Colors.red),
                          SizedBox(width: 8),
                          Text('7'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // افزودن نظر
              const Text(
                'نظر خود را بنویسید:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'نظر خود را وارد کنید',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('نظر شما ثبت شد!')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imagePath;
  final double rating;
  final int sales;
  final String? description;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.sales,
    this.description,
  });
}


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"title": "الکترونیک", "icon": Icons.devices},
      {"title": "پوشاک", "icon": Icons.checkroom},
      {"title": "کتاب", "icon": Icons.book},
      {"title": "خانه و آشپزخانه", "icon": Icons.kitchen},
      {"title": "محصولات زیبایی", "icon": Icons.brush},
      {"title": "ورزشی", "icon": Icons.sports},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('دسته‌بندی کالاها'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // تنظیم جهت متن به RTL
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // تعداد ستون‌ها
              crossAxisSpacing: 16.0, // فاصله افقی بین آیتم‌ها
              mainAxisSpacing: 16.0, // فاصله عمودی بین آیتم‌ها
              childAspectRatio: 3 / 4, // نسبت عرض به ارتفاع
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  // عملیات برای انتخاب دسته‌بندی
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${category['title']} انتخاب شد')),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'],
                        size: 64.0,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        category['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}






class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'محصول ۱',
      'price': 2000000,
      'discountedPrice': 1800000,
      'quantity': 1,
      'imagePath': 'assets/images/product1.jpg',
    },
    {
      'name': 'محصول ۲',
      'price': 1500000,
      'discountedPrice': 1500000,
      'quantity': 2,
      'imagePath': 'assets/images/product2.jpg',
    },
  ];

  final List<String> savedAddresses = [
    'تهران، خیابان انقلاب، پلاک ۱۲۳',
    'مشهد، خیابان امام رضا، پلاک ۴۵۶',
  ];

  String? selectedAddress;
  final int deliveryFee = 50000;
  bool hasSubscription = false;

  double calculateTotalPrice() {
    return cartItems.fold(0, (total, item) {
      return total + (item['discountedPrice'] * item['quantity']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = calculateTotalPrice();
    final totalWithDelivery = hasSubscription ? totalPrice : totalPrice + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text('سبد خرید'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // لیست محصولات در سبد خرید
              const Text(
                'محصولات:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ProductItem(
                    item: item,
                    onRemove: () {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                    onIncrease: () {
                      setState(() {
                        item['quantity']++;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        if (item['quantity'] > 1) {
                          item['quantity']--;
                        }
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 16),

              // انتخاب آدرس
              const Text(
                'آدرس ارسال:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedAddress,
                hint: const Text('آدرس خود را انتخاب کنید'),
                isExpanded: true,
                items: [
                  ...savedAddresses.map((address) {
                    return DropdownMenuItem(
                      value: address,
                      child: Text(address),
                    );
                  }),
                  const DropdownMenuItem(
                    value: 'new',
                    child: Text('افزودن آدرس جدید'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    if (value == 'new') {
                      _showAddAddressDialog();
                    } else {
                      selectedAddress = value;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),

              // هزینه ارسال
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl, // اضافه کردن جهت راست‌چین
                children: [
                  const Text('هزینه ارسال:'),
                  Text(
                    hasSubscription ? 'رایگان' : '$deliveryFee تومان',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const Divider(),
              // مجموع قیمت
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('مجموع قیمت:'),
                  Text(
                    '$totalWithDelivery تومان',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // دکمه نهایی کردن خرید
              ElevatedButton(
                onPressed: () {
                  // عملیات نهایی کردن خرید
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Center(
                  child: Text('نهایی کردن خرید', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      // نوار ناوبری
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // مشخص کردن صفحه فعلی (سبد خرید = 1)
        onTap: (index) {
          if (index == 0) {
            // بازگشت به خانه
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // جایگزین با صفحه اصلی شما
            );
          } else if (index == 1) {
            // باقی ماندن در صفحه سبد خرید
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
            // } else if (index == 2) {
            //   // رفتن به صفحه دسته‌بندی‌ها
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => CategoriesPage()), // جایگزین با صفحه دسته‌بندی
            //   );
            // } else if (index == 3) {
            //   // رفتن به صفحه حساب کاربری
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProfilePage()), // جایگزین با صفحه حساب کاربری
            //   );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'سبد خرید',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'دسته‌بندی‌ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حساب کاربری',
          ),
        ],
      ),

    );
  }

  void _showAddAddressDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('افزودن آدرس جدید'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'آدرس خود را وارد کنید'),
            onSubmitted: (value) {
              setState(() {
                savedAddresses.add(value);
                selectedAddress = value;
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductItem({
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(item['imagePath'], height: 80, width: 80, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${item['price']} تومان',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('${item['discountedPrice']} تومان', style: const TextStyle(color: Colors.red, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('تعداد:', style: TextStyle(fontSize: 14)),
                    IconButton(
                      onPressed: onDecrease,
                      icon: const Icon(Icons.remove, size: 20),
                    ),
                    Text('${item['quantity']}', style: const TextStyle(fontSize: 14)),
                    IconButton(
                      onPressed: onIncrease,
                      icon: const Icon(Icons.add, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allProducts = [
    'محصول ۱',
    'product2',
    'product3',
    'محصول ۴',
    'محصول ۵',
  ];
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = allProducts;
  }

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults = allProducts;
      } else {
        searchResults = allProducts
            .where((product) => product.contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('جستجو'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // فیلد جستجو
              TextField(
                controller: _searchController,
                onChanged: _performSearch,
                decoration: InputDecoration(
                  hintText: 'عبارت جستجو را وارد کنید...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // نمایش نتایج جستجو
              Expanded(
                child: searchResults.isEmpty
                    ? const Center(
                  child: Text('نتیجه‌ای یافت نشد'),
                )
                    : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResults[index]),
                      onTap: () {
                        // مدیریت کلیک روی آیتم
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${searchResults[index]} انتخاب شد'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


