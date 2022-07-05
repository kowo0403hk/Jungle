/// <reference types="cypress" />

describe("testing the navigation of the web application", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("can nagivate to product detail page when a product is clicked on the home page", () => {
    cy.get("[alt='Giant Tea']").first().click();
    cy.contains("p", "The Giant Tea is an uncommon");
    cy.get(".main-img").should("be.visible");
    cy.contains(".quantity", "in stock at");
  });
});
