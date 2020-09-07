#include <REGX51.H>

sbit led = P1^0;

void delay();

void main(){
	led = 0;
	while(1){
		led = 1;
		delay();
		led = 0;
		delay();
	}
}

void delay(){
		
	int i = 100;
	
	TMOD = 0x01;
	TH0 = 0xDC;
	TL0 = 0x00;
	
	while(i != 0){
		TR0 = 1;
		while(TF0);
	
		TR0 = 0;
		TF0 = 0;
		i--;
	}
	
}