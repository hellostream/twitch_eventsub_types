const fs = require("fs");

const data = JSON.parse(fs.readFileSync("./schema.json"));

const output = {
  $schema: "http://json-schema.org/draft-07/schema#",
  definitions: {},
};

data.forEach((schema) => {
  output.definitions[schema.name] = schema.event_schema;
});

fs.writeFileSync("./schema_fixed.json", JSON.stringify(output));
