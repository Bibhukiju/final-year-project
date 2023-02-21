"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Area = void 0;
const typeorm_1 = require("typeorm");
const candidates_entity_1 = require("./candidates.entity");
let Area = class Area {
    area_id;
    area;
    candidates;
};
__decorate([
    (0, typeorm_1.PrimaryColumn)({ unique: true }),
    __metadata("design:type", String)
], Area.prototype, "area_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ unique: true }),
    __metadata("design:type", String)
], Area.prototype, "area", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => candidates_entity_1.Candidates, (candidate) => candidate.area),
    __metadata("design:type", Array)
], Area.prototype, "candidates", void 0);
Area = __decorate([
    (0, typeorm_1.Entity)()
], Area);
exports.Area = Area;
