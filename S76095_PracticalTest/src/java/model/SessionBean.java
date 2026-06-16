package model;


public class SessionBean {
    
    private int session_id;
    private String student_name;
    private String branch_location;
    private String lesson_type;
    private String status;
    
    public SessionBean (){}
    
    public SessionBean (String student_name, String branch_location, String lesson_type, String status) {
        
        super();
        this.student_name = student_name;
        this.branch_location = branch_location;
        this.lesson_type = lesson_type;
        this.status = status;
        
    }
    
    public SessionBean (int session_id, String student_name, String branch_location, String lesson_type, String status) {
        
        super();
        this.session_id = session_id;
        this.student_name = student_name;
        this.branch_location = branch_location;
        this.lesson_type = lesson_type;
        this.status = status;
        
    }
    
    public int getsession_id () { 
        return session_id;  
    }
    
    public void setsession_id (int session_id) {
        this.session_id = session_id;
    }
    
    public String getstudent_name (){
        return student_name;
    }
    
    public void setstudent_name (String student_name){
        this.student_name = student_name;
    }
    
    public String getbranch_location (){
        return branch_location;
    }
    
    public void setbranch_location (String branch_location){
        this.branch_location = branch_location;
    }
    
    public String getlesson_type () {
        return lesson_type;
    }
    
    public void setlesson_type (String lesson_type) {
        this.lesson_type = lesson_type;
    }
    
    public String getstatus () {
        return status;
    }
    
    public void setstatus (String status) {
        this.status = status;
    }
    
}