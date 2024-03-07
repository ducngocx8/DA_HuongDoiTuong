import org.json.JSONArray;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Scanner;

public class TestCode {

    public long ChuanHoa_PriceApi(String s){
       int value = s.indexOf('.');
       return Long.parseLong(s.substring(0, value));
    }

    // GET API
    public void getAPI() {
        try {
//            URL url = new URL("http://localhost:2000/api/v1/products");
            URL url = new URL("https://d19cqcnpm01-api.azurewebsites.net/api/products");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 200 OK
            if (responseCode != 200) {
                throw new RuntimeException("HttpResponseCode: " + responseCode);
            } else {

                StringBuilder informationString = new StringBuilder();
                Scanner scanner = new Scanner(url.openStream());

                while (scanner.hasNext()) {
                    informationString.append(scanner.nextLine() + "\n");
                }
                //Close the scanner
                scanner.close();
                System.out.println(informationString);

                JSONArray jsonArr = new JSONArray(informationString.toString());
                for (int i = 0; i < jsonArr.length(); i++)
                {
                    JSONObject jsonObj = jsonArr.getJSONObject(i);
                    String productPrice_String = jsonObj.get("productPrice").toString();
                    long productPrice = ChuanHoa_PriceApi(productPrice_String);
                    System.out.println(productPrice);
                    System.out.println(jsonObj.get("feaTypes"));
                    JSONArray jArray = (JSONArray) jsonObj.get("feaTypes");
                    for(int j = 0; j<jArray.length(); j++){
                        System.out.println(jArray.get(j));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // POST API
    public void postAPI() {
        try {
            JSONObject jo = new JSONObject();
            jo.put("name", "Hello VIP PRO");
            jo.put("price", 22);
            jo.put("remain", 1235);
            jo.put("description", "Hello VIP PRO");
            jo.put("category_id", 1);
            jo.put("create_date", "2022-01-01 00:00:00.0000000");
            jo.put("update_date", "2022-01-01 00:00:00.0000000");

            URL url = new URL("http://localhost:2000/api/v1/products");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setDoInput(true);
            conn.setDoOutput(true);

            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(jo.toString());
            wr.flush();

            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 200 OK
            if (responseCode != 201) {
                throw new RuntimeException("HttpResponseCode: " + responseCode);
            } else {

                StringBuilder informationString = new StringBuilder();
                Scanner scanner = new Scanner(url.openStream());

                while (scanner.hasNext()) {
                    informationString.append(scanner.nextLine() + "\n");
                }
                //Close the scanner
                scanner.close();
                System.out.println(informationString);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAPI() {
        try {
            String id = "1";
            URL url = new URL("http://localhost:2000/api/v1/products/" + id);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 201 OK
            if (responseCode != 201) {
                System.out.println(responseCode + " not found product by id");
            } else {

                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine = null;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println(response.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // FIND ONE
    public void findOneApi() {
        try {
            String id = "2";
            URL url = new URL("http://localhost:2000/api/v1/products/" + id);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 201 OK
            if (responseCode != 200) {
                System.out.println(responseCode + " not found product by id");
            } else {

                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine = null;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println(response.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // UPDATE - PUT API
    public void updateAPI() {
        try {
            JSONObject json = new JSONObject();
            json.put("id", 2);
            json.put("name", "Hello VIP PRO 22222");
            json.put("price", 2222);
            json.put("remain", 2222);
            json.put("description", "22222");
            json.put("category_id", 1);
            json.put("create_date", "2022-01-01 00:00:00.0000000");
            json.put("update_date", "2022-01-01 00:00:00.0000000");

            URL url = new URL("http://localhost:2000/api/v1/products");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setDoInput(true);
            conn.setDoOutput(true);

            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(json.toString());
            wr.flush();
            conn.connect();

            //Check if connect is made
            int responseCode = conn.getResponseCode();

            // 201 OK
            if (responseCode != 201) {
                System.out.println(responseCode + " not found product by id");
            } else {

                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine = null;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println(response.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        TestCode API = new TestCode();
        API.getAPI();
    }
}