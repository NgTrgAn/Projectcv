#include <stdio.h>
#include "system.h"
#include "io.h"
char input_data[8] = {1, 2, 3, 4, 5, 6, 7, 8};

unsigned char *fir_base[16] = {
	// address 0 in fir designed
    (unsigned char*) (FIR_FILTER_0_BASE + 0x00),
	// address 1 in fir designed
	(unsigned char*) (FIR_FILTER_0_BASE + 0x04),
	// address 2 in fir designed
    (unsigned char*) (FIR_FILTER_0_BASE + 0x08),
	// address 3 in fir designed
	(unsigned char*) (FIR_FILTER_0_BASE + 0x0C),
	// address 4 in fir designed
    (unsigned char*) (FIR_FILTER_0_BASE + 0x10),
	// address 5 in fir designed
	(unsigned char*) (FIR_FILTER_0_BASE + 0x14),
	// address 6 in fir designed
    (unsigned char*) (FIR_FILTER_0_BASE + 0x18),
	// address 7 in fir designed
	(unsigned char*) (FIR_FILTER_0_BASE + 0x1C),
	// address 8 in fir designed
    (unsigned char*) (FIR_FILTER_0_BASE + 0x20),
	////////////////////////////////////////////
	(unsigned char*) (FIR_FILTER_0_BASE + 0x24),
    (unsigned char*) (FIR_FILTER_0_BASE + 0x28),
	(unsigned char*) (FIR_FILTER_0_BASE + 0x2C),
    (unsigned char*) (FIR_FILTER_0_BASE + 0x30),
	(unsigned char*) (FIR_FILTER_0_BASE + 0x34),
    (unsigned char*) (FIR_FILTER_0_BASE + 0x38),
	(unsigned char*) (FIR_FILTER_0_BASE + 0x3C)
};

int send_data_to_fir(char *data1, int length) {
    for (int i = 0; i < length; i++) {
        printf("Writing %d to address %d\n", data1[i],i);
        IOWR_8DIRECT(fir_base[i],0,data1[i]);
    }
    return 1;
}



int main() {
	int done = 0;
    done = send_data_to_fir(input_data, 8);
    if(done){
    	int data;
    	for (int j = 0; j < 8; j++) {
    	 data = IORD_32DIRECT(fir_base[j],0);
    	 printf("Reading from address %d = %d\n", j, data);
    	    }
    	data = IORD_32DIRECT(fir_base[8],0);
    	printf("Reading from result of fir = %d\n",(int)data);
    }
    return 0;
}
