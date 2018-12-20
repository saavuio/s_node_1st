// TODO remove (check README)
process.noDeprecation = true;

const HardSourceWebpackPlugin = require('hard-source-webpack-plugin');
const webpack = require('webpack');
const FlowBabelWebpackPlugin = require('flow-babel-webpack-plugin');
const nodeExternals = require('webpack-node-externals');

module.exports = {
  target: "node",
  externals: [nodeExternals({ whitelist: ['dotenv'] })],
  output: {
    libraryTarget: 'umd',
    umdNamedDefine: true
  },
  watchOptions: {
    ignored: /node_modules/,
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [
          { loader: "babel-loader" },
          { loader: "eslint-loader" },
        ],
      },
    ]
  },
  plugins: [
    new webpack.LoaderOptionsPlugin({ options: {} }),
    new webpack.NormalModuleReplacementPlugin(/\/iconv-loader$/, 'node-noop'),
    new FlowBabelWebpackPlugin(),
    // we don't need pg-native (missing it causes an error on compile)
    new webpack.IgnorePlugin(/\.\/native/, /\/pg\//),
    new HardSourceWebpackPlugin(),
  ],
}
