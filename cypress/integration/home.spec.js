/// <reference types="cypress" />

describe("visit the Jungle page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });
  it("displays product categories", () => {
    cy.get(".nav-link").first().should("have.text", "Evergreens");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
});
