GCAP (Generic Community Association Portal)
==========================

- "For posterity's sake" - here's our College Thesis Project. Just wanted to put this out here.
- Sparing you the long paper on what this does: tl;dr - It's a homeowners association management system (Association Staff can bill homeowners dues, Residents can file permits and reserve subdivision/condominium facilities, etc.)
- Coded way back in 2008. This is the code that we actually submitted.
- This comes as a little reflection on how I've come a long way on technical skills. Bearing this project in mind on what I know now: I have a lot more to learn in the next 6 years.

Setup / Development
==========================

Got this up here just for a little code review, not to actually dev on it again. I actually forgot on how to get this up and running, so I have no idea. I went for the code and judging by the code, here's a sprinkle of tips on how to get it running:

- It's a bunch of `Java Server Pages`
- We used Netbeans as our IDE, (I have limited knowledge on how Netbeans packages it up for release)
- Setup a mysql instance on your machine with a database called `thesis` with the following user: 
	- username: root
	- password: root
- Run the `GCAP-Converge DB.sql` file to generate the schema
- Compile the `src` folder into a war file, with the jar files in the root folder as dependencies.
- Serve that generated war file along with the `assets` and `jsp` files inside the `web` folder.

Authors
==========================

- Ace Subido
- Jemuel Dalino
- Pao Domingo
- Jay-R Tuason

*Special Thanks to*

- Badit Cuason (star player)
