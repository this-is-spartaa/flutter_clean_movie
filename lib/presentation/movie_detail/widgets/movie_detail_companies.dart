import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';

class MovieDetailCompanies extends StatelessWidget {
  const MovieDetailCompanies({
    super.key,
    required this.detail,
  });

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: detail.productionCompanyLogos.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white.withOpacity(0.9),
            padding: const EdgeInsets.all(20),
            child: Image.network(
              detail.productionCompanyLogos[index],
            ),
          );
        },
      ),
    );
  }
}
