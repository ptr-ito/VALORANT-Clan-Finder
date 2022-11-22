import { FC, memo } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { SignIn } from "components/pages/SignIn";
import { SignUp } from "components/pages/SignUp";
import { CommonLayout } from "components/layouts/CommonLayout";
import Header from "components/layouts/Header";

export const Router: FC = memo(() => {
  return (
    <BrowserRouter>
      <Routes>
        <Route element={<Header />}>
          <Route path="/signup" element={<SignUp />} />
          <Route path="/signin" element={<SignIn />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
});
