import 'package:flutter/material.dart';
import 'package:news/core/widgets/zoomable_button.dart';
import 'package:news/features/news/models/news_model.dart';
import 'package:news/core/extensions/string.dart';
import 'package:news/core/extensions/date.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomableButton(
      onTap: () async {
        await _launchUrl(news.url);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: news.title?.toColor().withOpacity(0.5) ?? Colors.red.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            if (news.publishedDate != null)
              Text(
                "Published: ${news.publishedDate?.to_dMMMYY()}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            if (news.byline != null)
              Text(
                news.byline ?? "",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            const SizedBox(height: 8),
            Text(
              news.resultAbstract ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String? urlString) async {
    try {
      final Uri _url = Uri.parse(urlString ?? "");
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
