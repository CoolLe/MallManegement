package com.coolle.tool;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class MyFileUpload {

    public static List<String> upload_image(MultipartFile[] files) {

        String path = null;
        path = MyPropertyUtil.getProperty("imageUpload.properties","windows_path");
        List<String> list_image = new ArrayList<String>();

        for (int i = 0; i < files.length; i++){

            if (!files[i].isEmpty()) {
                String originalFileName = files[i].getOriginalFilename();
                String name = System.currentTimeMillis() + originalFileName;

                String upload_name = path + "/" + name;

                upload_name  = upload_name.replaceAll("\\\\","/");
                System.out.println(upload_name);

                try {
                    System.out.printf(upload_name);
                    files[i].transferTo(new File(upload_name));
                    list_image.add(name);
                } catch (IllegalStateException e){
                    e.printStackTrace();
                } catch (IOException e){
                    e.printStackTrace();
                }
            }


        }

        return list_image;
    }
}
