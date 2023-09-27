public class Pencil extends Item
{
     private String type;
    private double tipSize;
    
     public Pencil(String name, double price, String description, int stock, int id, String type, double tipSize)
    {
        super(name, price, description, stock, id);
        this.type=type;
        this.tipSize=tipSize;
    }
    
    public String toString()
    {
        System.out.print(super.toString());
        return "The pencil is the type of " + type + " and the pencil tip is " + tipSize + "mm.\n";
    }
    
      public void setType(String t)
    {
        type=t;
    }
    
    public String getType()
    {
        return type;
    }
    
    public void setTipSize(double ts)
    {
        tipSize=ts;
    }
    
    public double getTipSize()
    {
        return tipSize;
    }
}
