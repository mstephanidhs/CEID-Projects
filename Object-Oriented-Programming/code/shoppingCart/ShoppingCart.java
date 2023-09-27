    import java.util.ArrayList;
    import java.util.Scanner;
    
    public class ShoppingCart
    {
        ArrayList<ItemOrdered> orderList = new ArrayList<ItemOrdered>();
        Scanner obj1 = new Scanner(System.in);        
        
    public void checkout(Buyer buyer)
    {
        showCart(buyer);
        String answer;
        int i;
        boolean found=false;
        
        while (found==false)
        {
            System.out.println("Do you want to proceed with your order? y/n?");
            obj1.nextLine();
            answer = obj1.nextLine();
            if (answer=="y")
            {
                buyer.awardBonus();
                for (i=0; i<orderList.size(); i++)
                {
                    orderList.remove(i);
                }
            }
        }
    }
        
    public void addItemOrdered(ItemOrdered item, Item item1)
    {
        int i;
        boolean flag=false; //Χρησιμοποιείται ως flag 
        
        if (item.getQuantity()<=item1.getStock()) //Ελέγχω, αν το quantity υπερβαίνει το stock
        {           
            for (i=0; i<orderList.size(); i++)
            {
               if (orderList.get(i)!=item) //Ελέγχω ότι δεν έχει ήδη προστεθεί το συγκεκριμένο προιον στο καλάθι
               {
                   orderList.add(item);
                   item1.setStock(item1.getStock()-item.getQuantity()); //αλλάζω το stock του προιόντος μέσω της κατάλληλης μεθόδου του αντικειμένου item 
                   System.out.println("The product has been successfully added to your shopping cart.");
                   flag=true;
               }
            }
            
            if (flag==false)
            {
                System.out.println("The product wasn't added in your shopping cart, because the quantity you've entered, is bigger than it's stock.");
                orderList.remove(item);
            }
        }
    }
    
    public boolean showCart(Buyer buyer)
    {
        int i;
        boolean flag=false;
        
        if (orderList.size()!=0)
        {
            for (i=0; i<orderList.size(); i++)
            {
                double total = calculateCourierCost(buyer)+calculateNet();
                System.out.println("Product: "+orderList.get(i).getItem().getName()+"\nQuantity: "+orderList.get(i).getQuantity());
                System.out.println("Price: "+orderList.get(i).getItem().getPrice()+"\nTotalNet: "+calculateNet());
                System.out.println("Shipping Charge: "+calculateCourierCost(buyer)+"\nTotal: "+total);                
            }
            flag=true;
        }
        
        return flag; //Αν flag=false σημαίνει οτι το shopping cart είναι άδειο
    }
    
    public void clearCart()
    {
        int i;
        
        for (i=0; i<orderList.size(); i++)
        {
            orderList.get(i).getItem().setStock(orderList.get(i).getItem().getStock()+orderList.get(i).getQuantity());
            orderList.remove(i);
        }
    }
        
    public void removeItemOrdered()
        {       
            String name, answer;
            int i;
            boolean found=false;
            
            while (found==false)
            {
                System.out.println("Type the name of the product you want to remove from the shopping cart.");
                obj1.nextLine();
                name = obj1.nextLine();
                for (i=0; i<orderList.size(); i++)
                {
                    if (name==orderList.get(i).getItem().getName())
                    {
                        orderList.remove(i);
                        found=true;
                        System.out.println("The product has been successfully removed from your shopping cart.");
                        orderList.get(i).getItem().setStock(orderList.get(i).getItem().getStock()+orderList.get(i).getQuantity()); //Αλλάζω το stock του προιόντος, αφού αφαιρείται απο το shopping cart
                    }
                }
                
                                
                if (found==false)
                {
                        
                    System.out.println("The name of the product you've entered, doesn't exist.");
                    System.out.println("Do you want to retry or exit? Type r or e.");
                    answer = obj1.nextLine();
                    if (answer=="e")
                    {
                        found=true;
                    }
                }                
            }
    }
        
    public void changeItemOrderedQuantity()
    {
            boolean found=false;
            String name, answer;
            int q, i;
            
            while (found==false)
            {
                System.out.println("Type the name of the product you want to change the quantity of.");
                obj1.nextLine();
                name = obj1.nextLine();
                System.out.println("Enter the quantity you want from the specific product.");
                q = obj1.nextInt();
            
            for (i=0; i<orderList.size(); i++)
            {
                if (name==orderList.get(i).getItem().getName())
                {
                   orderList.get(i).setQuantity(q); 
                   found=true;
                   System.out.println("The quantity of the product has been successfully changed.");                   
                }                
            }
            
            if (found==false)
            {
                System.out.println("The name of the product you've entered, doesn't exist.");
                System.out.println("Do you want to retry or exit? Type r or e.");
                obj1.nextLine();
                answer = obj1.nextLine();
                if (answer=="e")
                {
                    found=true;
                }
            }
        }
    }
    
    public double calculateNet()
    {
        double total=0;
        int i;
        
        for (i=0; i<orderList.size(); i++)
        {
            total = orderList.get(i).getItem().getPrice()*orderList.get(i).getQuantity()+total;
        }
        
        return total;               
    }
    
    public double calculateCourierCost(Buyer buyer)
    {
        double shipping=0;
        
        if (buyer.getBuyerCategory()=="BRONZE")
        {
           shipping = 2*calculateNet()/100;
           if (shipping<3)
           {
               shipping=3;
           }
        }
        
        if (buyer.getBuyerCategory()=="SILVER");
        {
            shipping = calculateNet()/100;
        }
        
        if (buyer.getBuyerCategory()=="GOLD")
        {
            shipping=0;
        }
        
        return shipping;
    }
}
