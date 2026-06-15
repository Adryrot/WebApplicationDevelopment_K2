package com.lab.bean;

import java.io.Serializable;

public class StudentBean implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String matricNo;
    private String fullname;
    private String password;
    private String base64Image;

    // Default Constructor
    public StudentBean() {}

    // Getters and Setters
    public String getMatricNo() { 
        return matricNo; 
    }
    public void setMatricNo(String matricNo) { 
        this.matricNo = matricNo; 
    }

    public String getFullname() { 
        return fullname; 
    }
    public void setFullname(String fullname) { 
        this.fullname = fullname; 
    }

    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }

    public String getBase64Image() { 
        return base64Image; 
    }
    public void setBase64Image(String base64Image) { 
        this.base64Image = base64Image; 
    }
}