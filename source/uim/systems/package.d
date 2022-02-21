module uim.systems;

public import std.stdio;
public import std.string;
public import std.uuid;

public import vibe.d;

public import uim.core;
public import uim.oop;
public import uim.bootstrap;
public import uim.javascript;
public import uim.apps;
public import uim.servers;
public import uim.jsonbase;
public import uim.entitybase;
public import uim.entities;

// Packages
public import uim.systems.controllers;
public import uim.systems.views;

// LAYOUTS
public import layouts.tabler;

public import uim.systems.data;

// Name of the systems tenant
enum systems_TENANT = "systems";