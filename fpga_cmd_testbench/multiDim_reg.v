module reg_test;
reg [7:0] array1 [0:2];
reg [7:0] array2 [2:0];
reg [0:7] array3 [0:2];
reg [0:7] array4 [2:0];
	
  initial 
    begin
	array1[0] = 8'hff;
	array1[1] = 8'h11;
	array1[2] = 8'h33;
	array2 = array1;

	$display("init val = {{8'hff},{8'h11}};");
	$display("reg [7:0] array1 [0:2]");
	$display("reg [7:0] array2 [2:0]");
	$display("reg [0:7] array3 [0:2]");
	$display("reg [0:7] array4 [2:0]");
	
	$display(array1[0]);
	$display(array1[1]);
	$display(array1[2]);



      $finish ;
    end
endmodule

