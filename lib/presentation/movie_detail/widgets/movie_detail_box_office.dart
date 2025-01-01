import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';

class MovieDetailBoxOffice extends StatelessWidget {
  const MovieDetailBoxOffice({
    super.key,
    required this.detail,
  });

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    final labels = [
      "평점",
      "평점투표수",
      "인기점수",
      "예산",
      "수익",
    ];
    final values = [
      detail.voteAverage,
      detail.voteCount,
      detail.popularity,
      '\$${detail.budget}',
      '\$${detail.revenue}',
    ];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${values[index]}'),
                Text(labels[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
