const fs = require('fs');
const { loadPolicy } = require("@open-policy-agent/opa-wasm");

// Read the policy wasm file
const policyWasm = fs.readFileSync('policy.wasm');

// Load the policy module asynchronously
loadPolicy(policyWasm).then(policy => {

    // Use console parameters for the input, do quick
    // validation by json parsing. Not efficient.. but
    // will raise an error
    const input = {password: 'ABC12aaABC'}
    // Provide a data document with a string value
    policy.setData({policy: {
        'minlength': 6,
        'maxlength': 16,
        'uppercase': 2,
        'number': 2,
        'regex': '^ABC'
    }});

    // Evaluate the policy and log the result
    const result = policy.evaluate(input);
    
    console.log(JSON.stringify(result[0].result, null, 2))

}).catch(err => {
    console.log("ERROR: ", err);
    process.exit(1);
});