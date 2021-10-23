//--------------------------------------------------------------------------------------------
// class: class for parameterized mailbox
// Description:
// Class which is responsible to send the string through mailbox
//--------------------------------------------------------------------------------------------
typedef mailbox #(string) s_mbox;

class comp1;

  s_mbox names;

//--------------------------------------------------------------------------------------------
// task for putting data in mailbox
//--------------------------------------------------------------------------------------------

  task send();
    for(int i=0; i<3; i++) begin
      string s = $sformatf("AVIP-%0d",i);
      #1 $display("@%0t:comp1:put %s",$time,s);
      names.put(s);
     end
  endtask

endclass

//--------------------------------------------------------------------------------------------
// class: class for parameterized mailbox
// Description:
// Class which is responsible for reciving the string through mailbox
//--------------------------------------------------------------------------------------------

class comp2;

  s_mbox list;

//--------------------------------------------------------------------------------------------
// task to receive the data
//--------------------------------------------------------------------------------------------

  task receive();
    forever begin
      string s;
      list.get(s);
      $display("@%0t:comp2:got %s",$time,s);
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------
// Top module
//--------------------------------------------------------------------------------------------

module tb;

  s_mbox m_mbx = new();
  comp1 m_comp1 = new();
  comp2 m_comp2 = new();
  
  initial 
  begin
    m_comp1.names = m_mbx;
    m_comp2.list = m_mbx;
    fork 
      m_comp1.send();
      m_comp2.receive();
    join
  end

endmodule



