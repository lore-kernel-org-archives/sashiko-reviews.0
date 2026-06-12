Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F23932DB
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293992; cv=fail; b=XWu9/aE/H7N/93Hs4t1ODuumAgG/HSwjZRgMxAmItE5BaY0aozcEIWwVtFCigga6GxCEF138tHH2isF0RpHcSSlIk6qe98PhaqtTcqxH1LXIfpAb65a7UMTz8RApikjarS0pC0CjXgYlvoRJvxPKPJpr+SaOrp0q5umAtVUoUOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293992; c=relaxed/simple;
	bh=U10vq7p/18JfVYSL921+hXyLNBxRd8Qz6wDOuatUrZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UmGInZl6W0AKeg/1C1aAfXueSIDPvDyZq5NEcZ0mkpC0fxlaWPARXv6hn/h7LtE7u2BF9g7692RaJ+u/D2LJDFv8hxR3lg9zhWE42CDZtX6gDb3wACWKWg3M22YY0Y6yrrAZF7MnJQlyZ7+HHWDGhE3t9+WI6Qys2XXMfbt3MQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YjzcsZpz reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YjzcsZpz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWfqIm1Xd62Jkz+tHQWYWSH8ZxpHnpGfnnzY55Q9Y8yn9sKVdElHI+qBSBSNSyW7QR29qY05BTL+3stK/pu/nx3NE8Otdxl51YGjTk/kZQ10hfQ16/zXwOVW+1KGT7SlSbAv7IkIJzHjYU4gO5u8iFItg0lo2kqSJXu/YgNUE2k+RtsJEUzc1kFrK1u7ZITiVc3NYcb+typoIFxxUgFePbSL8J1FpsUEilb176T+SnZW20MKkHXCXn1RShui+AbINYQGgu5EtoSKAilF3gL+R+6k1EuDSXCJh2dsyjcAY4ag/7qGhY5nRoJPuxH3OGT4TAwoBmXbMtoIaWdqp783Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1h0AdBXO/DEQYZDBYvSTR8P3qm56mOQvITD95wdxvg=;
 b=UDxMv0/b5Rb21HAgr4VvEEQYcy2pPCyyVJWKEQf4gwxzG82xb+Z786fgkhImpWXwQdcSDXvMpU8KVfwgZEca/+4W7SrcRPdC5TBYF9TpVOwPdss9GSMBeSg8sP3whljQIl+YV3oIbJTFEjqinchcihXRuy2TUdygHKG5TYMVvjk+xwGbQut3ug/v9sdNM+sL+BIwhzsWbdTzxhMhLm735czd58y0aaTi2NWNPHSSnfkI2RRW1A9Rz799Tqcb5jHyygL++s76tsMNU3KG8KuhOCPOJj6ve9/j0usYz8gCAOguADUq8pquJlhLGcoajG7XCAf5F5jWROylhHU06rSgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1h0AdBXO/DEQYZDBYvSTR8P3qm56mOQvITD95wdxvg=;
 b=YjzcsZpzGW77apFGVDVKrF4cRZ55LG1bE0eeoHDIi1cRHTU2rdebe22MIjwTZTNTeByOadl8M8hRNyjbCdjVsNviy8svAgsHXbqUcx7cTQOzlcWg9dPFFkckkl/2pTAMGlbZWA6VeSwcHCAs3YVhLTAfURo4TK/YecqnEzGSV1px1SB1+hxd3iwfs0D9yAyLU2NkX9WGz8bzvHSofYr7ZOqCwEW7w5teisUGWEmNgZGu242te+nAWrn0xclupj787PSXz1C1+TCtb28fEwLb4JLhGA9Zg2tSH7Y4tpk3ip1kzZtTnyur9B5iEG31z8ctKK+VoHJNUkITmkELhb0FRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 19:53:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:53:05 +0000
