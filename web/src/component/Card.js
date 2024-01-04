import React from 'react'
import { Link } from 'react-router-dom'
import "./Card.css"

const Card = ({course, subText}) => {
  return (
    <div className='card'>
        <div className='card-container'>
            {/* <div className='card-image'>
              <img src="https://cdn.dribbble.com/users/1605843/screenshots/3351502/hello-01.png?compress=1&resize=400x300"/>
            </div> */}
            <div className='card-title'>
                <h1>{course}</h1>
                <p>{subText}</p>
                <Link to="/lesson/1"><button className='card-btn'>Start</button></Link>
            </div>
        </div>
    </div>
  )
}

export default Card