// testbench.sv
module Traffic_light_controller_TB;

  reg clk, rst;
  wire [2:0] light_M1, light_S, light_MT, light_M2;

  // Instantiate the DUT (Device Under Test)
  Traffic_light_controller dut (
    .clk(clk),
    .rst(rst),
    .light_M1(light_M1),
    .light_S(light_S),
    .light_MT(light_MT),
    .light_M2(light_M2)
  );

  // Clock generation: 10ns period (100 MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle every 5 ns => 10 ns clock period
  end

  // Dump waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, dut);
  end

  // Test sequence
  initial begin
    rst = 1;
    #10;
    rst = 0;
    #1000;  
    $finish;
  end

endmodule