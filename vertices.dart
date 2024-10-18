// Representasi Graf dengan matriks jarak
var graph = [
  [0, 8, 3, 4, 10],  // Distances from A
  [8, 0, 5, 2, 7],   // Distances from B
  [3, 5, 0, 1, 6],   // Distances from C
  [4, 2, 1, 0, 3],   // Distances from D
  [10, 7, 6, 3, 0]   // Distances from E
];

void tsp() {
  // Jumlah node
  int n = graph.length;

  // Array untuk melacak apakah node telah dikunjungi
  List<bool> visited = List.filled(n, false);

  // Mulai dari simpul pertama (A -> index 0)
  int startNode = 0;
  int currentNode = startNode;
  visited[currentNode] = true;

  List<int> path = [startNode]; // menyimpan jalur perjalanan
  int totalDistance = 0;

  while (path.length < n) {
    int nearestNode = -1;
    int nearestDistance = 1 << 30;  // Menggunakan nilai besar sebagai pengganti infinity

    // Temukan tetangga terdekat yang belum dikunjungi
    for (int i = 0; i < n; i++) {
      if (!visited[i] && graph[currentNode][i] != 0) {
        if (graph[currentNode][i] < nearestDistance) {
          nearestDistance = graph[currentNode][i];
          nearestNode = i;
        }
      }
    }

    // Update jalur dan total jarak
    if (nearestNode != -1) {
      path.add(nearestNode);
      totalDistance += nearestDistance;
      visited[nearestNode] = true;
      currentNode = nearestNode;
    }
  }

  // Kembali ke node awal (melengkapi siklus)
  totalDistance += graph[currentNode][startNode];
  path.add(startNode); // Tambahkan node awal ke jalur

  // Output hasil
  print("Jalur perjalanan: ${path.map((e) => String.fromCharCode(65 + e)).join(' -> ')}");
  print("Total jarak: $totalDistance");
}

void main() {
  tsp();
}
