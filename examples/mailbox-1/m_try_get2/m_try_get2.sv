//--------------------------------------------------------------------------------------------
//  try_get method
//--------------------------------------------------------------------------------------------
class packet;

  rand bit [7:0] addr;
  rand bit [7:0] data;

//--------------------------------------------------------------------------------------------
//Displaying randomized values
//--------------------------------------------------------------------------------------------
  
  function void post_randomize();
    $display("Packet::Packet Generated");
    $display("Packet::Addr=%0d,Data=%0d",addr,data);
  endfunction

endclass
 
 //--------------------------------------------------------------------------------------------
 // Generator Class
 //--------------------------------------------------------------------------------------------
class generator;

  packet pkt;
  mailbox m_box;

//--------------------------------------------------------------------------------------------
//constructor, getting mailbox handle
//--------------------------------------------------------------------------------------------
  
  function new(mailbox m_box);
    this.m_box = m_box;
  endfunction
  
  task run;
    repeat(2) begin
      pkt = new();
      pkt.randomize(); //generating packet
//    m_box.put(pkt);  //putting packet into mailbox
      $display("Gen:data items in mailbox:%0d",m_box.num());
      $display("Generator::Packet NOT Put into Mailbox");
      #5;
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------
//  Driver Class
//--------------------------------------------------------------------------------------------
class driver;

  packet pkt;
  mailbox m_box;

//--------------------------------------------------------------------------------------------
//constructor, getting mailbox handle
//--------------------------------------------------------------------------------------------
  function new(mailbox m_box);
    this.m_box = m_box;
  endfunction
 
  task run;
    repeat(2) begin
      $display("Driver::trying to get the pkt");
      m_box.try_get(pkt); //getting packet from mailbox
      $display("Drv:data items in mailbox:%0d",m_box.num());
      $display("Driver::unable to recive any pkt");
//    $display("Driver::Addr=%0d,Data=%0d\n",pkt.addr,pkt.data);
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------
// Instantiating generator and driver 
//--------------------------------------------------------------------------------------------
module mailbox_ex;
  
  generator gen;
  driver    dri;
  mailbox m_box; //declaring mailbox m_box
 
  initial begin
//--------------------------------------------------------------------------------------------
//Creating the mailbox, Passing the same handle to generator and driver 
//--------------------------------------------------------------------------------------------
    m_box = new(); //creating mailbox
 
    gen = new(m_box); //creating generator and passing mailbox handle
    dri = new(m_box); //creating driver and passing mailbox handle
    $display("-------------------try_get--------------------");
    fork
      gen.run(); //Process-1
      dri.run(); //Process-2
    join
    $display("--------------------try_get--------------------");
  end
endmodule
