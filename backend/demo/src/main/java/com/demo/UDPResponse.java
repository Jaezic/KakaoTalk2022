package com.demo;

import java.util.Map;

import org.json.JSONObject;

public class UDPResponse {
    int statusCode;
    String statusMessage;
    JSONObject data;

    UDPResponse(int statusCode, String statusMessage, JSONObject data) {
        this.statusCode = statusCode;
        this.statusMessage = statusMessage;
        this.data = data;

    }

    JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("statusCode", statusCode);
        json.put("statusMessage", statusMessage);
        json.put("data", data);
        return json;
    }
}
