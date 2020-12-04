#pragma once

class matrixClass
{
  public:
    matrixClass();

    double getDeterminant(const std::vector<std::vector<double>> vect);
    std::vector<std::vector<double>> getTranspose(const std::vector<std::vector<double>> matrix1);
    std::vector<std::vector<double>> getCofactor(const std::vector<std::vector<double>> vect);
    std::vector<std::vector<double>> getInverse(const std::vector<std::vector<double>> vect);
    std::vector<std::vector<double>> dotProduct(const std::vector<std::vector<double>> A,const std::vector<std::vector<double>> B);

    void printMatrix(const std::vector<std::vector<double>> vect);

    std::vector<std::vector<double>> calcPseudoInversMatrix(const std::vector<std::vector<double>> vect);

};
