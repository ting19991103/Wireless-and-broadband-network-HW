set f [open "/home/lab/Documents/tclawkhw/prime.txt" "w" ]
set j 0;
for {set i 2} {$i<1000} {incr i} {
   for {set j 2} {$j <= [expr $i/$j] } {incr j} {
      if {  [expr $i%$j] == 0 } {
         break
      } 
   }
   if {$j >[expr $i/$j] } {
      puts $f "$i is prime number"
   }
}
close $f
