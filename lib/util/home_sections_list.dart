import 'enums/books.dart';

String imgUrl =
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/action-thriller-book-cover-design-template-3675ae3e3ac7ee095fc793ab61b812cc_screen.jpg?ts=1588152105';

String imgUrl2 =
    'https://www.adobe.com/express/discover/ideas/media_1e0050318770e4a770caf5515f8120a3ea48c7c07.png?width=2000&format=webply&optimize=medium';

String des =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.';

List<Map<String, Object>> homeSections = [
  {
    'id': '1',
    'title': 'For You',
    'size': BookItemSize.Large,
    'view': ViewStyle.Horizontal,
    'books': [
      {
        'id': '1',
        'title': 'Title',
        'author': 'Author',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '2',
        'title': 'Title1',
        'author': 'Author',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '3',
        'title': 'Title2',
        'author': 'Author2',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '4',
        'title': 'Title3',
        'author': 'Author3',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
    ],
  },
  {
    'id': '2',
    'title': 'Popular',
    'size': BookItemSize.Normal,
    'view': ViewStyle.Horizontal,
    'books': [
      {
        'id': '1',
        'title': 'Title4',
        'author': 'Author4',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '2',
        'title': 'Title5',
        'author': 'Author5',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '3',
        'title': 'Title6',
        'author': 'Author6',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
      {
        'id': '4',
        'title': 'Title7',
        'author': 'Author7',
        'image': imgUrl2,
        'description': des,
        'saved': false,
      },
    ],
  },
  {
    'id': '3',
    'title': 'Recently Added',
    'size': BookItemSize.Small,
    'view': ViewStyle.Vertical,
    'books': [
      {
        'id': '1',
        'title': 'Title8',
        'author': 'Author8',
        'image': imgUrl,
        'description': des,
        'saved': false,
      },
      {
        'id': '2',
        'title': 'Title9',
        'author': 'Author9',
        'image': imgUrl,
        'description': des,
        'saved': false,
      },
      {
        'id': '3',
        'title': 'Title10',
        'author': 'Author10',
        'image': imgUrl,
        'description': des,
        'saved': false,
      },
      {
        'id': '4',
        'title': 'Title11',
        'author': 'Author11',
        'image': imgUrl,
        'description': des,
        'saved': false,
      },
    ],
  },
];
