wrapper_templ="""pragma solidity >=0.4.23;

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
        dtrace("\\t", s0);
    }

    function dtrace2(string memory s0) public { // Tab 2
        dtrace("\\t\\t", s0);
    }

    function dtrace3(string memory s0) public { // Tab 3
        dtrace("\\t\\t", s0);
    }

    // Generated functions hence
    __GENERATED_FUNCS__
}
"""

dtrace_templ="""
    function dtrace(
__PARAMS__
    ) public {
        emit log(string(abi.encodePacked(__PASSED_PARAMS__)));
    }
"""

maxparams = 12 # NOTE call stack depth limits here
maxtabs = 3

dtrace_funcs = ''
for i in range(1, maxparams+1):
    j = i + 1
    params = ',\n'.join([f'        string memory s{k}' for k in range(j)])
    passed_params = ', '.join([f's{k}' for k in range(j)])
    genfunc = dtrace_templ.replace("__PARAMS__", params).replace("__PASSED_PARAMS__", passed_params)
    dtrace_funcs += genfunc


dtrace_templ="""
    function dtrace__TAB_NUM__( // Tab __TAB_NUM__
__PARAMS__
    ) public {
        dtrace("__TAB__", __PASSED_PARAMS__);
    }
"""

dtrace_tab_funcs = ''
for tabnum in range(1, maxtabs+1):
    for i in range(1, maxparams):
        j = i + 1
        params = ',\n'.join([f'        string memory s{k}' for k in range(j)])
        passed_params = ', '.join([f's{k}' for k in range(j)])
        genfunc = dtrace_templ.replace("__PARAMS__", params).replace("__PASSED_PARAMS__", passed_params).replace("__TAB__", ''.join(['\\t' for tb in range(tabnum)])) .replace("__TAB_NUM__", str(tabnum))
        dtrace_tab_funcs += genfunc

print(wrapper_templ.replace("__GENERATED_FUNCS__", dtrace_funcs + dtrace_tab_funcs))
