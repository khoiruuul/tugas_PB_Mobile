// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'sql_helper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> _datas = [];

  bool _loading = true;
  void _perbaruiData() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _datas = data;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _perbaruiData();
  }

  final TextEditingController _produkController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  void _munculData(int? id) async {
    if (id != null) {
      final existingJournal =
          _datas.firstWhere((element) => element['id'] == id);
      _produkController.text = existingJournal['produk'];
      _deskripsiController.text = existingJournal['deskripsi'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _produkController,
              decoration:
                  const InputDecoration(hintText: 'Masukan nama produk'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(hintText: 'Masukan deskripsi'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _tambahItem();
                }
                if (id != null) {
                  await _updateItem(id);
                }
                _produkController.text = '';
                _deskripsiController.text = '';
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Buat baru' : 'Edit'),
            )
          ],
        ),
      ),
    );
  }

// Menambahkan data
  Future<void> _tambahItem() async {
    await SQLHelper.createItem(
        _produkController.text, _deskripsiController.text);
    _perbaruiData();
  }

  // Mengupdate data
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _produkController.text, _deskripsiController.text);
    _perbaruiData();
  }

  // Menghapus data
  void _hapusItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Berhasil menghapus data'),
    ));
    _perbaruiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 7'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _datas.length,
              itemBuilder: (context, index) => Card(
                color: Colors.blue[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(_datas[index]['produk']),
                    subtitle: Text(_datas[index]['deskripsi']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _munculData(_datas[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _hapusItem(_datas[index]['id']),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _munculData(null),
        tooltip: 'Masuk',
        label: const Text('Klik Untuk Menambahkan'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
