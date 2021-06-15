TARGET1 = testclient1
TARGET2 = testclient2
CC = gcc209


%.o : %.c
	echo y
	$(CC) -c $^

%: %.o %.o
	echo x
	$(CC) $^ -o $@

	


All : $(TARGET1) $(TARGET2)

array : $(TARGET1)

hash : $(TARGET2)

clean :
	rm -f *.o ~*


testclient1 : testclient.o customer_manager1.o

testclient2 : testclient.o customer_manager2.o

testclient.o: testclient.c

customer_manager2.o : customer_manager2.c

customer_manager1.o : customer_manager1.c

