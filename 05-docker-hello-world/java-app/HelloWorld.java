import com.sun.net.httpserver.HttpServer;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;

public class HelloWorld {

    public static void main(String[] args) throws Exception {
        int port = 8080;
        HttpServer server = HttpServer.create(new InetSocketAddress("0.0.0.0", port), 0);

        server.createContext("/", exchange -> {
            String body = "<html>"
                    + "<head><title>Java Hello World</title></head>"
                    + "<body style=\"font-family: sans-serif; text-align: center; padding-top: 80px;\">"
                    + "<h1>Hello World</h1>"
                    + "<p>Served by Java inside Docker</p>"
                    + "</body></html>";
            byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
            exchange.getResponseHeaders().set("Content-Type", "text/html; charset=utf-8");
            exchange.sendResponseHeaders(200, bytes.length);
            try (OutputStream os = exchange.getResponseBody()) {
                os.write(bytes);
            }
        });

        server.setExecutor(null);
        server.start();
        System.out.println("Java app listening on port " + port);
    }
}
