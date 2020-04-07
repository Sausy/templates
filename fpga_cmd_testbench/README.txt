Easy and fast example for testing stuff in verilog 
with iverilog

///=======
module hello;
  initial 
    begin
      $display("Hello, World");
      $finish ;
    end
endmodule
//=====


% iverilog -o hello hello.v
% vvp hello
