//--------------------------------------------------------------------------------------------
//Bounded  Mailbox
// Description:It is communication channel between transactors
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
// Module declaration
//--------------------------------------------------------------------------------------------
module bounded_mailbox;
  
  mailbox mbx;
  
  initial 
      begin
        mbx = new(1); // Mailbox size = 1
        for (int i=1; i<4; i++) 
        begin
          $display("Producer: data items in mailbox before putting :%0d",mbx.num());
          mbx.put(i);
          $display("Producer: put(%0d)", i);
          $display("Producer: data items in mailbox after putting :%0d",mbx.num());
          $display("consumer: data items in mailbox before getting :%0d",mbx.num());
          #1 mbx.get(i);
          $display("Consumer: get(%0d)", i);
          $display("consumer: data items in mailbox after getting :%0d",mbx.num());
        end
      end

endmodule
