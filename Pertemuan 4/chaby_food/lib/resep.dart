class RestaurantModel {
  final String nama;
  final String rating;
  final String lokasi;
  final String keterangan;
  final String image;
  RestaurantModel(
      {required this.nama,
      required this.rating,
      required this.lokasi,
      required this.keterangan,
      required this.image});
}

List<RestaurantModel> listRestaurant = [
  RestaurantModel(
      nama: 'Pempek',
      rating: '4.9',
      lokasi: 'Palembang',
      keterangan:
          'Pempek atau empek-empek adalah makanan yang terbuat dari daging ikan yang digiling lembut yang dicampur tepung kanji atau tepung sagu, serta komposisi beberapa bahan lain seperti telur, bawang putih yang dihaluskan, penyedap rasa, dan garam.',
      image: 'assets/images/1.jpg'),
  RestaurantModel(
      nama: 'Soto',
      rating: '4.2',
      lokasi: 'Majalengka',
      keterangan:
          'Soto, sroto, sauto, tauto, atau coto adalah makanan khas Indonesia seperti sop yang terbuat dari kaldu daging dan sayuran. Daging yang paling sering digunakan adalah daging sapi dan daging ayam, tetapi ada pula yang menggunakan daging babi atau daging kambing.',
      image: 'assets/images/2.jpg'),
  RestaurantModel(
      nama: 'Gudeg',
      rating: '4.1',
      lokasi: 'Yogyakarta',
      keterangan:
          'Gudeg adalah hidangan khas Provinsi Yogyakarta dan Jawa Tengah yang terbuat dari nangka muda yang dimasak dengan santan. Perlu waktu berjam-jam untuk membuat hidangan ini. Warna coklat biasanya dihasilkan oleh daun jati yang dimasak bersamaan.',
      image: 'assets/images/3.jpg'),
  RestaurantModel(
      nama: 'Rendang',
      rating: '4.6',
      lokasi: 'Karawang',
      keterangan:
          'Rendang atau randang dalam bahasa Minangkabau adalah Masakan Minangkabau yang berbahan dasar daging yang berasal dari Sumatera Barat, Indonesia. Masakan ini dihasilkan dari proses memasak suhu rendah dalam waktu lama dengan menggunakan aneka rempah-rempah dan santan.',
      image: 'assets/images/4.jpg'),
];
