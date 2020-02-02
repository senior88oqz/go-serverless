package main

import (
	"context"
	"log"

	"github.com/aws/aws-sdk-go-v2/service/dynamodb/dynamodbiface"
)

type handler struct {
	name string
	ddb  dynamodbiface.ClientAPI
}

func (h *handler) Invoke(ctx context.Context, payload []byte) ([]byte, error) {
	log.Printf("%s", payload)
	return nil, nil
}
