package com.sandesh;
import java.sql.*;
public class DatabaseMethods {

	//------------------------------------------------------------------------------------
		public static Connection conction() {
			Connection con = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_bus","root","");
				
				if(con!=null)
				{
					System.out.println("connected...");
					return con;
				}
						
			}catch(Exception e) {
				e.printStackTrace();
			}
			return con;
		}
		
		//--------------------------------------------------------------------------------------
		
		
		public static boolean loginInadmin(String u, String p)
		{
			boolean result=false;
			try
			{
		Connection con = conction();
			PreparedStatement st=con.prepareStatement("select * from admin where id=? and pass=?");
			st.setString(1, u);
			st.setString(2, p);
			
			ResultSet rs=st.executeQuery();
			
		     result =rs.next();
			
			}
			catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		   return result;
		}
		
		//-----------------------------------------------------------------------------------\\
		public static boolean signUpinuser(String name,String email,String no,String age,String add,String img) {
			
			boolean result = false;
			
			try {
				Connection con = conction();
				String q = "INSERT INTO `signup` (`name`, `email`, `Age`, `mono`, `add`, `img`) VALUES (?, ?, ?, ?, ?, ?)";
				PreparedStatement st=con.prepareStatement(q);
				 st.setString(1, name);
				// st.setString(2, sname);
				 st.setString(2, email);
				 st.setString(3, no);
				 st.setString(4, age);
				 st.setString(5, add);
				 st.setString(6, img);

				 int rs=st.executeUpdate();
				if(rs!=0) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;	
		}
		
		//--------------------------------------------------------------------------------------
		
		
			public static boolean loginInuser(String u, String p)
			{
				boolean result=false;
				try
				{
			Connection con = conction();
				PreparedStatement st=con.prepareStatement("select * from users where email=? and pass=?");
				st.setString(1, u);
				st.setString(2, p);
				
				ResultSet rs=st.executeQuery();
				
			     result =rs.next();
				
				}
				catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
			   return result;
			}

			
			
			//-----------------------------------------------------------------------------------\\
			
			public static boolean signUpdrivers(String name,String email,String add,String no,String dob,String gen,String pass,String img) {
				
				boolean result = false;
				
				try {
					Connection con = conction();
					String q = "INSERT INTO `drivers` (`name`, `email`, `add`, `no`, `dob`, `gen`, `pass`, `img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement st=con.prepareStatement(q);
					 st.setString(1, name);
					 st.setString(2, email);
					 st.setString(3, add);
					 st.setString(4, no);
					 st.setString(5, dob);
					 st.setString(6, gen);
					 st.setString(7, pass);
					 st.setString(8,img);
					 int rs=st.executeUpdate();
					if(rs!=0) {
						result = true;
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return result;	
			}

			//-----------------------------------------------------------------------------------\\
			public static boolean contactus(String name,String lname,String email,String subject,String msg) {
				
				boolean result = false;
				
				try {
					Connection con = conction();
					String q = "INSERT INTO `contactus` (`name`, `lname`, `email`, `subject`, `msg`) VALUES (?, ?, ?, ?, ?)";
					PreparedStatement st=con.prepareStatement(q);
					 st.setString(1, name);
					 st.setString(2, lname);
					 st.setString(3, email);
					 st.setString(4, subject);
					 st.setString(5, msg);
					 

					 int rs=st.executeUpdate();
					if(rs!=0) {
						result = true;
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return result;	
			}
			
//----------------------------------------------------------------------------------------------------------------
	public static boolean notification(String sname, String rname, String op, String date, String msg) {
		// TODO Auto-generated method stub
		
		boolean result = false;
		
		try {
			Connection con = conction();
			String q = "INSERT INTO `notification` (`sender_name`, `receiver_name`, `msg`, `msgdate`, `op`) VALUES ( ?, ?, ?, ?, ?)";
			PreparedStatement st=con.prepareStatement(q);
			 st.setString(1, sname);
			 st.setString(2, rname);
			 st.setString(3, msg);
			 st.setString(4, date);
			 st.setString(5, op);
			 int rs=st.executeUpdate();
			if(rs!=0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;	
	
	}
//------------------------------------------------------------------------------------------------------------------------ 
	public static boolean studata(String name,String email,String age,String no,String add,String sc,String location,String pass, String img) {
		
		boolean result = false;
		
		try {
			Connection con = conction();
			String q = "INSERT INTO `users` (`name`, `email`, `age`, `mono`, `address`, `schoolname`, `location`, `pass`, `img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st=con.prepareStatement(q);
			 st.setString(1, name);
			 st.setString(2, email);
			 st.setString(3, age);
			 st.setString(4, no);
			 st.setString(5, add);
			 st.setString(6, sc);
			 st.setString(7, location);
			 st.setString(8, pass);
			 st.setString(9, img);
			 int rs=st.executeUpdate();
			if(rs!=0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;	
	}
	//------------------------------------------------------------------------------------------------------------------------

	public static boolean DeleteRegistration(String name) {
	    boolean result = false;
	    Connection con = null;
	    PreparedStatement st = null;

	    try {
	        con = conction();  // Ensure this method provides a valid connection
	        String q = "DELETE FROM signup WHERE name = ?";
	        st = con.prepareStatement(q);
	        st.setString(1, name);
	        int rs = st.executeUpdate();
	        
	        if (rs != 0) {
	            result = true;  // Data deleted successfully
	        }
	    } catch (Exception e) {
	        e.printStackTrace();  // Log the exception for debugging
	    }
	    
	    return result;	
	}

	public static Boolean loginDriver(String u, String p) {
		// TODO Auto-generated method stub
		boolean result=false;
		try
		{
	Connection con = conction();
		PreparedStatement st=con.prepareStatement("select * from drivers where email=? and pass=?");
		st.setString(1, u);
		st.setString(2, p);
		
		ResultSet rs=st.executeQuery();
		
	     result =rs.next();
		
		}
		catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	   return result;
	}



}
