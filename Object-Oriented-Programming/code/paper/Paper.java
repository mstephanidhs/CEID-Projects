public class Paper extends Item
{
    private int weight;
    private int pages;
    
     public Paper(String name, double price, String description, int stock, int id, int weight, int pages)
    {
        super(name, price, description, stock, id);
        this.weight=weight;
        this.pages=pages;
    }
    
     public String toString()
    {
        System.out.print(super.toString());
        return "The weight of the paper is " + weight + " and the number of the pages is " + pages + ".\n";
    }
    
      public void setWeight(int w)
    {
        weight=w;
    }
    
    public int getWeight()
    {
        return weight;
    }
    
    public void setPages(int p)
    {
        pages=p;
    }
    
    public int getPages()
    {
        return pages;
    }
}