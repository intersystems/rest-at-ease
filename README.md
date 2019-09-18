# REST at Ease
### By Michael Smart
### Presented at InterSystems Global Summit 2019

This repo contains the example applications (Greeting and Lookout) shown shown during the presentation.

**1. Load the spec files**

Swagger specs for the two REST applications are located in the `specs` directory of the repo. Copy these files into your container.

**2. Create the applications**

Open a terminal to the **USER** namespace and run the `^%REST` routine. Create the Greeting and Lookout applications by providing the following information at the prompts. Note: full path to the spec file location in the container is required.

| Application name | Swagger spec           | Web application  |
| ---------------- | ---------------------- | ---------------- |
| Greeting         | greeting.swagger.json  | /greeting        |
| Lookout.Service  | lookout.swagger.json   | /lookout         |

**3. Load the classes**

Using Atelier, load the files from the `RestAtEase` directory into a new project. Compile the project.

Enjoy!

_— MS_