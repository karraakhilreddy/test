

import java.net.DatagramSocket;

try(final DatagramSocket socket = new DatagramSocket()){
  socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
  ip = socket.getLocalAddress().getHostAddress();
}


InetAddress IP=InetAddress.getLocalHost();
System.out.println("IP of my system is := "+IP.getHostAddress());

InetAddress IP=InetAddress.getLocalHost();
System.out.println(IP.toString()