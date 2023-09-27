public class Notebook extends Item
{
    private int sections;
    
     public Notebook(String name, double price, String description, int stock, int id, int sections)
    {
        super(name, price, description, stock, id);
        this.sections=sections;
    }
    
     public String toString()
    {
        System.out.print(super.toString());
        return "The section(s) of the is/are " + sections + ".\n"; 
    }
    
    public void setSections(int s)
    {
        sections=s;
    }
    
    public int getSections()
    {
        return sections;
    }
}