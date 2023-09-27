import java.util.ArrayList;
import java.util.Scanner;

public class EShop
{
    private String name;
    private Owner owner;
    ArrayList<Item> itemsList = new ArrayList<Item>();
    ArrayList<User> buyersList = new ArrayList<User>();
    Scanner obj1 = new Scanner(System.in);
    
   public EShop(String name, Owner owner)
   {
       this.name =  name;
       this.owner = owner;
   }
   
   public Owner getOwner()
   {
       return owner;
   }
   
   public String getName()
   {
       return name;
   }
   
   public void addItem()
   {
       System.out.println("What type of product do you wanna add? Pen, Pencil, Notebook or Paper?");
       obj1.nextLine();
       String reply = obj1.nextLine();
       int i;
       
       switch(reply)
       {
                case "Pen":
                    System.out.println("Type the name of the pen");
                    String name = obj1.nextLine();
                    System.out.println("Type the price of the pen.");
                    double price = obj1.nextDouble();
                    System.out.println("Give a description for the pen.");
                    String description = obj1.nextLine();
                    System.out.println("Type the stock of the specific product.");
                    int stock = obj1.nextInt();
                    System.out.println("Type the ID of the pen.");
                    int ID = obj1.nextInt();
                    System.out.println("Type the color of the pen.");
                    String color = obj1.nextLine();
                    System.out.println("Type the tipSize of the pen.");
                    double tipSize = obj1.nextDouble();
                    for (i=0; i<itemsList.size(); i++)
                    {
                        if (ID==itemsList.get(i).getID())
                        {
                            System.out.println("The product you've entered, already exists.");
                        }
                        else
                        {
                           itemsList.add(new Pen(name,price, description, stock, ID, color,tipSize));
                           System.out.println("The product has been successfully added to the eshop.");
                        }
                    }
                    break;
                case "Pencil":
                    System.out.println("Type the name of the pencil");
                    String Pname = obj1.nextLine();
                    System.out.println("Type the price of the pencil.");
                    double Pprice = obj1.nextDouble();
                    System.out.println("Give a description for the pencil.");
                    String Pdescription = obj1.nextLine();
                    System.out.println("Type the stock of the specific product.");
                    int Pstock = obj1.nextInt();
                    System.out.println("Type the ID of the pencil.");
                    int PID = obj1.nextInt();
                    System.out.println("Enter the type of the pencil.");
                    String type = obj1.nextLine();
                    System.out.println("Enter the tipsize of the pencil");
                    double PtipSize = obj1.nextDouble();
                    for (i=0; i<itemsList.size(); i++)
                    {
                        if (PID==itemsList.get(i).getID())
                        {
                            System.out.println("The product you've entered, already exists.");
                        }
                        else
                        {
                            itemsList.add(new Pencil(Pname, Pprice, Pdescription, Pstock, PID, type, PtipSize));
                            System.out.println("The product has been successfully added to the eshop.");
                        }
                    }
                    break;
                case "Notebook":
                    System.out.println("Type the name of the notebook");
                    String Nname = obj1.nextLine();
                    System.out.println("Type the price of the notebook.");
                    double Nprice = obj1.nextDouble();
                    System.out.println("Give a description for the notebook.");
                    String Ndescription = obj1.nextLine();
                    System.out.println("Type the stock of the specific product.");
                    int Nstock = obj1.nextInt();
                    System.out.println("Type the ID of the notebook.");
                    int NID = obj1.nextInt();
                    System.out.println("Type the number of sections that the notebook has.");
                    int sections = obj1.nextInt();
                    for (i=0; i<itemsList.size(); i++)
                    {
                        if (NID==itemsList.get(i).getID())
                        {
                            System.out.println("The product you've entered, already exists.");                            
                        }
                        else
                        {
                            itemsList.add(new Notebook(Nname, Nprice, Ndescription, Nstock, NID, sections));
                            System.out.println("The product has been successfully added to the eshop.");
                        }
                    }
                    break;
                case "Paper":
                    System.out.println("Type the name of the paper");
                    String PAname = obj1.nextLine();
                    System.out.println("Type the price of the paper.");
                    double PAprice = obj1.nextDouble();
                    System.out.println("Give a description for the paper.");
                    String PAdescription = obj1.nextLine();
                    System.out.println("Type the stock of the specific product.");
                    int PAstock = obj1.nextInt();
                    System.out.println("Type the ID of the paper.");
                    int PAID = obj1.nextInt();
                    System.out.println("Type the weight of the paper.");
                    int weight = obj1.nextInt();
                    System.out.println("Enter the number of the pages that the paper has");
                    int pages = obj1.nextInt();
                    for (i=0; i<itemsList.size(); i++)
                    {
                        if (PAname==itemsList.get(i).getName())
                        {
                            System.out.println("The product you've entered, already exists.");                           
                        }
                        else
                        {
                            itemsList.add(new Paper(PAname, PAprice, PAdescription, PAstock, PAID, weight, pages)); 
                            System.out.println("The product has been successfully added to the eshop.");
                        }
                    }
                    break;
       }      
   }
    
