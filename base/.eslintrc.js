module.exports = {
  "extends": [
    "airbnb-base",
    "plugin:flowtype/recommended"
  ],
  "plugins": [
    "flowtype"
  ],
  "rules": {
    "no-restricted-syntax": [
      "error",
      {
        "selector": "ForInStatement",
        "message": "for..in loops iterate over the entire prototype chain, which is virtually never what you want. Use Object.{keys,values,entries}, and iterate over the resulting array."
      },
      {
        "selector": "LabeledStatement",
        "message": "Labels are a form of GOTO; using them makes code confusing and hard to maintain and understand."
      },
      {
        "selector": "WithStatement",
        "message": "`with` is disallowed in strict mode because it makes code impossible to predict and optimize."
      }
    ],
    "object-curly-newline": [
      "error",
      {
        "ObjectExpression": {
          "minProperties": 5,
          "multiline": true,
          "consistent": true
        },
        "ObjectPattern": {
          "minProperties": 5,
          "multiline": true,
          "consistent": true
        },
        "ImportDeclaration": {
          "minProperties": 5,
          "multiline": true,
          "consistent": true
        },
        "ExportDeclaration": {
          "minProperties": 5,
          "multiline": true,
          "consistent": true
        }
      }
    ],
    "max-len": ["error", 150, 2, {
      "ignoreUrls": true,
      "ignoreComments": false,
      "ignoreRegExpLiterals": true,
      "ignoreStrings": true,
      "ignoreTemplateLiterals": true,
    }],
    "no-console": ["error", { "allow": ["log", "debug", "warn", "error"] }],
    "flowtype/no-weak-types": 0,
    "flowtype/require-parameter-type": 2,
    "flowtype/require-return-type": 2,
    "flowtype/require-valid-file-annotation": 2,
    "flowtype/semi": 2,
    // eslint keeps shouting:
    // "error 'express' should be listed in the project's dependencies. ... import/no-extraneous-dependencies"
    // for everything in package.json.
    // ...
    // This might work: https://github.com/benmosher/eslint-plugin-import/issues/496
    // could not figure out whats going on with this, so the rule is disabled for now.
    "import/no-extraneous-dependencies": 0,
  },
  "settings": {
    "flowtype": {
      "onlyFilesWithFlowAnnotation": true
    },
    "import/resolver": {
      "node": {},
      "babel-plugin-root-import": {}
    }
  }
};
