class NewsModel {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  DateTime? publishedDate;
  DateTime? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  dynamic column;
  String? byline;
  String? type;
  String? title;
  String? resultAbstract;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  NewsModel({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.resultAbstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        source: json["source"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        section: json["section"],
        subsection: json["subsection"],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        type: json["type"],
        title: json["title"],
        resultAbstract: json["abstract"],
        desFacet: json["des_facet"] == null
            ? []
            : List<String>.from(json["des_facet"]!.map((x) => x)),
        orgFacet: json["org_facet"] == null
            ? []
            : List<String>.from(json["org_facet"]!.map((x) => x)),
        perFacet: json["per_facet"] == null
            ? []
            : List<String>.from(json["per_facet"]!.map((x) => x)),
        geoFacet: json["geo_facet"] == null
            ? []
            : List<String>.from(json["geo_facet"]!.map((x) => x)),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
        etaId: json["eta_id"],
      );
}

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadatum>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: json["media-metadata"] == null
            ? []
            : List<MediaMetadatum>.from(
                json["media-metadata"]!.map((x) => MediaMetadatum.fromJson(x))),
      );
}

class MediaMetadatum {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadatum({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
      );
}