   public void getItemsById()
   {
       boolean found=false;  
       int ID;
       String answer;
    
       while(found==false)
       {
           System.out.println("Type the ID of the product.");
           obj1.nextLine();
           ID = obj1.nextInt();
           int i;
           for (i=0; i<itemsList.size(); i++)
           {
               if(ID==itemsList.get(i).getID())
               {
                   System.out.println(itemsList.get(i).toString());
                   found=true;
               }                          
           }
            
           if (found==false)
           {                
              System.out.println("There isn't any product with the specific ID, you entered.");
              System.out.println("Do you want to retry or exit? Type r or e.");
              obj1.nextLine();
              obj1.nextLine();
              answer =obj1.nextLine();
              if (answer=="e")
              {
                 found=true;
              }               
           }
       }     
   }
   
   public void removeItem()
   {
       boolean found=false;
       String name, answer;
    
         while(found==false)
       {
           System.out.println("Type the product you want to remove.");
           obj1.nextLine();
           name = obj1.nextLine();
           int i;
           for (i=0; i<itemsList.size(); i++)
           {
               if (name==itemsList.get(i).getName())
               {
                   itemsList.remove(i);
                   System.out.println("The removal of the product has been successful.");
                   found=true;
                }         
            }
            
           if (found==false)
           {
                
                System.out.println("The name of the product you've ented doesn't exist.");
                System.out.println("Do you want to retry ot exit? Type r or e.");
                obj1.nextLine();
                answer = obj1.nextLine();
                if (answer=="e")
                {
                   found=true;
                }
           }                
        }         
    }
    
   public void removeBuyer()
   {
       boolean found=false;
       String name, answer;
       
        while(found==false)
       {
           System.out.println("Type the name of the buyer you want to remove.");
           obj1.nextLine();
           name = obj1.nextLine();
           int i;
           for (i=0; i<buyersList.size(); i++)
           {
               if (name==buyersList.get(i).getName())
               {
                   buyersList.remove(i);
                   System.out.println("The removal of the buyer has been successful.");
                   found=true;
               }
           }
           
           if (found==false)
           {
               
               System.out.println("The name of the buyer you' entered, doesn't exist.");
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
   
   public void updateItemStock()
   {
       int i, stock; 
       boolean found=false; //Χρησιμοποιείται ως flag, σε περίπτωση λανθασμένης εισόδου απο τον χρήστη
       String name, answer;
       
       while (found==false)
       {
           System.out.println("Type the name of the product you want to change the stock of.");
           obj1.nextLine();
           name = obj1.nextLine();
           System.out.println("Enter the stock.");
           stock = obj1.nextInt();       
           for (i=0; i<itemsList.size(); i++)
           {
               if (name==itemsList.get(i).getName()) //Εντοπίζει το όνομα του προιόντος στην λίστα και αλλάζει το stock του
               {
                   itemsList.get(i).setStock(stock);
                   found=true;
                   System.out.println("The stock of the product has succcessfully changed,");
               }
            }
            
                           
           if (found==false)
           {
                System.out.println("The product doesn't exist.");
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
   
   public int showProduct()
   {
       boolean found=false;
       String name, answer;
       int i;
       int w=-1; //Χρηησιμοποιείται ως δείκτης, ώστε να γνωρίζω ποιο προιόν έχει επιλεχθεί απο την itemsOrder List
       
       while(!found)
       {
           System.out.println("Type the name of the product of which you want to see the information.");
           obj1.nextLine();
           name = obj1.nextLine();
           
           for (i=0; i<itemsList.size(); i++)
           {
               if (name==itemsList.get(i).getName())
               {
                   System.out.println(itemsList.get(i).toString());
                   found=true;
                   System.out.println("Do you want to add it in your shopping cart? y/n?");
                   answer = obj1.nextLine(); 
                   if (answer=="y")
                   {
                       w=i;
                   }
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
       
       return w;
   }
   
   public void showCategories()
   {
       System.out.println("The eshop sells: \n1.Pen \n2.Pencil \n3.Notebook \n4.Paper");
   }
   
   public void checkStatus()
   {
       int i;
       for (i=0; i<buyersList.size(); i++)
       {
        System.out.println(buyersList.get(i).toString()); //Εμφανίζει όλα τα στοιχεία των Buyer 
       }       
   }
   
   public void showProductsInCategory()
   {
       int answer, i;
       System.out.println("Select the category that you want to see by giving the suitable number.");
       obj1.nextLine();
       answer =  obj1.nextInt();
       
       switch (answer)
       {
           case 1:
                for (i=0; i<itemsList.size(); i++)
                {
                    if (itemsList.get(i) instanceof Pen)
                    {
                        System.out.println(itemsList.get(i).toString());
                    }
                }                
                break;           
           case 2:
                for (i=0; i<itemsList.size(); i++)
                {
                    if (itemsList.get(i) instanceof Pencil)
                    {
                         System.out.println(itemsList.get(i).toString());
                    }
                }
                break;
           case 3:
                for (i=0; i<itemsList.size(); i++)
                {
                   if (itemsList.get(i) instanceof Notebook)
                   {
                       System.out.println(itemsList.get(i).toString());
                   }
                }
                break;
           case 4:
                for (i=0; i<itemsList.size(); i++)
                {
                    if (itemsList.get(i) instanceof Paper)
                    {
                        System.out.println(itemsList.get(i).toString());
                    }
                }
                break;
       }
   }
}