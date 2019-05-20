echo "Creating channels"
CORE_PEER_ADDRESS=peer0.bsps.com:7051 CORE_PEER_LOCALMSPID="BspsMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp peer channel create -o orderer1:7050 -c green -f ./channel-artifacts/green.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
CORE_PEER_ADDRESS=peer0.bsps.com:7051 CORE_PEER_LOCALMSPID="BspsMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp peer channel create -o orderer1:7050 -c blue  -f ./channel-artifacts/blue.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt

echo "Joining Peers to Green Airline Channel"
CORE_PEER_ADDRESS=peer0.greenairline.com:7051  CORE_PEER_LOCALMSPID="GreenAirlineMSP"  CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenairline.com/users/Admin@greenairline.com/msp   CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenairline.com/peers/peer0.greenairline.com/tls/ca.crt   peer channel join -b green.block
CORE_PEER_ADDRESS=peer0.greenagencies.com:7051 CORE_PEER_LOCALMSPID="GreenAgenciesMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenagencies.com/users/Admin@greenagencies.com/msp CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenagencies.com/peers/peer0.greenagencies.com/tls/ca.crt peer channel join -b green.block
CORE_PEER_ADDRESS=peer0.bsps.com:7051        CORE_PEER_LOCALMSPID="BspsMSP"        CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp               CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/peers/peer0.bsps.com/tls/ca.crt               peer channel join -b green.block

echo "joining Peers to Blue Airline Channel"
CORE_PEER_ADDRESS=peer0.blueairline.com:7051  CORE_PEER_LOCALMSPID="BlueAirlineMSP"  CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueairline.com/users/Admin@blueairline.com/msp   CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueairline.com/peers/peer0.blueairline.com/tls/ca.crt   peer channel join -b blue.block
CORE_PEER_ADDRESS=peer0.blueagencies.com:7051 CORE_PEER_LOCALMSPID="BlueAgenciesMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueagencies.com/users/Admin@blueagencies.com/msp CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueagencies.com/peers/peer0.blueagencies.com/tls/ca.crt peer channel join -b blue.block
CORE_PEER_ADDRESS=peer0.bsps.com:7051       CORE_PEER_LOCALMSPID="BspsMSP"       CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp             CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/peers/peer0.bsps.com/tls/ca.crt             peer channel join -b blue.block

echo "Updating Green Airline Channel for Anchor Peers"
CORE_PEER_ADDRESS=peer0.bsps.com:7051        CORE_PEER_LOCALMSPID="BspsMSP"        CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp               peer channel update -f ./channel-artifacts/further-green-anchor.tx        -c green -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
CORE_PEER_ADDRESS=peer0.greenairline.com:7051  CORE_PEER_LOCALMSPID="GreenAirlineMSP"  CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenairline.com/users/Admin@greenairline.com/msp   peer channel update -f ./channel-artifacts/green-airline-green-anchor.tx  -c green -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
CORE_PEER_ADDRESS=peer0.greenagencies.com:7051 CORE_PEER_LOCALMSPID="GreenAgenciesMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/greenagencies.com/users/Admin@greenagencies.com/msp peer channel update -f ./channel-artifacts/green-agencies-green-anchor.tx -c green -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt

echo "Updating Blue Airline Channel for Anchor Peers"
CORE_PEER_ADDRESS=peer0.bsps.com:7051       CORE_PEER_LOCALMSPID="BspsMSP"       CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bsps.com/users/Admin@bsps.com/msp             peer channel update -f ./channel-artifacts/further-blue-anchor.tx       -c blue -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
CORE_PEER_ADDRESS=peer0.blueairline.com:7051  CORE_PEER_LOCALMSPID="BlueAirlineMSP"  CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueairline.com/users/Admin@blueairline.com/msp   peer channel update -f ./channel-artifacts/blue-airline-blue-anchor.tx  -c blue -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
CORE_PEER_ADDRESS=peer0.blueagencies.com:7051 CORE_PEER_LOCALMSPID="BlueAgenciesMSP" CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/blueagencies.com/users/Admin@blueagencies.com/msp peer channel update -f ./channel-artifacts/blue-agencies-blue-anchor.tx -c blue -o orderer1:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/orderer.com/orderers/orderer1.orderer.com/tls/ca.crt
