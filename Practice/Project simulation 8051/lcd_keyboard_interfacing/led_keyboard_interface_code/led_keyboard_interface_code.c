#include <REGX51.H>

void lcd_init();
void lcd_next_line();
void write_cmd(int);
void write_data(char);
void check_row_for_col1();
void check_row_for_col2();
void check_row_for_col3();
void delay(int ms);

sbit E = P1^0;
sbit RS = P1^1;
sbit led = P1^2;

sbit col1 = P3^0;
sbit col2 = P3^1;
sbit col3 = P3^2;

sbit row1 = P3^3;
sbit row2 = P3^4;
sbit row3 = P3^5;
sbit row4 = P3^6;

void main(){
	
	P0 = 0x00;
	P1 = 0x00;
	P2 = 0x00;
	P3 = 0xF0;
	led = 1;
	lcd_init();
	write_data('W');
	delay(500000);
	write_data('E');
	delay(500000);
	write_data('L');
	delay(500000);
	write_data('C');
	delay(500000);
	write_data('O');
	delay(500000);
	write_data('M');
	delay(500000);
	write_data('E');
	delay(500000);
	lcd_next_line();
	write_data('P');
	delay(500000);
	write_data('R');
	delay(500000);
	write_data('E');
	delay(500000);
	write_data('S');
	delay(500000);
	write_data('S');
	delay(500000);
	write_data(':');
	delay(500000);
	write_data(' ');
	delay(500000);
	
	while(1){
		
		col1 = col2 = col3 = 1;
		row1 = row2 = row3 = row4 = 0;
		
		if(col1 == 0) 
			 check_row_for_col1();
		else if(col2 == 0) 
			 check_row_for_col2();
		else if(col3 == 0) 
			 check_row_for_col3();
	}
	
}

void lcd_init(){
	write_cmd(0x38);    //for 8 bit mode

	write_cmd(0x0C);    //display on, cursor off

	write_cmd(0x01);    //clear display

	write_cmd(0x80);    //force cursor to beginning of 1st line
}
 
void lcd_next_line(){
	write_cmd(0xC0);    //force cursor to beginning of 2nd line
}

void write_cmd(int cmd){
	
	RS = 0;
	P2 = cmd;
	
	E = 1;
	delay(150);
	E = 0;
	delay(150);
	
}

void write_data(char value){
	
	RS = 1;
	P2 = value;
	
	E = 1;
	delay(150);
	E = 0;
	delay(150);
	
}

void delay(int ms){
	int i = 0;
	for(i = 0; i<ms; i++);
}

void check_row_for_col1(){
	
	row1 = row2 = row3 = row4 = 1;
	
	row1 = 0;
	if(col1 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('1');
	}
	row1 = 1;
	
	row2 = 0;
	if(col1 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('4');
	}
	row2 = 1;
	
	row3 = 0;
	if(col1 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('7');
	}
	row3 = 1;
	
	row4 = 0;
	if(col1 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('*');
	}
	row4 = 1;
	
}

void check_row_for_col2(){
	
	row1 = row2 = row3 = row4 = 1;
	
	row1 = 0;
	if(col2 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('2');
	}
	row1 = 1;
	
	row2 = 0;
	if(col2 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('5');
	}
	row2 = 1;
	
	row3 = 0;
	if(col2 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('8');
	}
	row3 = 1;
	
	row4 = 0;
	if(col2 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('0');
	}
	row4 = 1;
	
}

void check_row_for_col3(){
	
	row1 = row2 = row3 = row4 = 1;
	
	row1 = 0;
	if(col3 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('3');
	}
	row1 = 1;
	
	row2 = 0;
	if(col3 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('6');
	}
	row2 = 1;
	
	row3 = 0;
	if(col3 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('9');
	}
	row3 = 1;
	
	row4 = 0;
	if(col3 == 0){
		write_cmd(0x01);    //clear display
	  write_cmd(0x80);    //force cursor to beginning of 1st line
		write_data('#');
	}
	row4 = 1;
	
}