Date: Fri, 12 Jun 2026 15:52:59 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v11 2/9] i3c: master: Expose the APIs to support I3C hub
Message-ID: <aixjm9eImJhrUU2O@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-3-lakshay.piplani@nxp.com>
 <20260612114421.2BEE31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612114421.2BEE31F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a52d0d-2de2-42b8-4bcd-08dec8bc3817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|3023799007|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8M8ZUWGgEj2EReM1c1g2b0YOKRGIjBKuhZrFsjX9BCUgNgf6i1KTvt09c+BNzFqNjixFOpB5jomvlmB8gWn6Pr++PyAhtVoByuvYZUmfsIHK4q1e6MHAxPboaHP1t6j81IDzw15nIMKEmYBNcd8P0VxSbTcwUzIFcHtReFEJjHLwvzulJCNXHa/ZMMK4MliSnEdOgxlAhYkkc8p8AWTE+U3WjJQKi1Z0dEJ2PsR5aHr6whHQ9nua3olDWv0RIuQFHuBzerJrg9/jyHP4HsRpKGPocDMXxDfAu6DCo29gEJoRC0V+Tzh2+qhQGIE/mB307hVsmlCPEPQcofu8qlWF+cbAPhJMDzztpVpPk1kAoQg/cQsrlDKSprn2yx4n2SzAf7gZSoAc1izIbzRqrorkL51/Y9eBJLr8S41bw0sUpRNu8JG0vVD5KIsr1zxFySNMNoWFXRVacsJuS0618EHrR71JugQGpYBtoIJBxytispPpHiHLGPzMGVzd4URq5PBsk4/RM95fkZ2sl2E52o3+AyPJHmQxnctxFjdRlkXXDPnQcfEnnroT1hbxXIUDfALr8aHXRrbErKKptdIpBr9mICtn0N4NpE9pyArgzdGoGkBhE4oOycb4Sf6BvI3WoobcSWuH+E7GhzzmMQkVk7S66A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5W87FbM5G0yZrCZ0As4PJvm6bDJAQ3JijjMPXCgrTCya0hTBx5JAV3yBet?=
 =?iso-8859-1?Q?7Y1APimxBL6SxImlBqcwj69YBXBWmjrxKYbXNkE2crTqgnTno6VuGWr9KS?=
 =?iso-8859-1?Q?goM8fNKculd/hUKG8YNcOQ/sZnh1i7preb8ebM0MMH+WKYR6du7HURABrm?=
 =?iso-8859-1?Q?xnkJshLBYAXL10YyBIdpiBdfcl4QzLTxsDzl7A5SXpQMWbaDwvswRJp4lr?=
 =?iso-8859-1?Q?ifFY2nqvowgKnfQc2eSxY0sYsgEV4VAPKNz2NjiSA5dEcdyQr8ZFoF1Ng5?=
 =?iso-8859-1?Q?GvohfU/HaErZeID/FMyzSnX+gU5TYpxE2FnIuFjTRjq5LRS4FrAIp10YQI?=
 =?iso-8859-1?Q?SYYMg5YVpn0h0SoY5Afp6YL9Ywx5NW4eDvaHl5vYefjhDorRt6i8hNWIQ2?=
 =?iso-8859-1?Q?QxNnK44dubJ1yGeQ8xMZ3wGcHzyGeDfWg4tVRPsTadOCOINL1faWrXQVHI?=
 =?iso-8859-1?Q?uH6pJniPrq4jSnBmEYvcgF9UDhHDH7s0IPAL0tf7IPDRdpvMeovBvP8H+d?=
 =?iso-8859-1?Q?WV9hWAiVL/BU5PV+cQe52C2s1FrrCVnRm5WkKeqHgQdfdJclRQJsB1zdbX?=
 =?iso-8859-1?Q?UQVH8MFwJbWcml6Kn5gi90zFz+UsSgsDgt9Bxem0DhWVKDYislnPMU9IC9?=
 =?iso-8859-1?Q?ZfVKPY9AIXFxE5xrxhhJH5XtCE3P7Zh5wyUJTd7uKHSu5pOjDgVTQpnsT8?=
 =?iso-8859-1?Q?2FHBAHlP0vlqMQMJC09deaFdvWoFjrBTVh6Hle/ydSYwJ2nXrZ7Aufz13+?=
 =?iso-8859-1?Q?Bi55EntUckw78I+Wd9RZ/yNafKHVYHe7j/odSweK5kYHvx51zg3rcBIMu3?=
 =?iso-8859-1?Q?Ai1OtrUzIYdXktG5lyprWdNJL85QGIOSP5D1B14Obgzt91DH5KUQx1XBo8?=
 =?iso-8859-1?Q?w4QpoDd0MTniDfYi6BMHKegTH6K2zqv26QlRiea5pBIW+5TeAIVvDuXfBy?=
 =?iso-8859-1?Q?p7rEg+5bDhVeOsXTyNj9U6b8rjbHCkWvka4swG4q/uq5DL5HUGCYIyivjz?=
 =?iso-8859-1?Q?t6/xy24s95I3/oWfqKCL2fFuNpD3FFWk5cAJceXUWdZmYi+JDL1jjWm5+W?=
 =?iso-8859-1?Q?z4QQt/LZryN/u5neSlcNiKKVvZ/ZZu8c1GpnqO8ge3Ce5CaBvgDgnWX/Ti?=
 =?iso-8859-1?Q?WlZOlT1jtRh9PR2/g7v7nWwCXNhSKZ8W0TOsbQaiz4EKtL5p0IWvMIAwBt?=
 =?iso-8859-1?Q?rmUhVf/6xF1h5/vSzvaxiUk7HVKj/D0/Loj4fym0iC6seEKi5AYWZ7bbXm?=
 =?iso-8859-1?Q?hPBqMj+c0H+X2XYrCRgDdTBT6EQDtQzt3uqRuBgkbi+V+7uBBpC/y2o1xf?=
 =?iso-8859-1?Q?C9e/KD+vjf+zJn9sN1X3aNOItitT9hH8liCPSO5nKGKBRGWEQ4XFsBL33n?=
 =?iso-8859-1?Q?dZ3MGFQ8LVCaXnr/tn9DVwZsJ0civZaaLrmKNswfC/oMGycZH3xqHsmh10?=
 =?iso-8859-1?Q?2tiLDkhHbJxrGBTlP3zr5+w2NjCWwjEKW+BTD6sCbb3n5U8bUAzew9Yqjs?=
 =?iso-8859-1?Q?WbRbCP2xmhxwgDxktbVdcSHQb0SoCm0N1cHK/lVoUpinRsJ3HyxdX9qn8w?=
 =?iso-8859-1?Q?rnAfCZBkQHbqLKkW+5qr0rlMrutvfhnf5+E6i4WJnrvJ7y0KE4ohsAe+pY?=
 =?iso-8859-1?Q?T3OLn+uFrkSBHvisykeZ7nT8LEY8aClon7ePp0x4ddshey64WYZYrDAaoh?=
 =?iso-8859-1?Q?5WRVYMtWrn4MSFvq4hTMyg3idB8tOEXA8WKJOJCg95LopDtG4E7lNf3ih1?=
 =?iso-8859-1?Q?SX+HaqhHolyfcIomkzB5y7OVVdcke7B3VpOGObTK7L0GhCn9tydSaaz0o8?=
 =?iso-8859-1?Q?ACPvfLtV2s5CYeILJxzIrUFZt/+AdF74SBbuUJyTtO7rFLkHSANr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a52d0d-2de2-42b8-4bcd-08dec8bc3817
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:53:05.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZGs9V1R6VGZPqSfSAgnA9MYZT+rz6C3/9YWAQ4cScc3y136yTM5Wcrrk0UHRBp/6mort1PqERdPuOqKUzSPlAHg0M+VeGW4b+oEFvHmB6ldI7jaeFHNR4aaia/dwX5M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

