GCAP (Generic Community Association Portal)
==========================

- "For posterity's sake" - here's our College Thesis Project. Just wanted to put this out here.
- Sparing you the long paper on what this does: tl;dr - It's a homeowners association management system (Association Staff can bill homeowners dues, Residents can file permits and reserve subdivision/condominium facilities, etc.)
- Coded way back in 2008. This is the code that we actually submitted.
- This comes as a little reflection on how I've come a long way on technical skills. Bearing this project in mind on what I know now: I have a lot more to learn in the next 6 years.

Setup / Development
==========================

I actually forgot, so I have no idea. I went for the code and judging by the code:

- It's a bunch of `Java Server Pages`
- We used Netbeans as our IDE
- Setup a mysql instance on your machine with a database called `thesis` with the following user: 
	- username: root
	- password: root
- Run the `GCAP-Converge DB.sql` file to generate the schema
- Compile this into a war file, with the jar files as dependencies.
- Serve that generated war file along with the `assets` and `jsp` files inside the `web` folder.
- There's no config files, things are hardcoded - hard as a rock.

