//*****************************************************************************
// led_indicate.v
//
// This module is the indicate module using led.
//
// Change History:
//  VER.   Author         DATE              Change Description
//  1.0    Qiwei Wu       Feb. 15, 2019     Initial Release
//
//*****************************************************************************

module led_indicate
#(
   parameter                  LED_NUM    = 4,
   parameter                  LED_TIME_S = 1
)
(
   input                      clk,
   output     [LED_NUM-1:0]   led
);

//*****************************************************************************
// Parameters
//*****************************************************************************
parameter   ICLK_FREQ       = 50_000_000;
parameter   TIME_1S_BIT     = 26;//1.342s

//*****************************************************************************
// Signals
//*****************************************************************************
genvar                i;
wire                  iclk;
reg    [LED_NUM-1:0]  oled = 0;
reg    [31:0]         time_cnt[LED_NUM-1];

//*****************************************************************************
// Processes
//*****************************************************************************
//interface
assign iclk = clk;
assign led = oled;

//led process
generate
   for (i = 0; i < LED_NUM; i++)
   begin: led_gen
      always @(posedge iclk)
      begin
         if(time_cnt[i] == TIME_1S_BIT-1+LED_TIME_S)
            time_cnt[i] <= 0;
         else
            time_cnt[i] <= time_cnt[i] + ~&time_cnt[i];
      end

      always @(posedge iclk)
      begin
         if(time_cnt[i] == TIME_1S_BIT-1+LED_TIME_S)
            oled[i] = ~oled[i];
      end
   end
endgenerate

//*****************************************************************************
// Maps
//*****************************************************************************

endmodule
