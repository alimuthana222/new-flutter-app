import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_tile.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy transactions
    final transactions = [
      {
        'id': '1',
        'type': 'earned',
        'title': 'جلسة تعليم Flutter',
        'amount': '+2',
        'date': 'اليوم',
        'icon': Iconsax.arrow_down,
        'color': AppColors.success,
      },
      {
        'id': '2',
        'type': 'spent',
        'title': 'جلسة تعلم التصميم',
        'amount': '-1',
        'date': 'أمس',
        'icon': Iconsax.arrow_up,
        'color': AppColors.error,
      },
      {
        'id': '3',
        'type': 'purchased',
        'title': 'شراء 5 ساعات',
        'amount': '+5',
        'date': 'منذ 3 أيام',
        'icon': Iconsax.shopping_cart,
        'color': AppColors.info,
      },
      {
        'id': '4',
        'type': 'welcome',
        'title': 'رصيد ترحيبي',
        'amount': '+5',
        'date': 'منذ أسبوع',
        'icon': Iconsax.gift,
        'color': AppColors.accent,
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.wallet,
        showBackButton: true,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.document_text),
            onPressed: () => context.push('/transactions'),
            tooltip: AppStrings.transactions,
          ),
        ],
      ),
      body: Column(
        children: [
          // Balance Card
          const BalanceCard(balance: 5),

          const SizedBox(height: 16),

          // Quick actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/buy-hours'),
                    icon: const Icon(Iconsax.add_circle),
                    label: const Text(AppStrings.buyHours),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Recent transactions header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.recentTransactions,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () => context.push('/transactions'),
                  child: const Text(AppStrings.seeAll),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Transactions list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionTile(
                  icon: transaction['icon'] as IconData,
                  title: transaction['title'] as String,
                  amount: transaction['amount'] as String,
                  date: transaction['date'] as String,
                  color: transaction['color'] as Color,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
