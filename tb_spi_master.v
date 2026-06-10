module tb_spi_master;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire mosi;
wire sclk;
wire ss;
wire done;

spi_master uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .mosi(mosi),
    .sclk(sclk),
    .ss(ss),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'b10110011;

    #10 rst = 0;

    #10 start = 1;
    #10 start = 0;

    #250;

    $finish;
end

initial
begin
    $dumpfile("spi_master.vcd");
    $dumpvars(0,tb_spi_master);
end

endmodule


