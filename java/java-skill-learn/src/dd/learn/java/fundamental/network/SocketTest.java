package dd.learn.java.fundamental.network;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by junqiao.wjq on 2018/5/2.
 */
public class SocketTest {

	class MyClient {

		public void connect() {
			try {
				Socket socket = new Socket("127.0.0.1", 10086);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	class MyServer {
		public void start() {
			try {
				ServerSocket serverSocket = new ServerSocket(10086);

				serverSocket.accept();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
