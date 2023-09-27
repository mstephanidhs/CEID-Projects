import java.util.Scanner;

public class main
{    
    public static void main(String[] args)
    {
        Scanner obj1 = new Scanner(System.in); 
        Menu menu = new Menu();
        
        Buyer buyer1 = new Buyer("Mimi", "mimikollarou@gmail.com");
        Buyer buyer2 = new Buyer("Nicol", "nicolkri@gmail.com");
        
        Owner owner = new Owner("Marios", "mariostefanidhs@gmail.com");
        EShop eshop = new EShop("The magnificent store", owner);
        ShoppingCart shc = new ShoppingCart();
        
        eshop.buyersList.add(buyer1);
        eshop.buyersList.add(buyer2);
        
        Pen pen1 = new Pen("Big", 2, "blue", 10, 0001, "white", 5);
        Pencil pencil1 = new Pencil("Faber Castel", 1.5, "black", 10, 0002, "HB", 5);
        Paper paper1 = new Paper("Mark", 5, "A4", 10, 0003, 50, 100);
        Notebook book1 = new Notebook("SKAG", 15, "A3", 10, 0004, 4);
        
        eshop.itemsList.add(pen1);
        eshop.itemsList.add(pencil1);
        eshop.itemsList.add(paper1);
        eshop.itemsList.add(book1);
  
        int selection1, selection2, selection3, selection4, selection5;
        int q;     
        int credencial, g;
        boolean flag;
        
        selection1 = menu.menu1();        
        
        while (selection1<5 && selection1>0)
        {
            if (selection1==1)
            {
                credencial=menu.login(eshop); //Αν βρεθεί ο χρήστης, επιστρέφω και αποθηκεύω την θέση που βρίσκεται στο array, ώστε να μπορέσω να καλέσω τις μεθόδους/ιδιότηες κλπ του συγκεκριμένου αντικειμένου Buyer
                if (credencial==-1)
                {
                    System.out.println("Wrong credencials\n\n");
                    selection1 = menu.menu1(); //Επιστρέφω το menu1, ωσότου πάρω στοιχεία που αντιστοιχούν σε Buyer ή στον Owner
                }
                else if (credencial==-2) //Έχει κάνει log in ο Owner
                {
                    selection5 = menu.menu5();
                    while (selection5>0 && selection5<4)
                    {
                        switch (selection5)
                        {
                            case 1:
                                eshop.showCategories(); //Εμφανίζω τις κατηγορίες προιόντων που πουλάει το κατάστημα
                                eshop.showProductsInCategory(); //Ανάλογα με την κατηγορία που επιλέγει, εμφανίζω τα προιόντα που ανήκουν σ' αυτήν
                                g = eshop.showProduct();
                                if (g!=-1) //Σημαίνει ότι έχει βρεθεί το προιόν
                                {
                                    eshop.updateItemStock();
                                }
                                break;
                            case 2:
                                eshop.checkStatus();
                                break;
                            case 3:
                                    System.exit(0);
                                    break;                                                         
                        }
                         
                        selection5 = menu.menu5();
                    }
                    
                    selection1 = menu.menu1();
                }
                else //Έχει κάνει log in κάποιος Buyer
                {
                    selection2 = menu.menu2();
                    while (selection2>0 && selection2<6)
                    {
                        switch (selection2)
                        {
                            case 1:
                                eshop.showCategories();
                                eshop.showProductsInCategory();
                                g = eshop.showProduct();
                                if (g!=-1)
                                {
                                    System.out.println("Enter the quantity of the product you want.");
                                    q = obj1.nextInt();
                                    ((Buyer) eshop.buyersList.get(credencial)).placeOrder(eshop.itemsList.get(g), q);
                                }
                                break;
                            case 2:
                                flag=shc.showCart(((Buyer) eshop.buyersList.get(credencial)));
                                if (flag==false)
                                {
                                    System.out.println("Your shopping cart is empty.");
                                }
                                else
                                {
                                    selection3=menu.menu3();
                                    
                                    switch (selection3)
                                    {
                                        case 1:                 
                                            selection4 = menu.menu4();
                                            switch (selection4)
                                            {
                                                case 1:
                                                    shc.removeItemOrdered();
                                                    break;
                                                case 2:
                                                shc.changeItemOrderedQuantity();
                                                    break;
                                            }
                                            break;
                                        case 2:
                                            shc.clearCart();
                                            break;
                                        case 3:
                                            shc.checkout(((Buyer) eshop.buyersList.get(credencial)));
                                            break;
                                    }                                    
                                }
                                break;
                            case 3:
                                    shc.checkout(((Buyer) eshop.buyersList.get(credencial)));
                                    break;
                            case 4:
                                    System.exit(0);
                                    break;                                                          
                        }
                        
                        selection2 = menu.menu2(); //Μετά απο κάθε ολοκλήρωση των υπο-menu, εμφανίζεται το κεντρικό menu του eshop 
                    }
                    
                    selection1 = menu.menu1(); //Με οποιονδήποτε άλλον αριθμό που δεν ταιριάζει στο menu, ο χρήστης κάνει log out
                }
            }
            
            else if (selection1==2) //Περίπτωση που υπάρχει new user
            {
                menu.newUser(eshop);
                selection1 = menu.menu1();
            }                        
        }  
    
    }
}