package com.example;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Map;

import org.json.JSONObject;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UDP {

    static Request receive(DatagramSocket ds) throws IOException {
        byte[] bf = new byte[300];
        DatagramPacket dp = new DatagramPacket(bf, bf.length);
        ds.receive(dp);

        System.out.println("-------------------------------------------------");
        System.out.println("[UDP Receive]");
        JSONObject jsonObject = new JSONObject(
                new String(bf));

        Request request = new Request(jsonObject, dp.getAddress(), dp.getPort());
        System.out.println("IP:" + dp.getAddress() + " Port#:" + dp.getPort());
        System.out.println("method: " + request.method);
        System.out.println("route: " + request.route);
        System.out.println(request.data);
        System.out.println("-------------------------------------------------");
        return request;

    }

    static void response(Response message, DatagramSocket ds, InetAddress ip, int port) throws IOException {
        String msg = message.toJson().toString();
        byte[] bf = msg.getBytes();
        DatagramPacket dp = new DatagramPacket(bf, bf.length, ip, port);
        ds.send(dp);
        System.out.println("-------------------------------------------------");
        System.out.println("[UDP Send]");
        System.out.println("IP:" + ip + " Port#:" + port);
        System.out.println(
                "statusCode: " + Integer.toString(message.statusCode) + " statusMessage: " + message.statusMessage);
        System.out.println("data:\n" + message.data);
        System.out.println("-------------------------------------------------");
    }
}
