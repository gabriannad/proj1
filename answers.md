# Q0: Why is this error being thrown?
There isn't a Pokemon model yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
On the HomeController, trainerless_pokemon is set to a list of Pokemon in the model without trainers (i.e. the trainer_id field is nil) using .where query. Then @pokemon is set to a random Pokemon in that list using the .sample method.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
It creates a button that, when clicked, calls the capture method for Pokemon. The :method parameter defines what kind of HTTP operation (verb) to perform.

# Question 3: What would you name your own Pokemon?
Marty

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
redirect_to @pokemon.trainer
When rake routes is run, the line "trainer GET    /trainers/:id(.:format)           trainers#show" lets me know that if I pass in an instance of Trainer to redirect_to, it will use the path 'trainers/:id', where :id is the ID of the trainer.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
In views/layouts/application.html.erb, after the navigation bar, _message.html.erb is rendered, which displays each message of each error that @pokemon has. 

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
