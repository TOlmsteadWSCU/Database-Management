/*
195
alumniQueries.java
Travis Olmstead
 */
package alumniqueries;

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
public class AlumniQueries {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String dbRes, dbRes2, dbRes3, dbRes4, dbRes5;
          ResultSet rs;
          Statement stmt;

          try
          { 
               Class.forName("com.mysql.jdbc.Driver").newInstance();      
               Connection con = DriverManager.getConnection(
                    "jdbc:mysql://sql3.freemysqlhosting.net/sql3149136", //database url
                      "sql3149136", //MySQL username
                      "2fnHK9UquQ");   //MySQL password
               if (!con.isClosed())
                    System.out.println("*** Connect ***\n");
                        
               stmt = con.createStatement();
                  
               System.out.println("*** Alumni Queries ***");
               System.out.println("Query #A ");
               
               
               rs = stmt.executeQuery("select s.studentId, fname, lname, SSN, str "
                       + "from students s "
                       + "join private p "
                       + "on s.studentId = p.studentId;");

               while (rs.next())
               {
                    dbRes = rs.getString(1);
                    dbRes2 = rs.getString(2);
                    dbRes3 = rs.getString(3);
                    dbRes4 = rs.getString(4);
                    dbRes5 = rs.getString(5);
                    System.out.println(dbRes + " " + dbRes2 + " " + dbRes3 + " " + dbRes4 + " " + dbRes5);
               }               
               
               System.out.println("Query #B ");
               Scanner scan = new Scanner(System.in);
               System.out.println("Enter first name: ");
               String fname1 = scan.nextLine();
               System.out.println("Enter last name: ");
               String lname1 = scan.nextLine();
               
                   rs = stmt.executeQuery("select s.studentId, fname, lname, email "
                           + "from students s "
                           + "join emails e "
                           + "on s.studentId = e.studentId "
                           + "where fname = '"+fname1+"' and lname = '"+lname1+"';");
                   while(rs.next())
                   {
                       dbRes = rs.getString(1);
                       dbRes2 = rs.getString(2);
                       dbRes3 = rs.getString(3);
                       dbRes4 = rs.getString(4);
                       System.out.println(dbRes + " " + dbRes2 + " " + dbRes3 + " " + dbRes4);
                   }
                   
               System.out.println("Query #C ");
               rs = stmt.executeQuery("select s.studentId, fname, lname, majorName "
                       + "from students s "
                       + "join studentsXmajors s1 "
                       + "on s.studentId = s1.studentId "
                       + "join majors m "
                       + "on s1.majorId = m.majorId "
                       + "where fname = '"+fname1+"' and lname = '"+lname1+"';");
               while(rs.next())
               {
                  dbRes = rs.getString(1);
                  dbRes2 = rs.getString(2);
                  dbRes3 = rs.getString(3);
                  dbRes4 = rs.getString(4);
                  System.out.println(dbRes + " " + dbRes2 + " " + dbRes3 + " " + dbRes4);
               }
               System.out.println("Query #D ");
               rs = stmt.executeQuery("select s.studentId, fname, lname, majorName "
                       + "from students s "
                       + "join studentsXmajors s1 "
                       + "on s.studentId = s1.studentId "
                       + "join majors m "
                       + "on s1.majorId = m.majorId "
                       + "where majorName = 'cs';");
               while(rs.next())
               {
                  dbRes = rs.getString(1);
                  dbRes2 = rs.getString(2);
                  dbRes3 = rs.getString(3);
                  dbRes4 = rs.getString(4);
                  System.out.println(dbRes + " " + dbRes2 + " " + dbRes3 + " " + dbRes4);
               }
               System.out.println("Query #E ");
               System.out.println("Did Barbara Johnson major in CS? Y or N");
               rs = stmt.executeQuery("select fname, lname, majorName "
                       + "from students s "
                       + "join studentsXmajors s1 "
                       + "on s.studentId = s1.studentId "
                       + "join majors m "
                       + "on s1.majorId = m.majorId "
                       + "where fname = 'Barbara' and lname = 'Johnson';");
               while(rs.next())
               {
                   dbRes3 = rs.getString(3);
                   if(dbRes3.equalsIgnoreCase("CS")){
                       System.out.println("Yes");
                       break;
                   }
                   else 
                       System.out.println("No");
               }
               System.out.println("Query #F "); 
               rs = stmt.executeQuery("select fname, lname, email "
                       + "from students s "
                       + "join emails e "
                       + "on s.studentId = e.studentId "
                       + "join studentsXmajors s1 "
                       + "on s.studentId = s1.studentId "
                       + "join majors m "
                       + "on s1.majorId = m.majorId "
                       + "where majorName = 'CS';");
               while(rs.next())
               {
                  dbRes = rs.getString(1);
                  dbRes2 = rs.getString(2);
                  dbRes3 = rs.getString(3);
                  //dbRes4 = rs.getString(4);
                  System.out.println(dbRes + " " + dbRes2 + " " + dbRes3);
               }
               System.out.println("Query #G ");
               rs = stmt.executeQuery("select fname, lname "
                       + "from students "
                       + "where studentId not in "
                       + "(select studentId "
                       + "from studentsXmajors sm "
                       + "left join majors m "
                       + "on sm.majorId = m.majorId "
                       + "where majorName = 'cs'"
                       + ");");
               while(rs.next())
               {
                  dbRes = rs.getString(1);
                  dbRes2 = rs.getString(2);
                  //dbRes3 = rs.getString(3);
                  //dbRes4 = rs.getString(4);
                  System.out.println(dbRes + " " + dbRes2);
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
