BEGIN {

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
    if (from==0 && to==1 && action == "d") 
    {
        printf("%f %d\n",time,seq_no)
    }
     
}
END {

}
