// This is a thin wrapper around Daniel Schep's functions here
// https://gitlab.com/trailstash/ultra/-/blob/main/lib/style-spec-v21-compat.js

import fs from 'node:fs/promises'
import equal from 'fast-deep-equal'

const v21NonMultiGeometryType = [
  'case',
  ['==', ['slice', ['geometry-type'], 0, 5], 'Multi'],
  ['slice', ['geometry-type'], 5],
  ['geometry-type'],
]

function v20ExpressionToV21Expression(expression) {
  if (!Array.isArray(expression)) {
    return expression
  }
  // idempotency
  if (equal(expression, v21NonMultiGeometryType)) {
    return expression
  }
  if (expression.length === 1 && expression[0] === 'geometry-type') {
    return v21NonMultiGeometryType
  }
  return expression.map(v20ExpressionToV21Expression)
}

function v21compat(v20style) {
  const v21style = structuredClone(v20style)
  for (const layer of v21style.layers) {
    if (layer.filter) {
      layer.filter = v20ExpressionToV21Expression(layer.filter)
    }
    if (layer.paint) {
      layer.paint = Object.fromEntries(
        Object.entries(layer.paint).map(([key, value]) => [
          key,
          v20ExpressionToV21Expression(value),
        ]),
      )
    }
    if (layer.layout) {
      layer.layout = Object.fromEntries(
        Object.entries(layer.layout).map(([key, value]) => [
          key,
          v20ExpressionToV21Expression(value),
        ]),
      )
    }
  }
  return v21style
}

async function processStyleFile(filePath) {
  try {
    // Read the JSON file
    const fileContent = await fs.readFile(filePath, 'utf8')
    const styleJSON = JSON.parse(fileContent)

    // Apply the v21 compatibility transformation
    const updatedStyle = v21compat(styleJSON)

    // Write the updated style back to the file
    await fs.writeFile(filePath, JSON.stringify(updatedStyle, null, 2), 'utf8')

    console.log(`Successfully updated ${filePath}`)
  } catch (error) {
    console.error('Error processing file:', error)
  }
}

// Get the file path from command line arguments
const filePath = process.argv[2]

if (!filePath) {
  console.error('Please provide a file path as an argument')
  process.exit(1)
}

// Process the file
processStyleFile(filePath)
