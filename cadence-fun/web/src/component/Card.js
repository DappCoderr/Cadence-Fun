import React from 'react'
import "./Card.css"

const Card = () => {
  return (
    <div className='card'>
        <div className='card-container'>
            <div>
                <h1>Card 1</h1>
            </div>
            <div>
                <p>Card sub text</p>
            </div>
        </div>
    </div>
  )
}

export default Card