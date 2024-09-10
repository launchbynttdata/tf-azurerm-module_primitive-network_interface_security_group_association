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

	t.Run("doesNsgAssociationExist", func(t *testing.T) {
		resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
		nicId := terraform.Output(t, ctx.TerratestTerraformOptions(), "nic_id")
		nicName := terraform.Output(t, ctx.TerratestTerraformOptions(), "nic_name")
		nsgId := terraform.Output(t, ctx.TerratestTerraformOptions(), "network_security_group_id")

		nic, err := nicClient.Get(context.Background(), resourceGroupName, nicName, nil)
		if err != nil {
			t.Fatalf("Error getting NIC nic: %v", err)
		}

		assert.Equal(t, nicId, *nic.ID, "NIC ID does not match.")
		assert.Equal(t, nsgId, *nic.Interface.Properties.NetworkSecurityGroup.ID, "Expected attached NSG to be %s, but got %s", nsgId, *nic.Interface.Properties.NetworkSecurityGroup.ID)
	})
}
