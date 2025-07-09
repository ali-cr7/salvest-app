import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/Electronic Certificate/electronic_certificate_bloc.dart';
import 'package:salvest_app/business_logic/Electronic Certificate/electronic_certificate_state.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';

import 'package:salvest_app/utility/app_assests.dart';

class InvestingCertificationDetailsView extends StatelessWidget {
  const InvestingCertificationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Certification',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<ElectronicCertificateBloc, ElectronicCertificateState>(
        builder: (context, state) {
          if (state is ElectronicCertificateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ElectronicCertificateLoaded) {
            final certificate = state.certificates.first;

            // تجهيز روابط الصور
            String rawBase = APIConfig.baseUrl;
            if (rawBase.endsWith('/'))
              rawBase = rawBase.substring(0, rawBase.length - 1);
            final baseUri = Uri.parse(rawBase);
            final frontUri = baseUri.resolve(
              certificate.requestFromAdmin?.frontImage ?? '',
            );
            final backUri = baseUri.resolve(
              certificate.requestFromAdmin?.backImage ?? '',
            );

            return Center(
              child: Container(
                width: 349,
                // apply dynamic height based on content
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [
                      const Color(0xFF9A8AEC).withOpacity(0.5),
                      const Color(0xFF786CB9).withOpacity(0.5),
                      const Color(0xFF685D9F).withOpacity(0.5),
                      const Color(0xFF574E86).withOpacity(0.5),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(width: 3, color: Color(0xFF836DF3)),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoRow('Seller Name:', certificate.sellerName),
                      _infoRow('Location:', certificate.propertyLocation),
                      _infoRow('Lawyer:', certificate.lawyerName),
                      _infoRow('Price:', certificate.propertyPrice),
                      _infoRow('Payment Method:', certificate.paymentMethod),
                      _infoRow('Status:', certificate.requestFromAdmin?.status),
                      _infoRow(
                        'Type:',
                        certificate.requestFromAdmin?.typeRequest,
                      ),
                      _infoRow(
                        'Created At:',
                        certificate.createdAt
                            ?.toLocal()
                            .toString()
                            .split(' ')
                            .first,
                      ),
                      const SizedBox(height: 20),
                      _imageSection(
                        url: frontUri.toString(),
                        label: 'Front Image',
                      ),
                      const SizedBox(height: 12),
                      _imageSection(
                        url: backUri.toString(),
                        label: 'Back Image',
                      ),
                      const SizedBox(height: 16),
                      // ختم الأيقونة أسفل صورة Back
                      Center(
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 2,
                                color: Color(0xFF685D9F),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AppAssets.appICnon,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ElectronicCertificateError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _infoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: value ?? '—',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageSection({required String url, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder:
                  (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 40),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
