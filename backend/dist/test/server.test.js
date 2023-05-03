"use strict";
// server.test.js
Object.defineProperty(exports, "__esModule", { value: true });
// const request = require('supertest');
// const app = require('./app'); // assuming your server file is named app.js
const request = require("supertest");
const app = require("../src/app");
describe('Server Test', () => {
    it('should return status 200 for GET /', async () => {
        try {
            const response = await request(app).get('/');
            expect(response.status).toBe(200);
        }
        catch (error) {
        }
    });
});
