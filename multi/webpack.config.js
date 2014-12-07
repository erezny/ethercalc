var webpack = require('webpack');
module.exports = {
    entry: [
        'webpack-dev-server/client?http://localhost:8080',
        'webpack/hot/dev-server',
        './main.ls'
    ],
    output: {
        path: __dirname + '/static/',
        filename: 'multi.js',
        publicPath: '/static/'
    },
    plugins: [
        new webpack.HotModuleReplacementPlugin()
    ],
    module: {
        loaders: [
            { test: /main\.ls$/, loaders: [ 'react-hot', 'livescript' ] },
            { test: /\.styl$/, loader: 'style!css!stylus' },
        ]
    },
}