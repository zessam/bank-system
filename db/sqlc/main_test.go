package db

import (
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5"
)


const (
	dbSource = "postgresql://postgres:postgres@localhost:5433/bank_system?sslmode=disable"
)


var testQueries *Queries

func TestMain(m *testing.M)  {
	conn, err := pgx.Connect(context.Background(), dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	testQueries = New(conn)
	os.Exit(m.Run())
}