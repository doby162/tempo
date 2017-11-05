'use strict';
var socket;



var game = new Phaser.Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, update: update, render: render });
var exampleSocket;

var key_a;
var key_s;
var key_d;
var key_f;
var direction = "";

var key_h;
var key_j;
var key_k;
var key_l;
var right_key = "";

var change = true;
var name = "not set";

function preload() {}

function create() {
    key_a = game.input.keyboard.addKey(Phaser.Keyboard.A);
    key_a.onDown.add(move, this);
    key_a.onUp.add(move, this);
    key_s = game.input.keyboard.addKey(Phaser.Keyboard.S);
    key_s.onDown.add(move, this);
    key_s.onUp.add(move, this);
    key_d = game.input.keyboard.addKey(Phaser.Keyboard.D);
    key_d.onDown.add(move, this);
    key_d.onUp.add(move, this);
    key_f = game.input.keyboard.addKey(Phaser.Keyboard.F);
    key_f.onDown.add(move, this);
    key_f.onUp.add(move, this);

    key_h = game.input.keyboard.addKey(Phaser.Keyboard.H);
    key_h.onDown.add(press_h, this);
    key_h.onUp.add(un_press_h, this);
    key_j = game.input.keyboard.addKey(Phaser.Keyboard.J);
    key_j.onDown.add(press_j, this);
    key_j.onUp.add(un_press_j, this);
    key_k = game.input.keyboard.addKey(Phaser.Keyboard.K);
    key_k.onDown.add(press_k, this);
    key_k.onUp.add(un_press_k, this);
    key_l = game.input.keyboard.addKey(Phaser.Keyboard.L);
    key_l.onDown.add(press_l, this);
    key_l.onUp.add(un_press_l, this);

    exampleSocket = new WebSocket("ws://localhost:12345/bongo");

    exampleSocket.onopen = function (event) {
        console.log("Connected.");
    }

    exampleSocket.onmessage = function (event) {
        console.log(event.data);
        if (name == "not set") {
            name = event.data;
        }
        //exampleSocket.send("Here's some text that the server is urgently awaiting!");
    }

}

function update() {
    if (change && name != "not set") {
        change = false;
        exampleSocket.send(name + ":" + direction + ":" + right_key);
    }

}

function render() {

}

function move(event) {
    var old_direction = direction;
    if(key_a.isDown){
        if(key_s.isDown) {direction = "SW";}
        else if (key_d.isDown) {direction = "NW"}
        else {direction = " W";}
    } else if (key_f.isDown) {
        if(key_s.isDown) {direction = "SE";}
        else if (key_d.isDown) {direction = "NE"}
        else {direction = " E";}
    } else {direction = "  ";}
    if (direction != old_direction){
        change = true;
    }
}

function press_h(event) {
    change = true;
    right_key = "H";
}
function un_press_h(event) {
    change = true;
    if(right_key == "H") {
        right_key = "";
    }
}
function press_j(event) {
    change = true;
    right_key = "J";
}
function un_press_j(event) {
    change = true;
    if(right_key == "J") {
        right_key = "";
    }
}
function press_k(event) {
    change = true;
    right_key = "K";
}
function un_press_k(event) {
    change = true;
    if(right_key == "K") {
        right_key = "";
    }
}
function press_l(event) {
    change = true;
    right_key = "L";
}
function un_press_l(event) {
    change = true;
    if(right_key == "L") {
        right_key = "";
    }
}
