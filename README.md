GCAP (Generic Community Association Portal)
==========================

- Sparing you the long paper on what this does: tl;dr - It's a homeowners association management system (residents having their own accounts, can bill homeowners dues, file permits and reserve subdivision/condominium facilities, etc.)
- "For posterity's sake" - here's our College Thesis Project. Just wanted to put this out here for posterity's sake.
- Coded way back in 2008.
- A little reflection on how I've come a long way on technical skills, and bearing that in mind on what I know now: I have a lot more to learn.

Setup / Development
==========================

I actually forgot, so I have no idea. I went for the code and judging by the code:

- We used Netbeans as our IDE
- Setup a mysql instance on your machine with a database called `thesis` with the following user: 
	- username: root
	- password: root
- Run the `GCAP-Converge DB.sql` file to generate the schema
- Compile this into a war file, with the jar files as dependencies.
- Serve that generated war file along with the `assets` inside the `web` folder.
- There's no config files, things are hardcoded - hard as a rock.

