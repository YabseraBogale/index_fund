#include "IntRateCalculator.h"

#include <cmath>
#include <iostream>

int main(int argc,const char *argv[]){
  if(argc!=3){
    std::cout<<"usage: progName <interest rate> <value>"<<std::endl;
    return 1;
  }
  double rate= std::atof(argv[1]);
  double value= std::atof(argv[2]);

  IntRateCalculator irCalculator(rate);
  double res= irCalculator.singlePeriod(value);
  std::cout<<"result is "<<res<<std::endl;
  
  return 0;
}
