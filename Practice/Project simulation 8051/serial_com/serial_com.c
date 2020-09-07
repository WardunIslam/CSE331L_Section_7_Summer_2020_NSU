#include <REGX51.H>                 

void cct_init(void);

void SerialInitialize(void);

void uart_msg(unsigned char *c);

void uart_tx(unsigned char);  

void delay(int);

sbit E = P1^0;

sbit RS = P1^1;

void main()

{
	
	  cct_init();

    SerialInitialize();   

    EA = 1;

    ES = 1;

    uart_msg("Initializing Serial Communication");

                uart_tx(0x0d);

                uart_msg("1,2,3,4 key can on leds and a,b,c,d can off them respectively.");

                uart_tx(0x0d);                                                   //next line

                uart_msg("Press the key for particular LED");

                uart_tx(0x0d);
		
		RS  = 0;
	  P2 = 0x38;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
		RS  = 0;
		P2 = 0x0C;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
	  RS  = 0;
		P2 = 0x01;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
	  RS  = 0;
		P2 = 0x80;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
		
		RS = 1;
		P2 = 'H';
		E = 1;
		delay(150);
		E = 0;
		delay(150);

    while(1);

}




void cct_init(void)            //initialize cct

{

    P0 = 0x00;                                        //not used

    P1 = 0x00;                                        //output port used for leds

    P2 = 0x00;                                        //not used

    P3 = 0x03;                                        //used for serial communication

}


void SerialInitialize(void)       //Initialize Serial Port

{

    TMOD = 0x20;                   //Timer 1 In Mode 2 -Auto Reload to Generate Baud Rate

    SCON = 0x50;                    //Serial Mode 1, 8-Data Bit, REN Enabled

    TH1 = 0xFD;                       //Load Baud Rate 9600 To Timer Register

    TR1 = 1;                              //Start Timer

}

void uart_msg(unsigned char *c)

{

                while(*c != 0)

                {

                                uart_tx(*c++);

                }

}




void uart_tx(unsigned char serialdata)

{

    SBUF = serialdata;                        //Load Data to Serial Buffer Register

    while(TI == 0);                               //Wait Until Transmission To Complete

    TI = 0;                                                //Clear Transmission Interrupt Flag

}
void serial_ISR (void) interrupt 4

{

    char chr;                                           //receive character

    if(RI==1)

    {

        chr = SBUF;

        RI = 0;
			
    }
		
		RS  = 0;
	  P2 = 0x38;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
		RS  = 0;
		P2 = 0x0C;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
	  RS  = 0;
		P2 = 0x01;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
	  RS  = 0;
		P2 = 0x80;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
		
		RS = 1;
		P2 = chr;
		E = 1;
		delay(150);
		E = 0;
		delay(150);
		
    RI = 0;

}

void delay(int n){
	int i,j;
	for(i=0;i<n;i++)
	for(j=0;j<112;j++);
}
