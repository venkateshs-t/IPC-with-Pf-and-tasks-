//--------------------------------------------------------------------------------------------
//try_ Peek_method
//--------------------------------------------------------------------------------------------
module Parameterized_mailbox ;

typedef mailbox#(string) s_mbx;

initial 
begin
  string s,y;
  s_mbx  mbx;
  mbx = new();       
  //mbx.put("muneeb");   
  $display("-------try_get-----------");
  $display("data items in mailbox after putting=%0d",mbx.num());
  mbx.try_peek(s);
  $display("data items in mailbox after peeking=%0d",mbx.num());
  $display("string=%0s",s);
end

endmodule
