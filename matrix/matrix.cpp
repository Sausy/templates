#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#include <iostream>
#include <iomanip>
#include <stdexcept>
#include <vector>
#include <math.h>

#include <matrix.hpp>

matrixClass::matrixClass(){

}

double matrixClass::getDeterminant(const std::vector<std::vector<double>> vect) {
    if(vect.size() != vect[0].size()) {
        throw std::runtime_error("Matrix is not quadratic");
    }
    int dimension = vect.size();

    if(dimension == 0) {
        return 1;
    }

    if(dimension == 1) {
        return vect[0][0];
    }

    //Formula for 2x2-matrix
    if(dimension == 2) {
        return vect[0][0] * vect[1][1] - vect[0][1] * vect[1][0];
    }

    double result = 0;
    int sign = 1;
    for(int i = 0; i < dimension; i++) {

        //Submatrix
        std::vector<std::vector<double>> subVect(dimension - 1, std::vector<double> (dimension - 1));
        for(int m = 1; m < dimension; m++) {
            int z = 0;
            for(int n = 0; n < dimension; n++) {
                if(n != i) {
                    subVect[m-1][z] = vect[m][n];
                    z++;
                }
            }
        }

        //recursive call
        result = result + sign * vect[0][i] * getDeterminant(subVect);
        sign = -sign;
    }

    return result;
}

std::vector<std::vector<double>> matrixClass::getTranspose(const std::vector<std::vector<double>> matrix1) {

    //Transpose-matrix: height = width(matrix), width = height(matrix)
    std::vector<std::vector<double>> solution(matrix1[0].size(), std::vector<double> (matrix1.size()));

    //Filling solution-matrix
    for(size_t i = 0; i < matrix1.size(); i++) {
        for(size_t j = 0; j < matrix1[0].size(); j++) {
            solution[j][i] = matrix1[i][j];
        }
    }
    return solution;
}

std::vector<std::vector<double>> matrixClass::getCofactor(const std::vector<std::vector<double>> vect) {
    if(vect.size() != vect[0].size()) {
        throw std::runtime_error("Matrix is not quadratic");
    }

    std::vector<std::vector<double>> solution(vect.size(), std::vector<double> (vect.size()));
    std::vector<std::vector<double>> subVect(vect.size() - 1, std::vector<double> (vect.size() - 1));

    for(std::size_t i = 0; i < vect.size(); i++) {
        for(std::size_t j = 0; j < vect[0].size(); j++) {

            int p = 0;
            for(size_t x = 0; x < vect.size(); x++) {
                if(x == i) {
                    continue;
                }
                int q = 0;

                for(size_t y = 0; y < vect.size(); y++) {
                    if(y == j) {
                        continue;
                    }

                    subVect[p][q] = vect[x][y];
                    q++;
                }
                p++;
            }
            solution[i][j] = pow(-1, i + j) * getDeterminant(subVect);
        }
    }
    return solution;
}

std::vector<std::vector<double>> matrixClass::getInverse(const std::vector<std::vector<double>> vect) {
    if(getDeterminant(vect) == 0) {
        throw std::runtime_error("Determinant is 0");
    }

    double d = 1.0/getDeterminant(vect);
    std::vector<std::vector<double>> solution(vect.size(), std::vector<double> (vect.size()));

    for(size_t i = 0; i < vect.size(); i++) {
        for(size_t j = 0; j < vect.size(); j++) {
            solution[i][j] = vect[i][j];
        }
    }

    solution = getTranspose(getCofactor(solution));

    for(size_t i = 0; i < vect.size(); i++) {
        for(size_t j = 0; j < vect.size(); j++) {
            solution[i][j] *= d;
        }
    }

    return solution;
}

void matrixClass::printMatrix(const std::vector<std::vector<double>> vect) {
    for(std::size_t i = 0; i < vect.size(); i++) {
        for(std::size_t j = 0; j < vect[0].size(); j++) {
            std::cout << std::setw(8) << vect[i][j] << " ";
        }
        std::cout << "\n";
    }
}

std::vector<std::vector<double>> matrixClass::calcPseudoInversMatrix(const std::vector<std::vector<double>> vect){
  //double A[][VECSIZE], double retMatrix[][VECSIZE]
  //debug matrix
  std::vector<std::vector<double>> matrix(3, std::vector<double> (3));
  matrix = {
    {1,2,3},
    {4,5,6},
    {7,8,8}
  };
  printMatrix(getInverse(matrix));

}

std::vector<std::vector<double>> matrixClass::dotProduct(const std::vector<std::vector<double>> A,const std::vector<std::vector<double>> B){

  double valBuffer = 0.0;
  double multBuffer = 0.0;

  uint8_t m = A.size();
  uint8_t n = B[0].size();
  std::vector<std::vector<double>> ret(m, std::vector<double> (n));


  for (std::size_t colCnt = 0; colCnt < n; colCnt++) {
    for (std::size_t rowCnt = 0; rowCnt < m; rowCnt++) {
      for (std::size_t i = 0; i < A[0].size(); i++) {
        multBuffer = A[rowCnt][i] * B[i][colCnt];
        valBuffer +=multBuffer;
      }
      ret[rowCnt][colCnt] = valBuffer;

      multBuffer=0;
      valBuffer =0;
    }

  }

  return ret;
}
