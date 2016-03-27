import _ from 'lodash'
import defaults from './default'
import ReactNative from 'react-native'

const Environment = ReactNative.NativeModules.Environment

var config
if ('DEBUG' === Environment.env) {
  config = require('./debug')
} else if ('DEVELOPMENT' === Environment.env) {
  config = require('./development')
} else if ('RELEASE' === Environment.env) {
  config = require('./release')
} else {
  throw `No environment config found for environment: ${Environment.env}`
}

export default _.merge(defaults, config.default)
