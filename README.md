hrpsys-base Cookbook
================

This cookbook will install hrpsys-base simulator frontend.

[![Build Status](http://ci.devrt.tk/job/chef-hrpsys-base/badge/icon)](http://ci.devrt.tk/job/chef-hrpsys-base/)

Requirements
------------

- `build-essential` - hrpsys-base requires c++ compiler.
- `python` - hrpsys-base requires python.
- `omniorb` - hrpsys-base requires omniORB.
- `collada-d0m` - hrpsys-base requires collada-dom.
- `openrtm-aist` - hrpsys-base requires OpenRTM-aist.
- `openhrp` - hrpsys-base requires OpenHRP.

Attributes
----------

No attributes yet.

Usage
-----

Just include `hrpsys-base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hrpsys-base]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Apache 2.0

Authors: Yosuke Matsusaka
