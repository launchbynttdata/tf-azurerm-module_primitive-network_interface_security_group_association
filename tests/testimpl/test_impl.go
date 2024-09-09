package common

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v6"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestNsgAssociation(t *testing.T, ctx types.TestContext) {

	subscriptionID := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionID) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID is not set in the environment variables ")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatalf("Unable to get credentials: %e\n", err)
	}

	nicClient, err := armnetwork.NewInterfacesClient(subscriptionID, cred, nil)
	if err != nil {
		t.Fatalf("Error creating NIC nic client: %v", err)
	}

	t.Run("doesNicExist", func(t *testing.T) {
		resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
		nicName := terraform.Output(t, ctx.TerratestTerraformOptions(), "name")
		id := terraform.Output(t, ctx.TerratestTerraformOptions(), "id")

		nic, err := nicClient.Get(context.Background(), resourceGroupName, nicName, nil)
		if err != nil {
			t.Fatalf("Error getting NIC nic: %v", err)
		}

		assert.Equal(t, id, *nic.ID, "NIC ID does not match.")
	})
}
