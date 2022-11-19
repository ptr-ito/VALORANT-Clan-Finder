import { useAuth0 } from "@auth0/auth0-react";
import React from "react";
import Button from "@mui/material/Button";
import { css } from "@emotion/react";
import UserProfileDropdown from "components/pages/user/UserProfileDropdown";

const LoginButton = () => {
  const { isAuthenticated, loginWithRedirect, logout } = useAuth0();
  if (!isAuthenticated) {
    return (
      <>
        <Button color="inherit" onClick={loginWithRedirect}>
          ログイン
        </Button>
        <Button color="inherit" css={signupButton}>
          新規登録
        </Button>
      </>
    );
  } else {
    return (
      <>
        <UserProfileDropdown />
        {/* <Button
          color="inherit"
          onClick={() => {
            logout({ returnTo: window.location.origin });
          }}
        >
          ログアウト
        </Button> */}
      </>
    );
  }
};

export default LoginButton;

// css
const signupButton = css`
  background-color: #ff4755;
`;
