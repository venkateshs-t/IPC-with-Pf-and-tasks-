//--------------------------------------------------------------------------------------------
// Event Equaity
//--------------------------------------------------------------------------------------------
  module event_equality;
  
  event E1, E2;
  
  initial 
  begin
    
     //-------------------------------------------------------
     // Displaying the events
     //-------------------------------------------------------
      if ( E1 )            // same as if ( E1 != null )
      $display( "E1=%0p",E1 );
      E1 = E2;
      $display( "E2=%0p",E2 );
      $display( "E1=%0p",E1 );

      //-------------------------------------------------------
      //checking for case equality of events 
      //-------------------------------------------------------
      if ( E1 === E2 )
      $display( "E1 and E2 are the same event" );
      else
      $display( "E1 and E2 are the not same event" );
    end
    
endmodule


