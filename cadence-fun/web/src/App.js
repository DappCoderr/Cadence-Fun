import React from 'react'
import { createBrowserRouter, Outlet} from "react-router-dom"
import Header from "./component/Header"
import Content from './component/Content'
import Footer from "./component/Footer"
import Lesson from "./component/Lesson"
import Error from "./component/Error"
import "./App.css"

const AppLayout = () => (
  <div className='app'>
  <Header/>
  <Outlet/>
  <Footer/>
  </div>
)

export const AppRouter = createBrowserRouter([
  {
    path:"/",
    element:<AppLayout/>,
    errorElement:<Error/>,
    children:[
      {
        path:"/",
        element:<Content/>
      },
      {
        path:"/lesson",
        element:<Lesson/>
      }
    ]
  },
])