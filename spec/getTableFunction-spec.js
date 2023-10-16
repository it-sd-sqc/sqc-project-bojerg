import { getTableOfContents } from '../server.js'

describe('getTableOfContents function', () => {
  it('should return a non-empty object representing a table of contents', async () => {
    const table = await getTableOfContents()

    expect(typeof table).toBe('object')
    expect(Object.keys(table).length).toBeGreaterThan(0)

    // Check specific properties if known
    const exampleChapterId = '1'
    expect(table).toHaveProperty(exampleChapterId)
    expect(table[exampleChapterId]).toHaveProperty('0', 'Intro')
  })
})
