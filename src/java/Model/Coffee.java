package Model;
import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Coffee{
    private int id;
    private String ten;
    private int gia;
    private String image;
    private String mota;
    private int maLoai;

    public Coffee() {
    }

    public Coffee(int id, String ten, int gia, String image, String mota, int maLoai) {
        this.id = id;
        this.ten = ten;
        this.gia = gia;
        this.image = image;
        this.mota = mota;
        this.maLoai = maLoai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(int maLoai) {
        this.maLoai = maLoai;
    }
    
}
