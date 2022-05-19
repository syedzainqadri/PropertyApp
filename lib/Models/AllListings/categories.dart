import 'dart:convert';

import 'package:get/get.dart';

class AllListingsCategories {
  late String name, slug, taxonomy, description, filter;

  late int parent, count, term_group, term_taxonomy_id, term_id;
  AllListingsCategories.fromJson(data) {
    term_id = data['term_id'];
    name = data['name'];
    slug = data['slug'];
    term_group = data['term_group'];
    term_taxonomy_id = data['term_taxonomy_id'];
    taxonomy = data['taxonomy'];
    description = data['description'];
    parent = data['parent'];
    count = data['count'];
    filter = data['filter'];
  }
}
