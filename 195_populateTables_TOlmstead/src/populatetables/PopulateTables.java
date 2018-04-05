/*
195
populateTables.java
Travis Olmstead
 */
package populatetables;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/**
 *
 * @author Owner
 */
public class PopulateTables {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        // TODO code application logic here
        String dbRes1, dbRes2, dbRes3, dbRes4, dbRes5, dbRes6;
        ResultSet rs;
        Statement stmt;
        String str = "Y";
        String strEmails = "Y";
        String strMajors = "Y";

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://sql3.freemysqlhosting.net/sql3149136", //database url
                    "sql3149136", //MySQL username
                    "2fnHK9UquQ" //MySQL password
            );
   //MySQL password
            
            if (!con.isClosed()) {
                System.out.println("*** Connect ***\n");
            }

            stmt = con.createStatement();
            Scanner scan = new Scanner(System.in);
//            stmt.executeUpdate("truncate table students;");
//            stmt.executeUpdate("truncate table emails");
//            stmt.executeUpdate("truncate table majors");
//            stmt.executeUpdate("truncate table studentsXmajors");
            
            stmt.executeUpdate("drop table if exists studentsXmajors;");
            stmt.executeUpdate("drop table if exists emails;");
            stmt.executeUpdate("drop table if exists private;");
            stmt.executeUpdate("drop table if exists students;");
            stmt.executeUpdate("drop table if exists majors;");
            
            stmt.executeUpdate("create table students (studentId smallint primary key auto_increment, "
                    + "fname varchar(30), lname varchar(30));");
            stmt.executeUpdate("create table private (studentId smallint primary key, SSN VARCHAR(11), "
                    + "str longtext, "
                    + "constraint c_private_students foreign key (studentId) references students (studentId) on delete cascade);");
            stmt.executeUpdate("create table emails (emailId smallint primary key auto_increment, "
                    + "studentId smallint, email varchar(60) not null,"
                    + "constraint c_emails_students foreign key (studentId) references students (studentId) on delete cascade);");
            stmt.executeUpdate("create table majors (majorId smallint primary key auto_increment, majorName varchar(10));");
            stmt.executeUpdate("create table studentsXmajors (studentId smallint, majorId smallint,"
                    + "constraint c_Xmajors_students foreign key (studentId)references students (studentId) on delete cascade,"
                    + "constraint c_Xstudents_majors foreign key (majorid) references majors (majorId) on delete cascade);");
            
            
            
            stmt.executeUpdate("insert into majors (majorName) values ('law');");
            stmt.executeUpdate("set @law_id = last_insert_id();");
            stmt.executeUpdate("insert into majors (majorName) values ('cs');");
            stmt.executeUpdate("set @cs_id = last_insert_id();");
            stmt.executeUpdate("insert into majors (majorName) values ('math');");
            stmt.executeUpdate("set @math_id = last_insert_id();");
            
            stmt.executeUpdate("insert into students (fname, lname) values ('Gary', 'Hudson')");
            stmt.executeUpdate("set @gary_id = last_insert_id();");
            stmt.executeUpdate("insert into students (fname, lname) values ('Barbara', 'Johnson')");
            stmt.executeUpdate("set @barb_id = last_insert_id();");
            stmt.executeUpdate("insert into students (fname, lname) values ('Mike', 'Lopez')");
            stmt.executeUpdate("set @mike_id = last_insert_id();");
            
            stmt.executeUpdate("insert into emails (studentId, email) values (@gary_id, 'gary@hudsonlaw.com')");
            stmt.executeUpdate("insert into emails (studentId, email) values (@gary_id, 'garyh@gmail.com')");
            stmt.executeUpdate("insert into emails (studentId, email) values (@barb_id, 'barbara@johnsoneng.com')");
            stmt.executeUpdate("insert into emails (studentId, email) values (@mike_id, 'mikeylikesit@gmail.com')");
            stmt.executeUpdate("insert into emails (studentId, email) values (@mike_id, 'mikethebike@mc.com')");
            
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@gary_id, @cs_id);");
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@gary_id, @law_id);");
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@barb_id, @cs_id);");
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@barb_id, @math_id);");
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@mike_id, @math_id);");
            stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@mike_id, @law_id);");
//            
//            rs = stmt.executeQuery("select * from emails;");
//               
//            while (rs.next()) {
//                dbRes1 = rs.getString(1);
//                dbRes2 = rs.getString(2);                
//                //dbRes3 = rs.getString(3);
//                System.out.println(dbRes1 + " " + dbRes2);
//                
//            }
//            
            
            
            
            while(str.toLowerCase().equals("y"))
            {
                //str = "y";
                System.out.println("Enter first name: ");
                String firstName = scan.nextLine();
                System.out.println("Enter last name: ");
                String lastName = scan.nextLine();
                stmt.executeUpdate("insert into students (fname, lname) values ('"+firstName+"', '"+lastName+"');");
                stmt.executeUpdate("set @stud_id = last_insert_id();");
                
                while(strEmails.toLowerCase().equals("y"))
                {
                    System.out.println("Enter email: ");
                    String email = scan.nextLine();
                    stmt.executeUpdate("insert into emails (studentId, email) values (@stud_id, '"+email+"')");
                    System.out.println("Add another email? Y or N");
                    strEmails = scan.nextLine();
                    //strEmails = "y";
                }
                strEmails = "y";
                while(strMajors.toLowerCase().equals("y"))
                {
                    System.out.println("Enter major: ");
                    strMajors = scan.nextLine();
                    stmt.executeUpdate("insert into studentsXmajors (studentId, majorId) values (@stud_id, (select majorId from majors where majorName = '"+strMajors+"' limit 1));");
                    System.out.println("Add another major? Y or N");
                    strMajors = scan.nextLine();
                }
                strMajors = "y";
                System.out.println("Do you want to add another student? Y or N");
                str = scan.nextLine();
                //str = "y";
            }
                   
//            stmt.executeUpdate("insert into students (fname, lname) values ('Barbara', 'Johnson');");
                rs = stmt.executeQuery("select s1.studentId, fname, lname, email, majorName\n"
                    + "from students s1\n"
                    + "join emails e\n"
                    + "on s1.studentId = e.studentId\n"
                    + "join studentsXmajors s2\n"
                    + "on s1.studentId = s2.studentId\n"
                    + "join majors m\n"
                    + "on s2.majorId = m.majorId\n"
                    + "having s1.studentId;");
                while (rs.next()) {
                dbRes1 = rs.getString(1);
                dbRes2 = rs.getString(2);                
                dbRes3 = rs.getString(3);
                dbRes4 = rs.getString(4);
                dbRes5 = rs.getString(5);
                //dbRes6 = rs.getString(6);
                System.out.println(dbRes1 + " " + dbRes2 + " " + dbRes3 + " " + dbRes4 + " " + dbRes5);
                
            }
            
            
            
            con.close();
            if (con.isClosed()) {
                System.out.println("\n*** Disconnect ***");
            }
        } //end try
        catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }  //end main
}
