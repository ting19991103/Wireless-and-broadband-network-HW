set ns [new Simulator]

set nd [open out.tr w]
$ns trace-all $nd

proc finish {} {
    global ns nd 
    $ns flush-trace
    close $nd
    exit 0    
}

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 2Mb 10ms DropTail

$ns queue-limit $n0 $n1 10

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink
$tcp set fid_ 1

set ftp [new Application/FTP]
$ftp attach-agent $tcp
#---------------------------------------------
set tcp2 [new Agent/TCP]
$ns attach-agent $n0 $tcp2

set sink2 [new Agent/TCPSink]
$ns attach-agent $n1 $sink2

$ns connect $tcp2 $sink2
$tcp2 set fid_ 2

set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2


$ns at 1.0 "$ftp2 start"
$ns at 40.0 "$ftp2 stop"
#----------------------------------------------
$ns at 1.0 "$ftp start"
$ns at 40.0 "$ftp stop"

$ns at 45.0 "finish"

$ns run




