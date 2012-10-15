#include <cstdio>

class Point {
private:
	int m_x;
	int m_y;

public:
	Point(int x = 0, int y = 0)
	{
		m_x = x;
		m_y = y;
	}

	int x(void)
	{
		return m_x;
	}
	int y(void)
	{
		return m_y;
	}

	bool isRight(Point other)
	{
		return m_x > other.x();
	}
	bool isLeft(Point other)
	{
		return m_x < other.x();
	}

	bool isAbove(Point other)
	{
		return m_y > other.y();
	}
	bool isBelow(Point other)
	{
		return m_y < other.y();
	}

	bool isEqual(Point other)
	{
		return other.x() == m_x && other.y() == m_y;
	}

	void move(int x, int y)
	{
		m_x += x;
		m_y += y;
	}

	void print(void)
	{
		printf("(%d,%d)", m_x, m_y);
	}
};

int main(void)
{
	Point p(3, 5), q(9, 7);

	p.print(), printf(" noktası "), q.print(), printf(" noktasının ");
	printf("%s.\n", p.isLeft(q) ? "solunda" : "sağında");

	return 0;
}
