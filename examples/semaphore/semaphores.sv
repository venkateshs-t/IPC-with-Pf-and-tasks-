//--------------------------------------------------------------------------------------------
// Semaphore
// Description:Mutual exclusive of shared resources
//--------------------------------------------------------------------------------------------

module main;

semaphore sema_bus=new(2);

initial    
begin
  repeat(2)
begin
  
//--------------------------------------------------------------------------------------------
// Process 1
//--------------------------------------------------------------------------------------------
fork
begin
  $display($time,"\t 1: Waiting for 1 key");
  sema_bus.get(1);     
  $display($time,"\t 1: Got the Key"); 
  #(10);     // do the required process
  sema_bus.put(1);
  $display($time,"\t 1: Returning back 1 key ");
  $display($time,"\t PROCESS 1 >>> COMPLETED");
end

//--------------------------------------------------------------------------------------------
// Process 2
//--------------------------------------------------------------------------------------------
begin  
  $display($time,"\t 2: Waiting for 1 Key");
  sema_bus.get(1);
  $display($time,"\t 2: Got the Key");
  #(10); // Do the required process 
  sema_bus.put(1);
  $display($time,"\t 2: Returning back 1 key ");
  $display($time,"\t PROCESS 2 >>> COMPLETED");
 end
//--------------------------------------------------------------------------------------------
// Process 3
//--------------------------------------------------------------------------------------------
begin
  $display($time,"\t 3: Waiting for 1 Key");
  sema_bus.try_get(1);
  $display($time,"\t 3: Not Got the Key --> Performing other operation");
  #(10); // Do the required process 
  $display($time,"\t 3: Got the Key");
  #(10);
  sema_bus.put(1);
  $display($time,"\t 3: Returning back 1 key ");
  $display($time,"\t PROCESS 3 >>> COMPLETED");
end
join
end

#100;
$display($time,"\t END of Processes");
end 

endmodule




