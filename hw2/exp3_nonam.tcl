set ns [new Simulator]

set nd [open out.tr w]
$ns trace-all $nd

proc finish {} {
    global ns nd 
    $ns flush-trace
    close $nd

    #exec nam out.nam &
    exit 0    
}

set s1 [$ns node]
set s2 [$ns node]

set r [$ns node]

set d [$ns node]

$ns duplex-link $s1 $r 2Mb 10ms DropTail
$ns duplex-link $s2 $r 2Mb 10ms DropTail
$ns duplex-link $r $d 1.7Mb 20ms DropTail

$ns queue-limit $r $d 10


$ns duplex-link-op $r $d queuePos 0.5


set tcp [new Agent/TCP]
$ns attach-agent $s1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $d $sink
$ns connect $tcp $sink

$tcp set fid_ 1

set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

set udp [new Agent/UDP]
$ns attach-agent $s2 $udp
set null [new Agent/Null]
$ns attach-agent $d $null
$ns connect $udp $null

$udp set fid_ 2

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR

$cbr set packet_size_ 1000

$cbr set rate_ 1mb
$cbr set random_ false

$ns at 0.1 "$cbr start"
$ns at 1.0 "$ftp start"
$ns at 4.0 "$ftp stop"
$ns at 4.5 "$cbr stop"

$ns at 4.5 "$ns detach-agent $s1 $tcp ; $ns detach-agent $d $sink"

$ns at 5.0 "finish"

$ns run




