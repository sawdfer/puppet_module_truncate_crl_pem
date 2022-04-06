# crl_truncate

#### Table of Contents

1. [Description](#description)
2. [Usage - Configuration options and additional functionality](#usage)

## Description

This module can be used to truncate the CRL issued by the Puppet CA.  That is, create a new CRL issued by the Puppet CA with no revoked certificates.  There are several reasons to do this, including:

* The CRL has grown very large, slowing down some operations
* It has become corrupted or lost
* You accidentally revoked an important certificate

The new CRL will be copied to the master's [ssldir](https://puppet.com/docs/puppet/latest/configuration.html#ssldir) and the `ca/` directory underneath.

Note that this module will only work with the CA included with Puppet, not an external or intermediate CA.  It is compatible with a single or multi-length CRL chain, the latter being the default starting in PE 2019.

## Usage

#### Bolt

```
bolt task run --targets <node-name> crl_truncate::crl_truncate ssldir=<value>

PARAMETERS:
- ssldir: Optional[String[1]]
    The location of the Puppet ssl dir
```

#### Puppet Task
```
puppet task run crl_truncate::crl_truncate [ssldir=<value>] <[--nodes, -n <node-names>] | [--query, -q <'query'>]>

PARAMETERS:
- ssldir : Optional[String[1]]
    The location of the Puppet ssl dir
```

#### PE Console

Select `crl_truncate::crl_truncate` from the "Task" dropdown.  Target the master by choosing "Node list" under the "Select targets" dropdown and run the job.
