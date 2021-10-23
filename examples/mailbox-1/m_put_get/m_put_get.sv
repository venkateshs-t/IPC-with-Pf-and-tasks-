//--------------------------------------------------------------------------------------------
// Mailbox
// Description:Mailbox is a communication channel between transactors 
// get & put methods
//--------------------------------------------------------------------------------------------
class packet;
  
  rand bit [7:0] addr;
  rand bit [7:0] data;

//--------------------------------------------------------------------------------------------
// Displaying randomized values
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
// constructor, getting mailbox handle
//--------------------------------------------------------------------------------------------
  function new(mailbox m_box);
    this.m_box = m_box;
  endfunction
  
  task run;
    repeat(2) begin
      pkt = new();
      pkt.randomize(); //generating packet
      m_box.put(pkt);  //putting packet into mailbox
      $display("Generator::Packet Put into Mailbox");
      #5;
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------
// Driver Class
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
      m_box.get(pkt); //getting packet from mailbox
      $display("Driver::Packet Recived");
      $display("Driver::Addr=%0d,Data=%0d\n",pkt.addr,pkt.data);
    end
  endtask
endclass

//--------------------------------------------------------------------------------------------
// Instantiating Generator and driver
//--------------------------------------------------------------------------------------------
module mailbox_ex;
  
  generator gen;
  driver    dri;
  mailbox m_box; //declaring mailbox m_box
 
  initial begin
//--------------------------------------------------------------------------------------------
// Creating the mailbox, Passing the same handle to generator and driver 
//--------------------------------------------------------------------------------------------
    m_box = new(); //creating mailbox
 
    gen = new(m_box); //creating generator and passing mailbox handle
    dri = new(m_box); //creating driver and passing mailbox handle
    $display("------------------------------------------");
    fork
      gen.run(); //Process-1
      dri.run(); //Process-2
    join
    $display("------------------------------------------");
  end
endmodule
