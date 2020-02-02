package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	// cfg, err := external.LoadDefaultAWSConfig()
	// if err != nil {
	// 	log.Fatalf("failed to load SDK config : %s", err)
	// }
	h := &handler{
		name: "test",
	}
	lambda.StartHandler(h)
}
