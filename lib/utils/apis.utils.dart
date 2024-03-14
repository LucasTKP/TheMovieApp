class API {
  static String REQUEST_IMG(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';

  static String REQUEST_MOVIE_LIST(String page) {
    return 'list/1?page=$page.toString()';
  }
}
