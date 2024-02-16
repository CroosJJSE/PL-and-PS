#include <stdio.h>
#include "platform.h"
#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"

int main()
{
    init_platform();



    XGpio input,output;
    int a;
    int y;

    XGpio_Initialize(&input, XPAR_AXI_GPIO_0_BASEADDR );
    XGpio_Initialize(&output, XPAR_AXI_GPIO_1_BASEADDR );

    XGpio_SetDataDirection(&input, 1, 1);
    XGpio_SetDataDirection(&output, 1, 0);

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    while (1)
    {
        a = XGpio_DiscreteRead(&input, 1);
        if ( a ==1)
        {
            y = 0 ;
        } else {
        y = 1;
        }
        xil_printf("y = %d\n\r", y);

        XGpio_DiscreteWrite(&output,1,y);
        sleep(1);

    }
    cleanup_platform();
    return 0;
}