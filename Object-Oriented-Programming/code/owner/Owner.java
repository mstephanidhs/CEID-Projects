public class Owner extends User
{
    private boolean admin=true;
    
     public Owner(String name, String email)
    {
        super(name, email);
    }
    
    public void isAdmin(boolean a)
    {
        admin=a;
    }
    
    public boolean getAdmin()
    {
        return admin;
    }
}

