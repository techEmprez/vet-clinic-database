<!-- @format -->

# Vet Clinic Database

This project uses a relational database to create the initial data structure for a vet clinic. This includes a table to store animals' information, insert some data into it, and query it.

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

## Schema Diagram

[Live view](https://drawsql.app/teams/ruby-1/diagrams/schema-diagram/embed)

<img width="947" alt="image" src="https://user-images.githubusercontent.com/43815180/198389668-ac4e990b-4b74-42c9-8b9a-a4d36a151603.png">

## Built with

- PostgreSQL
- DrawSQL

<p align="right">(<a href="#top">back to top</a>)</p>

# Authors :bookmark_tabs:

👤 **Choice Osobor**

- GitHub: [@techEmprez](https://github.com/techEmprez)
- Twitter: [@techEmprez](https://twitter.com/techEmprez)
- LinkedIn: [Choice Osobor](https://www.linkedin.com/in/choice-osobor/)

👤 **Mahmoud Rizk**

- GitHub: [@Elerqsousy](https://github.com/Elerqsousy)
- LinkedIn: [Mahmoud (Riz) El Erqsousy](https://www.linkedin.com/in/mahmoud-rizk-elerqsousy/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.

### The following took place:

- Create a table named vets with the following columns:
  id: integer (set it as autoincremented PRIMARY KEY)
  name: string
  age: integer
  date_of_graduation: date
- Inserted data for vets
- Inserted data for visits
- Inserted data for specialization
- Write queries to answer the following:
  Who was the last animal seen by William Tatcher?
  How many different animals did Stephanie Mendez see?
  List all vets and their specialties, including vets with no specialties.
  List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
  What animal has the most visits to vets?
  Who was Maisy Smith's first visit?
  Details for most recent visit: animal information, vet information, and date of
  visit.
  How many visits were with a vet that did not specialize in that animal's species?
  What specialty should Maisy Smith consider getting? Look for the species she gets
  the most.
