BEGIN {
#程式初始化,設定㇐變數記錄packet被drop的數目
fsDrops = 0;
numFs = 0;
}
{
    action = $1;
    time = $2;
    from = $3;
    to = $4;
    type = $5;
    pktsize = $6;
    flow_id = $8;
    src = $9;
    dst = $10;
    seq_no = $11;
    packet_id=$12;
#統計從n1送出多少packets
    if (from==0 && to==1 && action == "+") 
        numFs++;
    #統計flow_id為2,且被drop的封包
    if (flow_id==1 && action == "d") 
        fsDrops++;
}
END {
printf("number of packets sent:%d lost:%d\n", numFs, 
fsDrops);
}
