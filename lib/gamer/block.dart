import 'gamer.dart';
import 'dart:math' as math;

// Konstanta yang mendefinisikan bentuk-bentuk dari blok-blok dalam permainan Tetris
const BLOCK_SHAPES = {
  BlockType.I: [
    [1, 1, 1, 1]
  ],
  BlockType.L: [
    [0, 0, 1],
    [1, 1, 1],
  ],
  BlockType.J: [
    [1, 0, 0],
    [1, 1, 1],
  ],
  BlockType.Z: [
    [1, 1, 0],
    [0, 1, 1],
  ],
  BlockType.S: [
    [0, 1, 1],
    [1, 1, 0],
  ],
  BlockType.O: [
    [1, 1],
    [1, 1]
  ],
  BlockType.T: [
    [0, 1, 0],
    [1, 1, 1]
  ]
};

// Konstanta yang mendefinisikan posisi awal dari blok-blok
const START_XY = {
  BlockType.I: [3, 0],
  BlockType.L: [4, -1],
  BlockType.J: [4, -1],
  BlockType.Z: [4, -1],
  BlockType.S: [4, -1],
  BlockType.O: [4, -1],
  BlockType.T: [4, -1],
};

// Konstanta yang mendefinisikan titik pusat rotasi untuk masing-masing blok
const ORIGIN = {
  BlockType.I: [
    [1, -1],
    [-1, 1],
  ],
  BlockType.L: [
    [0, 0]
  ],
  BlockType.J: [
    [0, 0]
  ],
  BlockType.Z: [
    [0, 0]
  ],
  BlockType.S: [
    [0, 0]
  ],
  BlockType.O: [
    [0, 0]
  ],
  BlockType.T: [
    [0, 0],
    [0, 1],
    [1, -1],
    [-1, 0]
  ],
};

// Enumerasi yang mendefinisikan jenis-jenis blok
enum BlockType { I, L, J, Z, S, O, T }

// Kelas yang merepresentasikan blok dalam permainan Tetris
class Block {
  final BlockType type; // Jenis blok
  final List<List<int>> shape; // Bentuk blok
  final List<int> xy; // Koordinat x, y dari blok
  final int rotateIndex; // Indeks rotasi blok

  // Konstruktor untuk membuat objek Block
  Block(this.type, this.shape, this.xy, this.rotateIndex);

  // Metode untuk membuat blok jatuh
  Block fall({int step = 1}) {
    return Block(type, shape, [xy[0], xy[1] + step], rotateIndex);
  }

  // Metode untuk membuat blok bergerak ke kanan
  Block right() {
    return Block(type, shape, [xy[0] + 1, xy[1]], rotateIndex);
  }

  // Metode untuk membuat blok bergerak ke kiri
  Block left() {
    return Block(type, shape, [xy[0] - 1, xy[1]], rotateIndex);
  }

  // Metode untuk membuat blok berputar
  Block rotate() {
    List<List<int>> result =
        List.filled(shape[0].length, const [], growable: false);
    for (int row = 0; row < shape.length; row++) {
      for (int col = 0; col < shape[row].length; col++) {
        if (result[col].isEmpty) {
          result[col] = List.filled(shape.length, 0, growable: false);
        }
        result[col][row] = shape[shape.length - 1 - row][col];
      }
    }
    final nextXy = [
      this.xy[0] + ORIGIN[type]![rotateIndex][0],
      this.xy[1] + ORIGIN[type]![rotateIndex][1]
    ];
    final nextRotateIndex =
        rotateIndex + 1 >= ORIGIN[this.type]!.length ? 0 : rotateIndex + 1;

    return Block(type, result, nextXy, nextRotateIndex);
  }

  // Metode untuk memeriksa apakah blok bisa ditempatkan di dalam matriks tertentu
  bool isValidInMatrix(List<List<int>> matrix) {
    if (xy[1] + shape.length > GAME_PAD_MATRIX_H ||
        xy[0] < 0 ||
        xy[0] + shape[0].length > GAME_PAD_MATRIX_W) {
      return false;
    }
    for (var i = 0; i < matrix.length; i++) {
      final line = matrix[i];
      for (var j = 0; j < line.length; j++) {
        if (line[j] == 1 && get(j, i) == 1) {
          return false;
        }
      }
    }
    return true;
  }

  // Metode untuk mendapatkan nilai blok pada posisi tertentu dalam bentuk blok
  int? get(int x, int y) {
    x -= xy[0];
    y -= xy[1];
    if (x < 0 || x >= shape[0].length || y < 0 || y >= shape.length) {
      return null;
    }
    return shape[y][x] == 1 ? 1 : null;
  }

  // Metode untuk membuat objek Block dari jenis tertentu
  static Block fromType(BlockType type) {
    final shape = BLOCK_SHAPES[type];
    return Block(type, shape!, START_XY[type]!, 0);
  }

  // Metode untuk membuat blok acak
  static Block getRandom() {
    final i = math.Random().nextInt(BlockType.values.length);
    return fromType(BlockType.values[i]);
  }
}
