import React from "react";

const LoadingBar = ({ isLoading }) => {
  if (!isLoading) return null;
  return (
    <div className="fixed top-0 left-0 w-full h-1 bg-blue-500 animate-pulse" />
  );
};

export default LoadingBar;