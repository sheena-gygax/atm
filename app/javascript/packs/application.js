// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require('styles/main.css');

require("main")

Rails.start()
ActiveStorage.start()
