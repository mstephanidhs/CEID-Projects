public class User
{
    private String email;
    private String name;
    
      public User(String name, String email)
    {
        this.name=name;
        this.email=email;
    }
    
      public void setName(String n)
    {
        name=n;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setEmail(String e)
    {
        email=e;
    }
    
    public String getEmail()
    {
        return email;
    }
    
    public String toString()
    {
        return "The name of the user is "+name+" and his/her email is "+email+".";
    }
}
