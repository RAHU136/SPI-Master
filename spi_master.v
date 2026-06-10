module spi_master(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,

    output reg mosi,
    output reg sclk,
    output reg ss,
    output reg done
);

reg [7:0] shift_reg;
reg [2:0] bit_count;
reg [1:0] state;

parameter IDLE     = 2'b00;
parameter LOAD     = 2'b01;
parameter TRANSFER = 2'b10;
parameter DONE_ST  = 2'b11;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= IDLE;
        mosi <= 0;
        sclk <= 0;
        ss <= 1;
        done <= 0;
        bit_count <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            ss <= 1;
            done <= 0;

            if(start)
                state <= LOAD;
        end

        LOAD:
        begin
            shift_reg <= data_in;
            bit_count <= 0;
            ss <= 0;
            state <= TRANSFER;
        end

        TRANSFER:
        begin
            sclk <= ~sclk;

            if(sclk == 0)
            begin
                mosi <= shift_reg[7];
                shift_reg <= {shift_reg[6:0],1'b0};

                if(bit_count == 7)
                    state <= DONE_ST;
                else
                    bit_count <= bit_count + 1;
            end
        end

        DONE_ST:
        begin
            ss <= 1;
            done <= 1;
            state <= IDLE;
        end

        endcase
    end
end

endmodule


