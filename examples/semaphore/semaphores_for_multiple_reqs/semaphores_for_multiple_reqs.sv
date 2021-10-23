//--------------------------------------------------------------------------------------------
// Semaphore
// Description:Mutual exclusive of shared resources
//--------------------------------------------------------------------------------------------
 module main1;

 semaphore sema_bus=new(40);

  initial 
  begin
   repeat(2)
   begin

//--------------------------------------------------------------------------------------------
// Process 1
//--------------------------------------------------------------------------------------------

 fork
 begin
   $display($time,"\t 1: Waiting for key");
   sema_bus.get(20);     
   $display($time,"\t 1: Got the Key"); 
   #(10);     // do the required process
   sema_bus.put(12);
   $display($time,"\t 1: Returning back key ");
   $display($time,"\t PROCESS 1 >>> COMPLETED");
 end
 
//--------------------------------------------------------------------------------------------
// Process 2
//--------------------------------------------------------------------------------------------

 begin  
   $display($time,"\t 2: Waiting for Key");
   sema_bus.get(15);
   $display($time,"\t 2: Got the Key");
   #(10); // Do the required process 
   sema_bus.put(10);
   $display($time,"\t 2: Returning back key ");
   $display($time,"\t PROCESS 2 >>> COMPLETED");
 end

//--------------------------------------------------------------------------------------------
// Process 3
//--------------------------------------------------------------------------------------------

 begin  
   $display($time,"\t 3: Waiting for Key");
   //  #(10);
   sema_bus.get(27);
   $display($time,"\t 3: Got the Key");
   #(10); // Do the required process 
   sema_bus.put(15);
   $display($time,"\t 3: Returning back key ");
   $display($time,"\t PROCESS 3 >>> COMPLETED");
 end
join
end
 #100;
 $display($time,"\t END of Processes");
end

endmodule
