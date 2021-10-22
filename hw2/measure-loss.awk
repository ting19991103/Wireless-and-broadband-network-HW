BEGIN {
#程式初始化,設定㇐變數記錄packet被drop的數目
fsDrops = 0;
numFs = 0;
}
{
    action = $1;
    time = $2;
    node_1 = $3;
    node_2 = $4;
    src = $5;
    flow_id = $8;
    node_1_address = $9;
    node_2_address = $10;
    seq_no = $11;
    packet_id = $12;
#統計從n1送出多少packets
if (node_1==1 && node_2==2 && action == "+") 
    numFs++;
#統計flow_id為2,且被drop的封包
    if (flow_id==2 && action == "d") 
        fsDrops++;
}
END {
printf("number of packets sent:%d lost:%d\n", numFs, 
fsDrops);
}
