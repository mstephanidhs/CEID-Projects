public class Pen extends Item
{
    private String color;
    private double tipSize;
    
    public Pen(String name, double price, String description, int stock, int id, String color, double tipSize)
    {
        super(name, price, description, stock, id);
        this.color=color;
        this.tipSize=tipSize;
    }
    
     public String toString()
    {
        System.out.print(super.toString());
        return "The color of the pen is " + color + " and the size of the pencil tip is " + tipSize + "mm.\n";
    }
    
     public void setPcolor(String c)
    {
        color=c;
    }
    
    public String getPcolor()
    {
        return color;
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