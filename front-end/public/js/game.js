'use strict';
var socket;



var game = new Phaser.Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, update: update, render: render });
var exampleSocket;

function preload() {}

function create() {
    console.log("does this run?");

    //exampleSocket = new WebSocket("ws://www.example.com/socketserver");
    exampleSocket = new WebSocket("ws://localhost:12345/bongo");

    exampleSocket.onopen = function (event) {
        console.log("ready");
    }

    exampleSocket.onmessage = function (event) {
        console.log(event.data);
        exampleSocket.send("Here's some text that the server is urgently awaiting!");
    }

}

function update() {

}

function render() {

}


