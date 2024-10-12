const fs = require('fs');
const path = require('path');
const knex = require('knex')(require('./knexfile').development);

const runSqlScripts = async (directory) => {
  try {
    const files = fs.readdirSync(directory);

    for (const file of files) {
      if (path.extname(file) === '.sql') {
        const filePath = path.join(directory, file);
        console.log(`Executing ${filePath}...`);

        // Read the SQL script
        const sql = fs.readFileSync(filePath, { encoding: 'utf8' });

        // Run the SQL script
        await knex.raw(sql);
        console.log(`Executed ${file}`);
      }
    }

    console.log('All SQL scripts executed successfully.');
  } catch (error) {
    console.error('Error executing SQL scripts:', error);
  } finally {
    // Close the database connection
    await knex.destroy();
  }
};

// Specify the path to your sql-scripts folder
const scriptsPath = path.join(__dirname, 'sql-scripts');

// Run the scripts
runSqlScripts(scriptsPath);
