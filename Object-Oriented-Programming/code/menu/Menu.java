import java.util.Scanner;

public class Menu
{
    Scanner obj1 = new Scanner(System.in); 
       
    public int menu1()
    {
        System.out.print("\n1.Login.\n");
        System.out.print("2.New User.\n");
        System.out.print("Any other number for Exit.\n");
        System.out.print("Choose action: "); 
        int answer = obj1.nextInt();
        System.out.println("\n");
        return answer;
    }
    
    public int menu2()
    {
        System.out.print("\n1.Browse Store.\n");
        System.out.print("2.View Cart.\n");
        System.out.print("3.Checkout.\n");
        System.out.print("4.Exit Programm\n");
        System.out.println("Any other number for logout.");
        System.out.println("Choose action: ");
        int answer = obj1.nextInt();
        System.out.println("\n");
        return answer;
    }
    
    public int menu3()
    {
        System.out.print("\n\n1.See the options of the product you want.\n");
        System.out.print("2.Clear your entire shopping cart.\n");
        System.out.println("Checkout.\n");
        int answer = obj1.nextInt();
        System.out.println("\n");
        return answer;
    }
    
    public int menu4()
    {
        System.out.print("\n\n1.Delete the order.\n");
        System.out.print("2.Change the quantity of the product.");
        int answer = obj1.nextInt();
        return answer;
    }
    
    public int menu5()
    {
        System.out.print("\n1.Browse Store.\n");
        System.out.print("2.Check Status.\n");
        System.out.print("3.Exit Programm.\n");
        System.out.println("Any other number for logout.");
        System.out.print("Choose action: ");
        int answer = obj1.nextInt();
        System.out.println("\n");
        return answer;
    }
    
    public int login(EShop eshop)
    {
        String name, email;
        int i;
        int k=-1;
        
        System.out.print("Name: ");
        obj1.nextLine();
        name = obj1.nextLine();
        System.out.print("Email: ");
        email = obj1.nextLine();
        
        for (i=0; i<eshop.buyersList.size(); i++)
        {
            if (eshop.buyersList.get(i).getName()==name && eshop.buyersList.get(i).getEmail()==email)
            {
                System.out.println("You have successfully logged in to the eshop.");
                k=i; //Αποθηκεύω την θέση στο ArrayList
            }
        }
        
        if (name=="Marios" && email=="mariostefanidhs@gmail.com")
        {
            System.out.println("Welcome to your store: "+eshop.getName());
            System.out.println("Name: "+eshop.getOwner().getName());
            System.out.println("Email: "+eshop.getOwner().getEmail());
            k=-2; //Χρησιμοποιείται ως flag, για να γνωρίζω ότι έχει βρεθεί o owner
        }
        
        return k;
    }
    
    public void newUser(EShop eshop)
    {
        String name, email;
        
        System.out.print("\nName: ");
        obj1.nextLine();
        name = obj1.nextLine();
        System.out.print("\nEmail: ");
        email = obj1.nextLine();
        
        eshop.buyersList.add(new Buyer(name, email)); //Δημιουργώ καινούργιο αντικείμενο τύπου Buyer
    }
    
}