On Fri, Jun 12, 2026 at 11:44:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [Medium] API documentation mismatch: i3c_master_reattach_i3c_dev_locked() claims to return -EBUSY on collision, but unconditionally overwrites slot status.
> - [Low] Invalid lock context expressions and typos in newly added IBI kernel-doc.
>
> Pre-existing issues:
> - [Critical] Multiple Use-After-Free vulnerabilities in i3c_dev_free_ibi_locked() due to improper synchronization and teardown order.
> - [High] Unbalanced release of address slots in i3c_master_reattach_i3c_dev_locked() failure path leads to bus corruption.
> --
>
> commit 13a1ff5c64b48ceff03545ae3bebd5e60a136c1e
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Expose the APIs to support I3C hub
>
> This patch exposes several internal I3C master functions to allow new I3C
> hub drivers to use them. It adds kernel-doc comments and exports symbols
> like i3c_master_reattach_i3c_dev_locked and various IBI handling functions.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index c45b450af319d..ec3547f75469e 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1652,8 +1652,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
> >  	return 0;
> >  }
> >
> > -static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> > -					      u8 old_dyn_addr)
> > +/**
> > + * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
> > + * @dev: I3C device descriptor to reattach
> > + * @old_dyn_addr: previous dynamic address of the device
> > + *
> > + * This function reattaches an existing I3C device to the bus when its dynamic
> > + * address has changed. It updates the bus address slot status accordingly:
> > + * - Marks the new dynamic address as occupied by an I3C device.
> > + * - Frees the old dynamic address slot if applicable.
> > + *
> > + * This function must be called with the bus lock held in write mode.
> > + *
> > + * Return: 0 on success, or a negative error code if reattachment fails
> > + *         (e.g. -EBUSY if the new address slot is not free).
> > + */
> > +int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> > +				       u8 old_dyn_addr)
> >  {
>
> [Severity: Medium]
> The kernel-doc states this returns -EBUSY if the new address slot is not free,
> but does the implementation actually check this?
>
> Looking at the rest of i3c_master_reattach_i3c_dev_locked(), it appears
> i3c_bus_set_addr_slot_status() is called unconditionally to set
> I3C_ADDR_SLOT_I3C_DEV without first checking if the slot is available.
>
> Could this silently overwrite an existing occupied slot if an external driver
> relies on the documented failure behavior?
>
> [Severity: High]
> This is a pre-existing issue, but does the error path safely handle a failure
> from master->ops->reattach_i3c_dev()?
>
> When the reattach operation fails, i3c_master_put_i3c_addrs(dev) is called,
> which marks the address slots as free. However, it doesn't appear to revert
> the hardware device's assigned address.
>
> Since callers like i3c_master_add_i3c_dev_locked() completely ignore the
> return value of this function, could this leave the bus manager out of sync
> with the hardware state and cause severe address collisions if the slot is
> subsequently reassigned?
>
> [ ... ]
>
> > @@ -3195,6 +3211,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
> >  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
> >  }
> >
> > +/**
> > + * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
> > + * @dev: device on which IBIs should be disabled
> > + *
> > + * This function disable IBIs coming from a specific device and wait for
> > + * all pending IBIs to be processed.
> > + *
> > + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> > + * Return: 0 in case of success, a negative error core otherwise.
> > + */
>
> [Severity: Low]
> Is the lock context expression correct here?
>
> The parameter is of type struct i3c_dev_desc, which does not have a desc
> member, so &dev->desc->ibi_lock appears to be structurally invalid.
> Should this be &dev->ibi_lock instead?

