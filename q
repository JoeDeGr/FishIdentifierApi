
[1mFrom:[0m /mnt/c/Users/jdegr/dev/flatiron/labs/FishIdentifierFolder/fishidentifierAPI/app/controllers/users_controller.rb:56 UsersController#add_genus:

    [1;34m51[0m: [32mdef[0m [1;34madd_genus[0m
    [1;34m52[0m:   [32mif[0m session_user
    [1;34m53[0m:     binding.pry
    [1;34m54[0m:     user = session_user
    [1;34m55[0m:     genus = [1;34;4mGenus[0m.find_by_id(params[[33m:genus[0m][[33m:id[0m])
 => [1;34m56[0m:     binding.pry
    [1;34m57[0m:     [32mif[0m !user.genus.include?(genus)
    [1;34m58[0m:       binding.pry
    [1;34m59[0m:       user.genus.push(genus)
    [1;34m60[0m:       user.save
    [1;34m61[0m:     [32mend[0m
    [1;34m62[0m:     render [35mjson[0m: {[35muser[0m: {[35mid[0m: user.id, [35memail[0m: user.email, [35mname[0m: user.name, [35musername[0m: user.username, [35muser_species[0m: user.species, [35muser_genus[0m: user.genus}}
    [1;34m63[0m:   [32melse[0m
    [1;34m64[0m:     render [35mjson[0m: {[35merrors[0m: [31m[1;31m"[0m[31mLogin Failed. Don't suck, just try again... but better this time.[1;31m"[0m[31m[0m}.to_json
    [1;34m65[0m:   [32mend[0m
    [1;34m66[0m: [32mend[0m

