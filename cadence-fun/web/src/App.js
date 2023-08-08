import React from 'react'
import { createBrowserRouter, Outlet} from "react-router-dom"
import Header from "./component/Header"
import Content from './component/Content'
import Footer from "./component/Footer"
import Lesson1 from "./component/Lessons/Lesson1"
import Lesson2 from './component/Lessons/Lesson2'
import Lesson3 from './component/Lessons/Lesson3'
import Lesson4 from './component/Lessons/Lesson4'
import Lesson5 from './component/Lessons/Lesson5'
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
        path:"/lesson/1",
        element:<Lesson1 chapter={"Chapter 1: Lesson Overview"} subTitle={"Playing Around in the Flow Playground"} test={"Put it to the test"}/>
      },
      {
        path:"/lesson/:lessonId",
        element:<Lesson2 chapter={"Chapter 2: Contract"} subTitle={"Playing Around in the Flow Playground"} test={"Put it to the test"}/>
      },
      {
        path:"/lesson/:lessonId",
        element:<Lesson3 chapter={"Chapter 3: State Variable"} subTitle={"Playing Around in the Flow Playground"} test={"Put it to the test"}/>
      },
      {
        path:"/lesson/:lessonId",
        element:<Lesson4 chapter={"Chapter 4: Math Operation"} subTitle={"Playing Around in the Flow Playground"} test={"Put it to the test"}/>
      },
      {
        path:"/lesson/:lessonId",
        element:<Lesson5 chapter={"Chapter 5: Struct"} subTitle={"Playing Around in the Flow Playground"} test={"Put it to the test"}/>
      }
    ]
  },
])