// GENEARL INFO
// reg [ LEFT_BIT_INDEX : RIGHT_BIT_INDEX ]  my_vector;
//Whether LEFT > RIGHT, or LEFT < RIGHT does not change the bit order:
//Arrays : 
//reg [ L : R ]    my_array [ FIRST_INDEX : LAST_INDEX]

module hello;
  reg [7:0] data1 = 8'd2;
  reg [0:7] data2 = 8'd2;

 // reg [7:0] arrayData1 [0:1];// = '{ 8'd2 , 8'd3 };
 // reg [7:0] arrayData2 [1:0] = {8'd2, 8'd3};
//reg [7:0] array1 [0:2] = { 8'haa, 8'hbb, 8'hcc }; 
//reg [7:0] array2 [2:0] = { 8'haa, 8'hbb, 8'hcc };


  reg [7:0] foo = 8'd3;
  reg [3:0] foo2 = 0;

  reg [3:0] smallData = 4'd0;

  initial 
    begin
      //arrayData1 = { 8'd2 , 8'd3 };
      $display("data1");
      $display(data1);
      $display("data2");
      $display(data2);
	
      $display("array1[0]");
      //$display(array1[0]);
      $display("array2[0]");
      //$display(array2[0]);


      $display("acess data1[1]");
      $display(data1[1]);
      $display("acess data2[1]");
      $display(data2[1]);
      $display("acess data2[1]");
      $display(data2[1]);
      $display("acess (data2 or 0xc0)[0:3]");
	foo2 = (data2 | 8'hb0)>>4;
      $display(foo2[3:0]);
	foo2 = (data2 | 8'hb0);
      $display(foo2[3:0]);




	data1 = (data1 << 1);
	data2 = (data2 << 1);
      $display("data1 left shift");
      $display(data1);
      $display("data2 left shift");
      $display(data2);
      $display("");
	
	data1 = (data1 << 2) | foo;
	data2 = (data2 << 2) | foo;

      $display("data1 double left shift combined with foo");
      $display(data1);
      $display("data2 double left shift combined with foo");
      $display(data2);
	
	smallData = data1;
      $display("cast on small data1");
      $display(smallData);
	smallData = data2;
      $display("cast on small data2");
      $display(smallData);

	data1 = data1 & 8'hf0;
      $display("and 0xf0");
      $display(data1);
        data2 = data2 & 8'hf0;
      $display("data2 & 0xf0");
      $display(data2);

      $finish ;
    end

endmodule
