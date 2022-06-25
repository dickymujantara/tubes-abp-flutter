class Stories {
  String judul;
  String content;
  String imageAsset;

  Stories({
    required this.judul,
    required this.content,
    required this.imageAsset,
  });
}


var storyList = [
  Stories(
    judul: 'Cerita Farm House Lembang',
    content:
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    imageAsset: 'images/farm-house.jpg',
  ),
  Stories(
    judul: 'Cerita Taman Film',
    content:
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    imageAsset: 'images/taman-film.jpg',
  ),
  Stories(
    judul: 'Cerita Ranca Upas',
    content:
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    imageAsset: 'images/ranca-upas.jpg',
  ),
];