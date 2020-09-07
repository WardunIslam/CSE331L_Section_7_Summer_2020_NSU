#include <REGX51.H>

sbit w_high = P1^0;
sbit w_high_mid = P1^1;
sbit w_low_mid = P1^2;
sbit w_low = P1^3;

sbit E = P3^1;
sbit RS = P3^2;
sbit output = P3^0;

void main(){
	
	P0 = 0x00;
	P1 = 0x0F;
	P2 = 0x00;
	P3 = 0x00;
	output = 0;
	
	while(1){
			if(w_low == 1 && output == 0){
				output = 1;
			}
			if(w_low == 0){
				
			}
			if(w_low_mid == 0){
				
			}
			if(w_high_mid == 0){
				
			}
			if(w_high == 0){
				
			}
			if(w_high == 0){
				output = 0;
			}
	}
}

