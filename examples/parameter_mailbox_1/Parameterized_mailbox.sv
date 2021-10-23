//--------------------------------------------------------------------------------------------
// Parameterised Mailbox
//--------------------------------------------------------------------------------------------
/*
module Parameterized_mailbox;
  typedef mailbox#(string) s_mbx;
  initial 
  begin
    string s,y;
    s_mbx  mbx;
//  s="muneeb";
    mbx = new();         // Mailbox size = 1
    mbx.put("muneeb");   // mbx.put(s)
     $display("-------put&get-----------");
     $display("d=%0d",mbx.num());
    mbx.get(s);
      $display("y=%0d",mbx.num());
      $display("string=%0s",s);
  end
endmodule
*/
//--------------------------------------------------------------------------------------------
// try_get
//--------------------------------------------------------------------------------------------
/*
module Parameterized_mailbox ;
  typedef mailbox#(string) s_mbx;
  initial 
    begin
    string s,y;
    s_mbx  mbx;
  //s="muneeb";
    mbx = new();        // Mailbox size = 1
//  mbx.put("muneeb");   // mbx.put(s)
      $display("-------try_get-----------");
      $display("d=%0d",mbx.num());
    mbx.try_get(s);
      $display("y=%0d",mbx.num());
      $display("string=%0s",s);
    end
endmodule
*/
/*
//--------------------------------------------------------------------------------------------
// Peek
//--------------------------------------------------------------------------------------------


module Parameterized_mailbox;
  typedef mailbox#(string) s_mbx;
  initial 
    begin
    string s,y;
    s_mbx  mbx;
  //s="muneeb";
    mbx = new();        // Mailbox size = 1
    mbx.put("muneeb");   // mbx.put(s)
      $display("-------peek without blocking-----------");
      $display("d=%0d",mbx.num());
      mbx.peek(s);
      $display("y=%0d",mbx.num());
      $display("string=%0s",s);
      $display("y=%0d",mbx.num());
    end

endmodule
*/
// /*
//--------------------------------------------------------------------------------------------
// try_peek
//--------------------------------------------------------------------------------------------

module Parameterized_mailbox;
  typedef mailbox#(string) s_mbx;
  initial 
    begin
    string s,y;
    s_mbx  mbx;
//  s="muneeb";
    mbx = new(); // Mailbox size = 1
//  mbx.put("muneeb");   // mbx.put(s)
      $display("-------try_peek-----------");
      $display("d=%0d",mbx.num());
    mbx.try_peek(s);
      $display("y=%0d",mbx.num());
      $display("string=%0s",s);
    end

endmodule
// */

































//--------------------------------------------------------------------------------------------
// try_put
//--------------------------------------------------------------------------------------------


module main;
  typedef mailbox#(string) s_mbx;
  initial 
    begin
    string s,y;
    s_mbx  mbx;
//  s="muneeb";
    mbx = new();           // Mailbox size = 1
    mbx.try_put("muneeb");   // mbx.put(s)
       $display("-------peek without blocking-----------");
       $display("d=%0d",mbx.num());
    mbx.get(s);
       $display("y=%0d",mbx.num());
       $display("string=%0s",s);
    
    end

endmodule
