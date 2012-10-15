#include <stdio.h>
#include <stdlib.h>

struct point {
	int x;
	int y;
};

struct point *
point_create(int x, int y)
{
	struct point *this =
		(struct point *)malloc(sizeof(struct point));

	this->x = x;
	this->y = y;

	return this;
}

int
point_isright(const struct point *this, const struct point *that)
{

	return this->x > that->x;
}

int
point_isleft(const struct point *this, const struct point *that)
{

	return this->x < that->x;
}

int
point_isabove(const struct point *this, const struct point *that)
{

	return this->y > that->y;
}

int
point_isbelow(const struct point *this, const struct point *that)
{

	return this->y < that->y;
}

int
point_isequal(const struct point *this, const struct point *that)
{

	return this->x == that->x && this->x == that->y;
}

void
point_move(struct point *this, int x, int y)
{
	this->x += x;
	this->y += y;
}

void
point_print(const struct point *this)
{
	printf("(%d,%d)", this->x, this->y);
}

void
point_destroy(struct point *this)
{
	free(this);
}

int
main(void)
{
	struct point *p = point_create(3, 5);
	struct point *q = point_create(9, 7);

	point_print(p), printf(" noktası ");
	point_print(q), printf(" noktasının ");
	printf("%s.\n", point_isleft(p, q) ? "solunda" : "sağında");

	point_destroy(p);
	point_destroy(q);

	return 0;
}
