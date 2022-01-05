all: P1_skt P2_skt P1_fifo P2_fifo P1_mq P2_mq   
P1_skt: p1_skt.c 
	gcc p1_skt.c -o p1_skt 
P2_skt: p2_skt.c 
	gcc p2_skt.c -o p2_skt
P1_fifo: p1_fifo.c 
	gcc p1_fifo.c -o p1_fifo 
P2_fifo: p2_skt.c 
	gcc p2_fifo.c -o p2_fifo
P1_mq: p1_mq.c 
	gcc p1_mq.c -o p1_mq 
P2_mq: p2_skt.c 
	gcc p2_mq.c -o p2_mq
