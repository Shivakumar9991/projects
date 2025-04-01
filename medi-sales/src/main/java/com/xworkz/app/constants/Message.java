package com.xworkz.app.constants;

import lombok.Getter;

@Getter
public enum Message {

    VALIDATE_AND_LOGIN("Validate and login method started");
    private String message;

    private Message(String message){
        this.message=message;
    }


}
