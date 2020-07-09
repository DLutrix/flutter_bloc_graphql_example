const String seasonQuery = r'''
  query SeasonQuery($nPage: Int!, $nPerPage: Int!, $nSeasonYear: Int!, $nIsAdult: Boolean!, $nSeason: MediaSeason!) {
    page: Page(page: $nPage, perPage: $nPerPage) {
      media(season: $nSeason, seasonYear: $nSeasonYear, isAdult: $nIsAdult) {
        id
        title {
          userPreferred
          native
        }
        coverImage {
          extraLarge
          large
          medium
          color
        }
      }
    }
  }
''';