Make sense, please fix it

>
> Also, there is a minor typo: "error core" should likely be "error code".

Please this typo

Frank
>
> [ ... ]
>
> > +/**
> > + * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
> > + * @dev: device on which you want to release IBI resources
> > + *
> > + * This function is responsible for de-allocating resources previously
> > + * allocated by i3c_device_request_ibi(). It should be called after disabling
> > + * IBIs with i3c_device_disable_ibi().
> > + *
> > + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> > + */
> >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>
> [Severity: Critical]
> This is a pre-existing issue, but does this teardown order introduce a
> use-after-free regression when exposed to external drivers?
>
> Looking at the body of i3c_dev_free_ibi_locked(), the function calls
> master->ops->free_ibi(dev) before destroy_workqueue(dev->ibi->wq).
>
> If free_ibi() frees the underlying IBI pool memory, and destroy_workqueue()
> subsequently flushes pending async work items, could those work items
> execute and dereference the already freed pool?
>
> Additionally, if i3c_dev_disable_ibi_locked() had failed to disable the
> hardware interrupt, could a firing interrupt access dev->ibi after it is
> unconditionally freed by kfree(dev->ibi) at the end of this function?
>
> >  {
> >  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > @@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> >  	kfree(dev->ibi);
> >  	dev->ibi = NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260612111816.3688240-1-lakshay.piplani@nxp.com?part=2
