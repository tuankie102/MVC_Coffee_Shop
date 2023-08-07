/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

/**
 *
 * @author ADMIN
 */
import DAO.SQLDataAccess;
import Model.*;
import java.sql.ResultSet;
import java.sql.SQLException;
public class CoffeeService {
    SQLDataAccess con;
    public CoffeeService() {
        con = new SQLDataAccess();
    }
    
    public Coffee getCoffeebyId(int cfId)
    {
        Coffee cf = null;
        String sqlFind = " select * from tbMenu where maSP=?";
         
        try {
            ResultSet rs = con.getResultSet(sqlFind, new Object[]{cfId});
            rs.next();
            if(rs!=null)
            {
                int coffeeId = rs.getInt("maSP");
                String cfName = rs.getString("tenSP");
                int cfPrice = rs.getInt("donGia");
                String cfImage = rs.getString("hinhAnh");
                String cfDes = rs.getString("moTa");
                int cfType = rs.getInt("maLoai");
                cf = new Coffee(coffeeId,cfName,cfPrice,cfImage,cfDes,cfType);
                System.out.println("Tim thay maSP la: "+ coffeeId);
            }
            else
            {
                System.out.println("Tim khong thay maSP");
            }
            
            
        } catch (SQLException e) {
        }
        
        return cf;
    }
    
}
