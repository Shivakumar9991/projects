package com.xworkz.app.constants;

import lombok.Getter;

@Getter
public enum ProfilePhotoPath {

    PROFILE_PHOTO_PATH("C:/trustymeds/"),FROM_EMAIL("shivakumartarapur.xworkz@gmail.com"),FROM_NAME("Shiva"),password("lbwd baah tiqa ftdj");

    private String path;

   private ProfilePhotoPath(String path){
        this.path=path;
    }
}
