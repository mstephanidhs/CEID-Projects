public class Buyer extends User
{
    private int bonus=0;
    private String buyerCategory="BRONZE"; 
    ShoppingCart sc = new ShoppingCart();
    
    public Buyer(String name, String email)
    {
        super(name, email);
    }
    
    public void placeOrder(Item item, int q)
    {
         sc.addItemOrdered(new ItemOrdered(item, q), item); //Φτιάχνω αντικείμενου τύπου ItemOrdered με ορίσματα Item και την ποσότητα που επιθυμεί ο χρήστης
    }
  
    public void awardBonus()
    {
        double data = sc.calculateNet()/10;
        bonus = (int)data;
        setbuyerCategory();
    }
    
    public void setbuyerCategory()
    {
        if (bonus>=100 && bonus<200)
        {
            buyerCategory="SILVER";
        }
        
        if (bonus>=200)
        {
            buyerCategory="GOLD";
        }
    }
    
     public void setBonus(int b)
    {
        bonus=b;
    }
    
    public int getBonus()
    {
        return bonus;
    }
    
    public String getBuyerCategory()
    {
        return buyerCategory;      
    }
    
    public String toString()
    {
        System.out.println(super.toString());
        return "Also, he/she has "+bonus+" points and his/her category is "+buyerCategory+".\n\n";
        
    }
}
