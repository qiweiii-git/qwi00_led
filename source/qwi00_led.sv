//*****************************************************************************
// qwi00_led.v
//
// This module is the top wrapper of qwi00_led project.
//
// Change History:
//  VER.   Author         DATE              Change Description
//  1.0    Qiwei Wu       Feb. 18, 2019     Initial Release
//
//*****************************************************************************

module qwi00_led
(
   input                      CLK                             ,
   output     [LED_NUM-1:0]   LED
);

//*****************************************************************************
// Parameters
//*****************************************************************************
parameter                     LED_NUM         = 1             ;
parameter                     LED_TIME_S      = 1             ;

//*****************************************************************************
// Maps
//*****************************************************************************
led_indicate
#(
   .LED_NUM                   ( LED_NUM                      ),
   .LED_TIME_S                ( LED_TIME_S                   )
)
u_led_indicate
(
   .clk                       ( CLK                          ),
   .led                       ( LED                          )
);

endmodule
