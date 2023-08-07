package Model;
import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Item {
    private int id;
    private Coffee cf;
    private int quantity;

    public Item() {
        super();
    }

    public Item(int id, Coffee cf, int quantity) {
        this.id = id;
        this.cf = cf;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Coffee getCoffee() {
        return cf;
    }

    public void setCoffee(Coffee cf) {
        this.cf = cf;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getTotalPrice()
    {
        return this.quantity*this.cf.getGia();
    }
}
