import React from "react";
import Header from "./components/layouts/Header";
import { BrowserRouter } from "react-router-dom";

const App = () => {
  return (
    <>
      <BrowserRouter>
        <Header />
      </BrowserRouter>
    </>
  );
};

export default App;
