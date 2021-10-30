pragma solidity >=0.4.23;

contract DappTrace {

    // For 'dapp test' must use this special event for stdout logging
    // https://github.com/dapphub/dapptools/blob/728a9245fa5f78589b0cedec0ade2da5433ad792/src/hevm/src/EVM/UnitTest.hs
    event log (string);

    function b32s(bytes32 b) public pure returns(string memory) {
        return b2s(abi.encodePacked(b));
    }

    function b32h(bytes32 b) public pure returns(string memory) {
        return b2h(abi.encodePacked(b));
    }

    function b2s(bytes memory b) public pure returns(string memory) {
        return string(abi.encodePacked(b));
    }

    function b2h(bytes memory b) public pure returns(string memory) {
       bytes memory HEX = "0123456789abcdef";
       bytes memory _string = new bytes((b.length*2)+2);
       _string[0] = '0';
       _string[1] = 'x';
       for(uint i = 0; i < b.length; i++) {
           _string[2+i*2] = HEX[uint8(b[i] >> 4)];
           _string[3+i*2] = HEX[uint8(b[i] & 0x0f)];
       }
       return string(_string);
    }

    function boos(bool ok) public pure returns(string memory stringData) {
        stringData = ok ? "true" : "false";
    }

    function a2s(address _address) internal pure returns(string memory) {
       bytes32 _bytes = bytes32(uint256(_address));
       bytes memory HEX = "0123456789abcdef";
       bytes memory _string = new bytes(42);
       _string[0] = '0';
       _string[1] = 'x';
       for(uint i = 0; i < 20; i++) {
           _string[2+i*2] = HEX[uint8(_bytes[i + 12] >> 4)];
           _string[3+i*2] = HEX[uint8(_bytes[i + 12] & 0x0f)];
       }
       return string(_string);
    }

    function u2s(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    function dtracefunc(string memory s0) public {
        emit log(string(abi.encodePacked("--------> ", s0, "()")));
    }

    function dtrace(string memory s0) public {
        emit log(s0);
    }

    function dtrace1(string memory s0) public { // Tab 1
        dtrace("\t", s0);
    }

    function dtrace2(string memory s0) public { // Tab 2
        dtrace("\t\t", s0);
    }

    function dtrace3(string memory s0) public { // Tab 3
        dtrace("\t\t", s0);
    }

    // Generated functions hence
    
    function dtrace(
        string memory s0,
        string memory s1
    ) public {
        emit log(string(abi.encodePacked(s0, s1)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7, s8)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10,
        string memory s11
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11)));
    }

    function dtrace(
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10,
        string memory s11,
        string memory s12
    ) public {
        emit log(string(abi.encodePacked(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12)));
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1
    ) public {
        dtrace("\t", s0, s1);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2
    ) public {
        dtrace("\t", s0, s1, s2);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3
    ) public {
        dtrace("\t", s0, s1, s2, s3);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6, s7);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6, s7, s8);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
    }

    function dtrace1( // Tab 1
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10,
        string memory s11
    ) public {
        dtrace("\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1
    ) public {
        dtrace("\t\t", s0, s1);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2
    ) public {
        dtrace("\t\t", s0, s1, s2);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3
    ) public {
        dtrace("\t\t", s0, s1, s2, s3);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6, s7);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
    }

    function dtrace2( // Tab 2
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10,
        string memory s11
    ) public {
        dtrace("\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1
    ) public {
        dtrace("\t\t\t", s0, s1);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2
    ) public {
        dtrace("\t\t\t", s0, s1, s2);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6, s7);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
    }

    function dtrace3( // Tab 3
        string memory s0,
        string memory s1,
        string memory s2,
        string memory s3,
        string memory s4,
        string memory s5,
        string memory s6,
        string memory s7,
        string memory s8,
        string memory s9,
        string memory s10,
        string memory s11
    ) public {
        dtrace("\t\t\t", s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
    }

}

