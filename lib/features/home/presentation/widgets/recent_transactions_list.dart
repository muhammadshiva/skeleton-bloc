import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../utils/extensions.dart';

class RecentTransactionsList extends StatelessWidget {
  final List<String> transactions;
  final bool isLoading;

  const RecentTransactionsList({super.key, required this.transactions, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.elevationMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusLarge)),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: context.colorScheme.primary,
                  size: AppDimensions.iconMedium,
                ),
                const SizedBox(width: AppDimensions.paddingSmall),
                Text(
                  'Recent Transactions',
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            if (isLoading)
              _buildLoadingList()
            else if (transactions.isEmpty)
              _buildEmptyState(context)
            else
              _buildTransactionsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingList() {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.greyLight.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 48,
            color: AppColors.textSecondary.withOpacity(0.7),
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          Text(
            'No transactions yet',
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppDimensions.paddingSmall),
          Text(
            'Your recent transactions will appear here',
            style: context.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length > 5 ? 5 : transactions.length,
      separatorBuilder: (context, index) => const Divider(height: 1, thickness: 0.5),
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingSmall,
            horizontal: AppDimensions.paddingSmall,
          ),
          leading: CircleAvatar(
            backgroundColor: context.colorScheme.primary.withOpacity(0.1),
            child: Icon(
              Icons.payment,
              color: context.colorScheme.primary,
              size: AppDimensions.iconSmall,
            ),
          ),
          title: Text(
            transaction,
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Transaction ${index + 1}',
            style: context.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: AppDimensions.iconSmall,
            color: AppColors.textSecondary,
          ),
        );
      },
    );
  }
}
