
#include <stdio.h>
#include "system.h"

// Dữ liệu đầu vào mẫu
char input_data[8] = {1,2,3,4,5,6,7,8};

// Địa chỉ bộ nhớ của FIR filter
char *fir_base = (char*) (FIR_FILTER_0_BASE);

// Hàm để gửi dữ liệu tới FIR filter
void send_data_to_fir(char *data, int length) {
	int j = 0;
    for (int i = 0; i < length; i=i+8) {
        fir_base[i] = data[j];
        j++;
    }
}

// Hàm để đọc dữ liệu từ FIR filter
void read_data_from_fir(int length) {
    for (int i = 0; i < length; i=i+8) {
        printf("byte %d = %d\n", i, fir_base[i]);
    }
}

int main() {
    // Gửi dữ liệu đầu vào tới FIR filter
    send_data_to_fir(input_data, 64);

    // Đọc dữ liệu kết quả từ FIR filter
    read_data_from_fir(64);

    return 0;
}




