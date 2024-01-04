import React from 'react'
import { useRouteError } from "react-router-dom";

const Error = () => {
  const err = useRouteError();
  return (
    <div>
      <h1>Opps error is made!!</h1>
      <h3>{err.statusText}: {err.status}</h3>
    </div>
  )
}

export default Error