package lab6.com;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Student {
    private String stuno;
    private String name;
    private String program;

    public Student() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getStuno() {
        Pattern pt = Pattern.compile("[A-Z0-9]*");
        Matcher mt = pt.matcher(stuno);
        boolean bl = mt.matches();

        if (bl == true) {
            return stuno;
        } else {
            throw new IllegalArgumentException("Invalid Student Number layout "
                    + "format structural convention! Pattern mismatch error.");
        }
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }
}