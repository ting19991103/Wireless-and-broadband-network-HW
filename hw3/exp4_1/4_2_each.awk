BEGIN {
init=0;
startT=0;
endT=0;
}
{
action = $1;
time = $2;
from = $3;
to = $4;
type = $5;
pktsize = $6;
flow_id = $8;
node_1_address = $9;
node_2_address = $10;
seq_no = $11;
packet_id = $12;
#記錄型態是tcp，動作是equeue，且發生事件的時間是介在1.0秒和5.0秒之間
#由於在新增節點時，節點建立的順序為r1 r2 s1 d1 s2 d2 s3 d3，所以相對的節點id就為 0 1 2 3 4 5 6 7 
if(action=="r" && type=="tcp" && time >= 1.0 && time <=7.0 && ((from==1 && to==3)||(from==1 && to==5)||(from==1 && to==7))) {
if(init==0){
startT=time;
init=1;
}
#記錄在這段時間中離開佇列的封包大小總和 (in bytes)
pkt_byte_sum += pktsize;
endT=time;
}

if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==3))){pkt_byte_sum1 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==5))){pkt_byte_sum2 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==7))){pkt_byte_sum3 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==9))){pkt_byte_sum4 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==11))){pkt_byte_sum5 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==13))){pkt_byte_sum6 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==15))){pkt_byte_sum7 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==17))){pkt_byte_sum8 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==19))){pkt_byte_sum9 += pktsize;}
if(action=="r" && type=="tcp" && time >= 1.0 && time <=5.0 && ((from==1 && to==21))){pkt_byte_sum10 += pktsize;}

}
END {
#計算1.0 ~ 5.0秒的
avgerage bandwidth
printf("startT:%f endT:%f\n", startT, endT);
printf("pkt_byte_sum:%d\n", pkt_byte_sum);
time=endT-startT;
throughput=pkt_byte_sum*8/time/1000000;
printf("throughput:%.3f Mbps\n", throughput);

printf("flow 1:%d\n", pkt_byte_sum1);
printf("flow 2:%d\n", pkt_byte_sum2);
printf("flow 3:%d\n", pkt_byte_sum3);
printf("flow 4:%d\n", pkt_byte_sum4);
printf("flow 5:%d\n", pkt_byte_sum5);
printf("flow 6:%d\n", pkt_byte_sum6);
printf("flow 7:%d\n", pkt_byte_sum7);
printf("flow 8:%d\n", pkt_byte_sum8);
printf("flow 9:%d\n", pkt_byte_sum9);
printf("flow 10:%d\n", pkt_byte_sum10);

}

