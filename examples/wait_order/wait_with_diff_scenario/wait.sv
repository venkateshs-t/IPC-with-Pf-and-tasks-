//--------------------------------------------------------------------------------------------
// wait order in events
//--------------------------------------------------------------------------------------------
  module tb;
  event d;
  
  initial
    fork
    begin
      #10 -> a;
      #10 -> b;
    end
  
  begin
    $display("-----------------------------------------------");
    wait_order(a,b,c)
    $display("@%0t:Events were executed in the correct order",$time);
    else
    $display("@%0t:Events were not executed in the correct order",$time); 
    $display("-----------------------------------------------");
  end

 begin
   #100
   ->c;
   ->d;
 end

 begin
   $display("-----------------------------------------------");
   $display("@%0t:event a and b are triggered and waiting for event c to trigger",$time);
   wait(d.triggered)
   $display("@%0t:end of the process",$time);
   $display("-----------------------------------------------");
 end
 join
 
endmodule
