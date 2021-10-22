BEGIN {
#程式初始化，設定一變數以記錄目前最高處理封包ID。 
highest_packet_id = 0;
}
{
    action = $1;
    time = $2;
    node_1 = $3;
    node_2 = $4;
    type = $5;
    flow_id = $8; 
    node_1_address = $9;
    node_2_address = $10; 
    seq_no = $11;
    packet_id = $12;

    #記錄目前最高的packet ID
    if ( packet_id > highest_packet_id )
        highest_packet_id = packet_id;
    #記錄封包的傳送時間
    if ( start_time[packet_id] == 0 ) 
        start_time[packet_id] = time;
#記錄CBR (flow_id=2) 的接收時間
        if ( flow_id == 2 && action != "d" ) {
            if ( action == "r" ) {
                end_time[packet_id] = time;
    }
} else {
#把不是flow_id=2的封包或者是flow_id=2
#但此封包被drop的時間設為-1
    end_time[packet_id] = -1;
    }
}
END {
#當資料列全部讀取完後，開始計算有效封包的端點到端點延遲時間
for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) {
    start = start_time[packet_id];
    end = end_time[packet_id];
    packet_duration = end - start;
if(start<end)printf ("%f%f\n",start,packet_duration);
    }
}
