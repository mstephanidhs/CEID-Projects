public class ItemOrdered
{
    private Item item;
    private int quantity;
    
    public ItemOrdered(Item item, int quantity)
    {
        this.item=item;
        this.quantity=quantity;
    }
    
    public Item getItem()
    {
        return item;
    }
    
    public void setQuantity(int q)
    {
        quantity=q;
    }
    
    public int getQuantity()
    {
        return quantity;
    }
}