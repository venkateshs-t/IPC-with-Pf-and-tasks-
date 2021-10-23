//--------------------------------------------------------------------------------------------
// code with two different wait operators(@,wait)
//--------------------------------------------------------------------------------------------
  module e1;
  
  event e1;
//--------------------------------------------------------------------------------------------
// process-1 triggering the event
//--------------------------------------------------------------------------------------------
  initial
  begin
    #20 ->e1;
    $display("@%0t:thread1:Triggered event1",$time);
  end
//--------------------------------------------------------------------------------------------
// process-2 using @ operator
//--------------------------------------------------------------------------------------------
  initial 
  begin
    $display("@%0t:thread2:Waiting for the event at 20ns",$time);
    #20 @(e1);
    $display("@%0t:thread2:Received event1 Triggered",$time);
  end
//--------------------------------------------------------------------------------------------
// process-3 using wait construct
//--------------------------------------------------------------------------------------------
  initial 
  begin
    $display("@%0t:thread3:Waiting for the event at 20ns",$time);
    #20 wait(e1.triggered);
    $display("@%0t:thread3:Received event1 Triggered",$time);
  end

endmodule


