
//--------------------------------------------------------------------------------------------
// Event In Equaity
//--------------------------------------------------------------------------------------------
  module event_equality;
  
  event E1, E2;
  
  initial
  begin
 
    //-------------------------------------------------------
    // Displaying the event values
    //-------------------------------------------------------
      if ( E1 )
        $display( "E1=%0p",E1 );
   //   E1 = E2;
        $display( "E2=%0p",E2 );
        $display( "E1=%0p",E1 ); 

   //-------------------------------------------------------
   // checking for event equality
   //-------------------------------------------------------
     if ( E1 !== E2 )
         $display( "E1 and E2 are the not same event" );
       else
         $display( "E1 and E2 are the same event" );
      end

endmodule
