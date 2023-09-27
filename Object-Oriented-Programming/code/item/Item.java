public class Item
{
    private String name;
    private double price;
    private String description;
    private int stock;
    private int id; 
    
    public Item(String name, double price, String description, int stock, int id)
    {
        this.name=name;
        this.price=price;
        this.description=description;
        this.stock=stock;
        this.id=id;
    }    

    
    public String getBasicInfo()
    {
        return "The name of the product is " + name + " and it costs " + price + " euros.\n";
    }
    
     public String getDetails()
    {
        return "The " + name + " is " + description + " with an ID " + id + " and the stock of the specific product is " + stock + ".\n";
    }
    
    public String toString()
    {
      return getBasicInfo() + getDetails();
    }
    
        public void setName(String n)
    {
        name=n;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setPrice(double p)
    {
        price=p;
    }
    
    public double getPrice()
    {
        return price;
    }
    
    public void setDescription(String d)
    {
        description=d;
    }
    
    public String getDescription()
    {
        return description;
    }
    
    public void setStock(int s)
    {
        stock=s;
    }
    
    public int getStock()
    {
        return stock;
    }
    
    public void setID(int i)
    {
        id=i;
    }
    
    public int getID()
    {
        return id;
    }
}
