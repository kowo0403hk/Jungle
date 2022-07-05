/// <reference types="cypress" />

describe("testing the navigation of the web application", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });
  it("can nagivate to product detail page when a product is clicked on the home page", () => {
    cy.get("[alt='Cliff Collard']").first().click();
    cy.contains(
      "p",
      "The Cliff Collard is a very rare, tiny plant and can be found in damp places."
    );
    cy.get(".main-img").should("be.visible");
    cy.contains(".quantity", "in stock at");
  });
});
