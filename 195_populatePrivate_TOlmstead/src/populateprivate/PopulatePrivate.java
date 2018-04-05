/*
195
populatePrivate.java
Travis Olmstead
 */
package populateprivate;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author Owner
 */
public class PopulatePrivate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic hereString dbRes;
         String dbRes, dbRes2, dbRes3;
          ResultSet rs;
          String morePrivate = "Y";
          java.sql.Statement stmt;

          try
          { 
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://sql3.freemysqlhosting.net/sql3149136", //database url
                      "sql3149136", //MySQL username
                      "2fnHK9UquQ" //MySQL password
              );   //MySQL password
               if (!con.isClosed())
                    System.out.println("*** Populate Private ***\n");
                        
               stmt = con.createStatement();
               
               Scanner scan = new Scanner(System.in);
               
               stmt.executeUpdate("drop table if exists private;");
               stmt.executeUpdate("create table private (studentId smallint primary key, SSN VARCHAR(11), "
                      + "str longtext, "
                      + "constraint c_private_students foreign key (studentId) references students (studentId) on delete cascade);");

               while(morePrivate.toLowerCase().equals("y"))
               {
                   rs = stmt.executeQuery("select * from students;");

                   while (rs.next()) {
                       dbRes = rs.getString(1);
                       dbRes2 = rs.getString(2);
                       System.out.println(dbRes + " " + dbRes2);
                   }
                   System.out.println("Enter student ID: ");
                   String stu_id = scan.nextLine();
                   System.out.println("Enter Social Security Number: ");
                   String SSN = scan.nextLine();
                   System.out.println("Enter Comment: ");
                   String com = scan.nextLine();
                   stmt.executeUpdate("insert into private (studentId, SSN, str) values "
                           + "('"+stu_id+"', '"+SSN+"', '"+com+"');");
                   System.out.println("Add another student? Y or N");
                   morePrivate = scan.nextLine();
                   
               }
               
               rs = stmt.executeQuery("select * from private;");

                   while (rs.next()) {
                       dbRes = rs.getString(1);
                       dbRes2 = rs.getString(2);
                       dbRes3 = rs.getString(3);
                       System.out.println(dbRes + " " + dbRes2 + " " + dbRes3);
                   }
               con.close();
               if (con.isClosed()) 
                    System.out.println("\n*** Disconnect ***");
          } //end try
          
          catch(SQLException e)
          { e.printStackTrace(); }
          catch (Exception ex)
          { System.out.println("Error: " + ex.getMessage()); }
    }
    
}
