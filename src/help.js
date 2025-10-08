// run-tests.js
const { spawn } = require("child_process");

function runTests() {
  return new Promise((resolve) => {
    // Spawn a child process to run `npm run test`
    const child = spawn("CI=true", ["npm", "run", "test"], {
      stdio: "inherit", // Show test output in terminal
      shell: true, // Works cross-platform
    });
    // When the process exits
    child.on("close", (code) => {
      if (code === 0) {
        resolve(true); // Success
      } else {
        resolve(false); // Failure
      }
    });

    // If process could not start
    child.on("error", (err) => {
      console.error("Failed to start child process:", err);
      resolve(false);
    });
  });
}

// Run the function
(async () => {
  const success = await runTests();
  console.log("Tests successful?", success);
})();
