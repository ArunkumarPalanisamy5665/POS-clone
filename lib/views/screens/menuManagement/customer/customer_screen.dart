import 'package:flutter/material.dart';

import '../../../widgets/common/custom_button2.dart';
import '../../../widgets/common/custom_edit_delete_btn.dart';
import '../../../widgets/common/custom_pagination_widget.dart';
import '../../../widgets/common/custom_scroll_wrapper.dart';
import '../../../widgets/common/custom_textfield.dart';
import '../../../widgets/common/section_header.dart';

import 'package:new_hrms_flutter/core/constants/app_export.dart';


class Customer {
  final String name;
  final String customerId;
  final String gender;
  final String phoneNumber;
  final String email;
  final String createdAt;
  final String status;
  final String profilePic;

  Customer({
    required this.name,
    required this.customerId,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.createdAt,
    required this.status,
    required this.profilePic,
  });
}

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int currentPage = 1;
  int itemsPerPage = 9;

  final List<Customer> allCustomers = [
    Customer(
      name: 'Adrian James',
      customerId: '#CR6569',
      gender: 'Male',
      phoneNumber: '+1 56985 65895',
      email: 'adrian@example.com',
      createdAt: '25 Nov, 2025 - 02:44 PM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Sue Allen',
      customerId: '#CR8238',
      gender: 'Female',
      phoneNumber: '+1 67890 12345',
      email: 'allen@example.com',
      createdAt: '30 Nov, 2025 - 03:15 PM',
      status: 'Disabled',
      profilePic: '👩',
    ),
    Customer(
      name: 'Frank Barrett',
      customerId: '#CR4824',
      gender: 'Male',
      phoneNumber: '+1 23456 78901',
      email: 'frank@example.com',
      createdAt: '05 Dec, 2025 - 11:30 AM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Walkin Customer',
      customerId: '#CR6569',
      gender: 'Male',
      phoneNumber: '+1 56985 65895',
      email: 'info@example.com',
      createdAt: '25 Nov, 2025 - 02:44 PM',
      status: 'Active',
      profilePic: '👤',
    ),
    Customer(
      name: 'Walkin Customer',
      customerId: '#CR84578',
      gender: 'Female',
      phoneNumber: '+1 42567 12345',
      email: 'hello@example.com',
      createdAt: '26 Nov, 2025 - 03:15 PM',
      status: 'Active',
      profilePic: '👤',
    ),
    Customer(
      name: 'Jim Vickers',
      customerId: '#CR5458',
      gender: 'Male',
      phoneNumber: '+1 78912 34567',
      email: 'jim@example.com',
      createdAt: '27 Nov, 2025 - 09:30 AM',
      status: 'Disabled',
      profilePic: '👨',
    ),
    Customer(
      name: 'David Belcher',
      customerId: '#4A90E2',
      gender: 'Male',
      phoneNumber: '+1 23456 78901',
      email: 'david@example.com',
      createdAt: '12 Dec, 2025 - 09:15 AM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Nancy Chapman',
      customerId: '#7ED321',
      gender: 'Female',
      phoneNumber: '+1 34567 89012',
      email: 'nancy@example.com',
      createdAt: '14 Jan, 2025 - 11:30 AM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'Julie Kangas',
      customerId: '#D0D21B',
      gender: 'Female',
      phoneNumber: '+1 45678 90123',
      email: 'julie@example.com',
      createdAt: '05 Feb, 2025 - 04:20 PM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'Robert Smith',
      customerId: '#CR1001',
      gender: 'Male',
      phoneNumber: '+1 11111 11111',
      email: 'robert@example.com',
      createdAt: '10 Feb, 2025 - 05:30 PM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Emily Davis',
      customerId: '#CR1002',
      gender: 'Female',
      phoneNumber: '+1 22222 22222',
      email: 'emily@example.com',
      createdAt: '11 Feb, 2025 - 06:45 PM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'Michael Brown',
      customerId: '#CR1003',
      gender: 'Male',
      phoneNumber: '+1 33333 33333',
      email: 'michael@example.com',
      createdAt: '12 Feb, 2025 - 07:15 AM',
      status: 'Disabled',
      profilePic: '👨',
    ),
    Customer(
      name: 'Sarah Wilson',
      customerId: '#CR1004',
      gender: 'Female',
      phoneNumber: '+1 44444 44444',
      email: 'sarah@example.com',
      createdAt: '13 Feb, 2025 - 08:30 AM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'John Martinez',
      customerId: '#CR1005',
      gender: 'Male',
      phoneNumber: '+1 55555 55555',
      email: 'john@example.com',
      createdAt: '14 Feb, 2025 - 09:45 AM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Jennifer Taylor',
      customerId: '#CR1006',
      gender: 'Female',
      phoneNumber: '+1 66666 66666',
      email: 'jennifer@example.com',
      createdAt: '15 Feb, 2025 - 10:20 AM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'James Anderson',
      customerId: '#CR1007',
      gender: 'Male',
      phoneNumber: '+1 77777 77777',
      email: 'james@example.com',
      createdAt: '16 Feb, 2025 - 11:15 AM',
      status: 'Disabled',
      profilePic: '👨',
    ),
    Customer(
      name: 'Patricia Thomas',
      customerId: '#CR1008',
      gender: 'Female',
      phoneNumber: '+1 88888 88888',
      email: 'patricia@example.com',
      createdAt: '17 Feb, 2025 - 12:30 PM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'Richard Jackson',
      customerId: '#CR1009',
      gender: 'Male',
      phoneNumber: '+1 99999 99999',
      email: 'richard@example.com',
      createdAt: '18 Feb, 2025 - 01:45 PM',
      status: 'Active',
      profilePic: '👨',
    ),
    Customer(
      name: 'Linda White',
      customerId: '#CR1010',
      gender: 'Female',
      phoneNumber: '+1 10101 01010',
      email: 'linda@example.com',
      createdAt: '19 Feb, 2025 - 02:20 PM',
      status: 'Active',
      profilePic: '👩',
    ),
    Customer(
      name: 'Charles Harris',
      customerId: '#CR1011',
      gender: 'Male',
      phoneNumber: '+1 20202 02020',
      email: 'charles@example.com',
      createdAt: '20 Feb, 2025 - 03:30 PM',
      status: 'Active',
      profilePic: '👨',
    ),
  ];

  late List<Customer> paginatedCustomers;
  late int totalPages;


  final TextEditingController _searchController = TextEditingController();
  final googleKey = GlobalKey<State<StatefulWidget>>();



  @override
  void initState() {
    super.initState();
    totalPages = (allCustomers.length / itemsPerPage).ceil();
    _loadPage(1);
  }

  void _loadPage(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
      int startIndex = (pageNumber - 1) * itemsPerPage;
      int endIndex = startIndex + itemsPerPage;
      paginatedCustomers = allCustomers.sublist(
        startIndex,
        endIndex > allCustomers.length ? allCustomers.length : endIndex,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width < 700
        ? 1
        : width < 1200
        ? 2
        : 3;

    return CustomDrawer(
       backgroundColor: AppColors.transparent,
      child: CustomScrollWrapper(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionHeader(
                  title: 'Customer',
                  titleStyle: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                  iconAsset: AppAssets.refreshMainIcon,
                  onIconTap: () {},
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: CustomTextField(
                        height: 48,
                        hint: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        controller: _searchController,
                        borderColor: AppColors.grey.withAlpha(
                          (0.3 * 255).toInt(),
                        ),
                        focusColor: AppColors.grey.withAlpha(
                          (0.3 * 255).toInt(),
                        ),
                        cursorColor: Colors.black.withAlpha(
                          (0.7 * 255).toInt(),
                        ),
                        borderWidth: 0.75,
                        fillColor: Colors.white,
                        suffixIcon: Icons.search,
                        iconSize: 14,
                        iconColor: Colors.black,
                        textStyle: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        isLabel: false,
                      ),
                    ),
                    const SizedBox(width: 12),

                    CustomButton2(
                      key: googleKey,
                      onPressed: () {},
                      btnName: 'Add New',
                      isDisable: false,
                      isAnimate: true,
                      isBold: true,
                      buttonHeight: 35,
                      buttonWidth: 130,
                      size: ButtonSize.medium,
                      textSize: 14,
                      textColor: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      buttonColor: AppColors.primaryColor,
                      borderColor: Colors.black.withAlpha(
                        (0.2 * 255).toInt(),
                      ),
                      hideBackground: false,
                      icon: SvgPicture.asset(
                        AppAssets.plusIcon,
                        width: 20,
                        height: 20,
                      ),
                      iconNeed: true,
                      showBorder: false,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 230,
              ),
              itemCount: paginatedCustomers.length,
              itemBuilder: (context, index) {
                return CustomerCard(customer: paginatedCustomers[index]);
              },
            ),
            const SizedBox(height: 16),
            // Pagination Footer

            CustomPaginationWidget(
              currentPage: currentPage,
              totalPages: totalPages,
              onPageChanged: (page) {
                setState(() => currentPage = page);
                _loadPage(page);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  final Customer customer;

  const CustomerCard({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderLineColor, width: 1),

      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Name and ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.profileIcon, width: 30),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      customer.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      customer.gender,
                      style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 13, color: AppColors.greyShade, fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration:  BoxDecoration(
                  color: Colors.black.withValues(alpha: 248),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    customer.customerId,
                    style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Phone
          Row(
            children: [
              const Icon(Icons.phone, size: 14, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Phone Number',
                  style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14, color: AppColors.greyShade, fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Text(
                customer.phoneNumber,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Email
          Row(
            children: [
              const Icon(Icons.email, size: 14, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Email',
                  style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14, color: AppColors.greyShade, fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Text(
                customer.email,
                style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          const SizedBox(height: 8),
          // Created At
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Created at',
                  style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14, color: AppColors.greyShade, fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Text(
                customer.createdAt,
                style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),

          Spacer(),
          CustomDivider.dotted(
            thickness: 0.56,
            verticalPadding: 0,
            dotSize: 1.4,
            dotGap: 3,
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: customer.status == 'Active' ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  customer.status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: customer.status == 'Active' ? Colors.green : Colors.red,
                  ),
                ),
              ),
              CustomEditDeleteBtn(
                onDelete: (){

                },
                onEdit: (){

                },

              ),
            ],
          ),
        ],
      ),
    );
  }
}
