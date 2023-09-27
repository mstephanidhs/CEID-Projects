struct variable
{
	char *name;
	struct variable *next;
};

typedef struct variable variable;
variable *var_table = (variable *)0;

variable *insert ();
variable *search ();

variable *insert ( char *var_name )
{
	variable *ptr;
	ptr = (variable *) malloc (sizeof(variable));
	ptr->name = (char *) malloc (strlen(var_name)+1);
	strcpy (ptr->name,var_name);
	ptr->next = (struct variable *)var_table;
	var_table = ptr;
	return ptr;
}

variable *search ( char *var_name )
{
	variable *ptr;
	for (ptr = var_table; ptr != (variable *)0; ptr = (variable *)ptr->next)
	if (strcmp (ptr->name,var_name) == 0) return ptr;
	return 0;
}
