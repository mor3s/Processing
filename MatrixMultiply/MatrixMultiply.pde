PVector v = new PVector(100, 75, 50);

float[][] vecToMatrix(PVector v) {
  float[][] m = new float[3][1];
  m[0][0] = v.x;
  m[1][0] = v.y;
  m[2][0] = v.z;

  return m;
}
PVector matrixToVec(float[][] m) {
  PVector v = new PVector();
  v.x = m[0][0];
  v.y = m[1][0];
  if (m.length > 2) {
    v.z = m[2][0];
  }
  return v;
}

float[][] projection = {
  {1, 0, 0}, 
  {0, 1, 0}
};

float[][] mtxmult(float[][] a, PVector b) {
  float[][] m = vecToMatrix(b);
  return mtxmult(a,m);
}
float[][] mtxmult(float[][] a, float[][] b) {
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;

  if (colsA != rowsB) {
    println("Columns of A must match rows of B");
    return null;
  }

  float[][] result = new float[rowsA][colsB];
  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      int sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += a[i][k] * b [k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}


void setup() {
  
  logMatrix(projection);
  float[][] point = vecToMatrix(v);
  logMatrix(point);
  float[][] result = mtxmult(projection, point);
  logMatrix(result);
  PVector v = matrixToVec(result);
  println(v);
}

void logMatrix(float[][] m) {
  int cols = m[0].length;
  int rows = m.length;
  println(rows + "x" + cols);
  println("-----------------");
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print(m[i][j] + " ");
    }
    println();
  }
  println();
}
