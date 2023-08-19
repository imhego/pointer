# Pointer
**Pointer** is a Simple Lightweight Tool for Endpoint Discovery.

<div align="center">
  <img src="logo.gif" alt="Pointer Logo">
</div>


This bash-powered tool is designed to make the process of hunting down endpoints a breeze. Say goodbye to the tedious manual search and hello to efficient, automated endpoint discovery.

**Note:** The primary focus of Pointer is on uncovering hidden directories and files within the provided endpoint. This tool is optimized to aid in discovering those hard-to-spot paths that might otherwise go unnoticed. Happy endpoint hunting!

## Installation

Clone the repository:
   ```shell
git clone https://github.com/imhego/pointer.git
cd pointer
bash installer.sh
```

## Usage

- Discover endpoints for a target URL:

```shell
pointer http://testphp.vulnweb.com
```

- Explore endpoints within a specific path:

```shell
pointer http://testphp.vulnweb.com/vendor
```

The Pointer tool is designed to work with endpoint URLs in the following format: `"https://example.com"` or `"https://example.com/directory/directory/directory"`

Please keep the following points in mind when using the Pointer tool:

- **Protocol Requirement:** Make sure to use either `http` or `https` as the protocol at the beginning of the endpoint URL.

By following these guidelines, you can ensure that the Pointer tool functions accurately and provides the desired results for endpoint discovery.


### Feel free to contribute, report issues, or suggest enhancements to the Pointer tool. Your input helps make it more effective and user-friendly!
