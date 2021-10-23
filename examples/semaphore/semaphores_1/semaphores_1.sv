//--------------------------------------------------------------------------------------------
// Semaphore
// Description:Mutual exclusive of shared resources
//--------------------------------------------------------------------------------------------
module main;

semaphore sema_bus=new(2);

initial 
begin
  
//--------------------------------------------------------------------------------------------
// Process 1
//--------------------------------------------------------------------------------------------
fork
begin
  $display($time,"\t 1: Waiting for key");
  sema_bus.get(2);     
  $display($time,"\t 1: Got the Key"); 
  #(10);     // do the required process
  sema_bus.put(1);
  $display($time,"\t 1: Returning back key ");
  $display($time,"\t PROCESS 1 >>> COMPLETED");
end
 
//--------------------------------------------------------------------------------------------
// Process 2
//--------------------------------------------------------------------------------------------
begin  
  $display($time,"\t 2: Waiting for Key");
  sema_bus.get(2);
  $display($time,"\t 2: Got the Key");
  #(10); // Do the required process 
  sema_bus.put(1);
  $display($time,"\t 2: Returning back key ");
  $display($time,"\t PROCESS 2 >>> COMPLETED");
end
join

#100;
$display($time,"\t END of Processes");
end

endmodule
