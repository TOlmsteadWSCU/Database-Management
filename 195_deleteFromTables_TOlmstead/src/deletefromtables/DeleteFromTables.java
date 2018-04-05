/*
195
deleteFromTables.java
Travis Olmstead
 */
package deletefromtables;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

/**
 *
 * @author Owner
 */
public class DeleteFromTables {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here// TODO code application logic here
        String dbRes, dbRes2, dbRes3, dbRes4, dbRes5;
          ResultSet rs;
          java.sql.Statement stmt;
          String deleteMore = "Y";

          try
          { 
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://sql3.freemysqlhosting.net/sql3149136", //database url
                      "sql3149136", //MySQL username
                      "2fnHK9UquQ" //MySQL password
              );   //MySQL password
               if (!con.isClosed())
                    System.out.println("*** Delete From Tables ***\n");
                        
               stmt = con.createStatement();
               Scanner scan = new Scanner(System.in);
               while(deleteMore.toLowerCase().equals("y"))
               {
                   rs = stmt.executeQuery("select * from students");

                   while (rs.next()) {
                       dbRes = rs.getString(1);
                       dbRes2 = rs.getString(2);
                       dbRes3 = rs.getString(3);
                       System.out.println(dbRes + " " + dbRes2 + " " + dbRes3);
                   }
                   System.out.println("Enter StudentId for person to delete: ");
                   String studId = scan.nextLine();
                   stmt.executeUpdate("delete from students where studentId = '"+studId+"';");
                   System.out.println("Add another student? Y or N");
                   deleteMore = scan.nextLine();
               }
               
               
               
               rs = stmt.executeQuery("select s.studentId, fname, lname, email, majorName "
                       + "from students s "
                       + "join emails e "
                       + "on s.studentId = e.studentId "
                       + "join studentsXmajors s1 "
                       + "on s.studentId = s1.studentId "
                       + "join majors m "
                       + "on s1.majorId = m.majorId;");

               while (rs.next())
               {
                    dbRes = rs.getString(1);
                    dbRes2 = rs.getString(2);
                    dbRes3 = rs.getString(3);
                    dbRes4 = rs.getString(4);
                    dbRes5 = rs.getString(5);
                    System.out.println(dbRes + " " + dbRes2 + " " + dbRes3 + " " + dbRes4 + " " + dbRes5);
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
