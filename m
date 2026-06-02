Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98C383986
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421289; cv=fail; b=dsJgjxvL/yGptDKq6cUxKWTVNEgQObyilenR5DikJXMZR5scNTjHAhL4lQcQupr2vwbDdj4KnJKstMqWWPY1XRAn9buY+IUBUWYIl6SGeljchcgUnMyRCfHNR1QtgB3z3493ZG/1LiTzqMZZoD9vfcYzykYQfN4LYM9v9EQY72A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421289; c=relaxed/simple;
	bh=FNFY8d9dmQIf+50PQCKZ4EsZa2FEbivo+Iu/5XxJwgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DkLgaz9s0Bd5q3pp2bjgWZ2gPQMrBPOAlDkK+5pR/krcEayewuESNfeQZBIs9KZR/d8USA0gSeN+O3Yg6SnNFZo4+NNS54pBQ/l1seT0OhoctaqoZiHVLXefx44wovKEzuzF/TS7pQqc+n/Knu1BMlWboAP8BdyhVy83A22FHPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=asOf2WMm reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="asOf2WMm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9BmnNWXF59n8oiX2XkLDvAvKETMXrEW5VPmIjIV+bTtxhpW3l5u2rp64PMv6SaFbow6AYb21VrGcRQUfOoEVTgZLSn0i9rPFHsK1MfYylYgr9gXwAj0W+fIUVLTzejKtrHP7QdlO+y5Ngj40UuJKjUIyzM8h9QafhlGn5YJIEQ47yqG6IUJ0HRa25eTV4UGRw+NwxOI3AEUAIT168K9qU5/p6o5EoNSpdN8lZTHuv0hW5xy3lgn/dYm5wSug+kgKLmTpsovFKul/sRmr9XxbeaxFP0i6Gud044Sio2hS+YBdKetO4rHWKBx+wi931R1LKoxpLCGwlInZ5tmQOWvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycgFSxo+HZsHvZGkWgs96FdK3Bb9fmhIECGYsdKMhfE=;
 b=qapVM7i/msxDu/RbzA9S98Lxfr3YIEog5/jOift3/4NxiWsonWiwJeAwloPENCtarV/KeUQMPlOmEaTRJfSFt55AQLQD9hKt+6hATlkbrGksr9jPfCutWi7xxDDM1OlrWm5O5dm6vuNSEUKSYC9s+kpnbVrUMa2hozKCf0rh3LXY8hUQka6iNEI9lwHt9PuAUXPbKPmye99K9dQoxsLEthwfOPc9pn5jO5COE+VE81/FziRzXfdMa6az4QPXL5gexgDwKbkMFKH15Q1RP8HT0qE4ijZI/8moBU99LmM40Ctw1KaEkAHhi0c9OAqkwiX3zpBphx2gXuhIt+1SKKmgiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycgFSxo+HZsHvZGkWgs96FdK3Bb9fmhIECGYsdKMhfE=;
 b=asOf2WMmGXlhh5SWCcMvLRpCRpSF02rPPiGWq6+fca+FhQwAZ6/PZuJ45ddmZ8s2z/DsWdclB5gCnDN4HNbTXbn51jlAKraF9aunaUq96s5hp00491OGDwWZSD5WO6hnyMTYHvlY/gwHvZAFtiFa8ov69sjjrStpOwfccmyuq/jMaGY+7aD+LN2yespdf9LE4nonvMSTAxkZ+UsdImUvqV6qDGfLyzIOvOmNPJTPC1wxs6Ruf6sxQQHR4agzH8rGDOQ0LAW0KAvz8f023rLcHvOFy4i8ATw+b1Svb92PrA5RsrArSVXMdGItTYr8l08cCMfCdIoNHQEj+h4fwkvfEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10531.eurprd04.prod.outlook.com (2603:10a6:10:55a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 17:28:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 17:28:01 +0000
Date: Tue, 2 Jun 2026 13:27:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 3/9] i3c: master: Add APIs for I3C hub support
Message-ID: <ah8Smqrbk3mZi9t4@lizhi-Precision-Tower-5810>
References: <20260525064209.2263045-4-lakshay.piplani@nxp.com>
 <20260525080045.6E09E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525080045.6E09E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH3PEPF000040A9.namprd05.prod.outlook.com
 (2603:10b6:518:1::4b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10531:EE_
X-MS-Office365-Filtering-Correlation-Id: fa808dc1-f270-4078-5e7d-08dec0cc4bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|19092799006|366016|38350700014|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BiRtR4wNSPAdYfW7W1fzR4jKcN4O5r7V6T41Sner4Xet/jSy/sPywVrIwZDj5XZKmUNwWpxzDwAu7iT+jxjilWVIuJvOhKc4OfraeK21I6d3VVOtLGFXW1FBNGWzaeGeutlVP+N+rXFYZkuBZUWRCBSqixs5sdIhCcGR2eYQqkqbSwcO6dOyYsvwHvEAC5R4ocZ9cFjg2Hqix1KPDn/cN+uhnizAxRBaxWAeu8PXzPc2XR2ZLl1b0xqWFJoUzHdf7CkdVpv6cCwFISsVvBI/vUQrtqhYbsJTL4SK62WwzYJe/qaCaV9rwBvHWwj+viMV7AkWcePPMr0Y6bb1vzTsuz+o8sNPXf83VHUeyNH8QE4YDb/9iiXvtr9SJvPYkmp7zIeJWUI+Pz2VP2bn9w/gR6QdJZsuapcQR0qoIfmIsgXzcei23xIyfMSEirK6cB3UHB2c1OXZt0DDtICFgg2v4cFvkajxtfpBzNd3qIEcPxNE6BZMZ77d12riinrjlQD7gQkX1rjVoCiXK+8dETX05180qU64WyPwlKjM7+IhAtN+HGwKyhJ2lRbhCAxZ5LMNcKPuR6W+fLQZiRuzntPiZUOSQsLuGUV0s7l9Ga0bIabFrMHdbd6ILwTqqbyH8eVvG87VndKzrEzi5k95vlpQmDG7NRNrfJSl0qKLgGpL+vDeKCLg8hczwNTtIcx58lOm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(19092799006)(366016)(38350700014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5IHHslvH5RBZiuzzYrKOjx22uiQKsT+JAE0okRgOw6AjtR3cA3lCJx8nWm?=
 =?iso-8859-1?Q?ZiJ44dOFNV6rlEGUtVfMaki/0dxf9OPf/3sUAEiSdz1B1N79VtVIFykAo+?=
 =?iso-8859-1?Q?4KDJigJTMvP08tB9Ezy4nVBdgBf5iXzfJ34CvSTyixlA49vcMV0Sts8zMV?=
 =?iso-8859-1?Q?tBvPLDk7MAHjyfo0S2WVDPQc/UBHXqVYEzKFV8d4pv8k665GxURT8SwMLd?=
 =?iso-8859-1?Q?4lhYAu29tfPmMitx5S2zGEG1D8XMV6ONU3qM1OSEx5BzLAkQTt7cDB+HIy?=
 =?iso-8859-1?Q?tSfWMkbZcvLesBenp+H3yjZinu0KKMc+ORI++5pnGz6meyKrkh3sxSthfQ?=
 =?iso-8859-1?Q?DzmVhw3/CMeEebEMdMvy/tfnBNXoRu4LoCTMCKOtscv6bPWMNdpKNT1ij5?=
 =?iso-8859-1?Q?42VRZArLrBl/m9clkoDGN2zvxuAabIzI8tQeq8pXdsMFcPLFfJIJT5duCe?=
 =?iso-8859-1?Q?oVh7aWRFkBWKAolI8TX5/MD/GBYkJR9hOM7lD2UKkqWo10PBkZHfSirWbO?=
 =?iso-8859-1?Q?BeuEvhDH0s/5u+DeoQa1id5GEg0Wgtv6n3UqWtF1pF/cN+UcU5ManqMgxv?=
 =?iso-8859-1?Q?bA1jt1YQelJ/7DOXwp4Cq4G2+58YEq8Ejf1eZMjUl5ypDje8gfKb1YduQT?=
 =?iso-8859-1?Q?7FvNXexMkCt4ecZF3hBg+E3w4bhc94+it++l3i9Bc7D20GEYsljEvj78Io?=
 =?iso-8859-1?Q?dSC+Qsf6TMno+xXuBUOTCQmhH6uQRG9KZ89jcX9pDSLDJ7gmrGQ3Nr07ag?=
 =?iso-8859-1?Q?UELSKSfI5UQUNcOI5Jpt2PvlOzPT0iTwngC/uLZTqrJYfYFbMUAykkWxQ7?=
 =?iso-8859-1?Q?gvUJgL4YenSDnCf2Rgg/5qpHUR5G2VxWVVPsG3wVoPTW3JDPlCNKPSGt0F?=
 =?iso-8859-1?Q?PqERXY/2s+Z5K6KnAnepBABzjXqvd4wrmHWXUrCq2QII+X9CQbJFCNtv4S?=
 =?iso-8859-1?Q?Ho0FBBERzQH8UTiiPTrwInfMml5koQFJQdTb/qnMHeAftHMoa5YNikrE3B?=
 =?iso-8859-1?Q?PPXwEhk5SWf9MXYsuxp/9kO5bjPjuMc8aidD/dbeyKdEp/k4sbVR+cpJQS?=
 =?iso-8859-1?Q?q+HuZRN0agPEqIlj9VXgEyThJNnSB9ItUz79Tzn3e2+kL6rhZsZmOZPDoB?=
 =?iso-8859-1?Q?qkMNgMHu2xr0uf5QCy3MR8B2BfAVimcisUhH+N3GwjEVJWSpzl5bLw+QOd?=
 =?iso-8859-1?Q?TsL1Pjg3ChHdQr3BPCQELelvQhqv4FuWa1zvTsKx1uYOiDFSwhdnbWBHr4?=
 =?iso-8859-1?Q?hB509wejhNf6qmjK5aCia8dIadKzkt6szE4TBN3/e5YclRLCcmlLeCbUOv?=
 =?iso-8859-1?Q?ZvZqXHIVwFUhAqMpogDZ+UwZoFE9yKrYjYH8Wvfdg85/k+sxxv5605uXhl?=
 =?iso-8859-1?Q?JVjDeyu9sewbHKuEHLg0DjIcMqXk0anOUK8fqYRGbCYEroxs25o9MI4d+6?=
 =?iso-8859-1?Q?/n1ptI+mptkYWnvYajfrTwkwkcUm6IWQrXSYXWydcmDSJSb1lbvnC1iy9Z?=
 =?iso-8859-1?Q?UtSHbgq1U3eiwlOxqgRBmy0W4oiS5pZe5F+8ccytUN8kWopZtt38RCtdRN?=
 =?iso-8859-1?Q?/pU1MShL/IigHag+iBma32VmI6lLBdIFfgrjxMWm64GjIKCOZlbnPhRtX0?=
 =?iso-8859-1?Q?39AGM56Emb42GynfJrzZhWrA7IghsczzkGoUPUnNr4ee0kqUW3atbgl7/+?=
 =?iso-8859-1?Q?iCG7LRZfOjOCcIKv2HSV+QXU2sumdK2CTEV8hhIQr6FMOC/swg0zlVnUGo?=
 =?iso-8859-1?Q?BvSbPn6sqDdRWaQ0GU6sEaF6B+MWbeIUD43RO5JSXrHpNybjH9+oT7NxAc?=
 =?iso-8859-1?Q?5uEWzS09JQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa808dc1-f270-4078-5e7d-08dec0cc4bee
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:28:01.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCiTrIXDELryiOIcu70ufd8es4zxrUUZXMD2bhNtIwaBW2JNoNsZEYOS45kNBeFDixsW6XQ8mXL9CNW1TQoKpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10531

On Mon, May 25, 2026 at 08:00:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Incorrect logic and API contract violation in `i3c_master_supports_ccc_cmd()`.
> - [Medium] `i3c_master_direct_attach_i3c_dev_locked()` incorrectly returns `-EINVAL` for devices without addresses.
> --
>
> commit e1382a24562500ebcc8529e9a5fff3016b719a36
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> This commit adds helpers for attaching and detaching I3C devices, as well as
> helpers to check CCC support and send CCC commands. These additions prepare the
> subsystem for I3C hub support.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index ec3547f75469e..4f0565faa182f 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > +/**
> > + * i3c_master_direct_attach_i3c_dev_locked() - attach an I3C device to a master
> > + * @master: I3C master controller to attach the device to
> > + * @dev: I3C device descriptor representing the device
> > + *
> > + * This function attaches an I3C device to its master controller once the
> > + * device has a valid address on the bus. Devices without an assigned address
> > + * are ignored. The master device itself is never attached through this bus.
> > + *
> > + * Context: Caller must hold master->bus.lock in write mode.
> > + *
> > + * Return: 0 on success, or a negative error code if the attach operation
> > + *         fails in the master controller driver.
> > + */
> > +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
> > +					    struct i3c_dev_desc *dev)
> > +{
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * We don't attach devices to the controller until they are
> > +	 * addressable on the bus.
> > +	 */
> > +
> > +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> > +		return -EINVAL;
>
> [Severity: Medium]
> The documentation for this function states that "Devices without an assigned
> address are ignored." However, this code returns -EINVAL instead of 0.
>
> Looking at the internal i3c_master_attach_i3c_dev(), it returns 0 to safely
> ignore unaddressed devices until they acquire an address. Should this new
> helper also return 0 to match both its documentation and the subsystem's
> existing convention?

Suppose AI is correct, please check it.

>
> > +
> > +	/* Do not attach the master device itself. */
> > +	if (master->this != dev && master->ops->attach_i3c_dev)
> > +		ret = master->ops->attach_i3c_dev(dev);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
>
> [ ... ]
>
> > +/**
> > + * i3c_master_supports_ccc_cmd() - check CCC command support
> > + * @master: I3C master controller
> > + * @cmd: CCC command to verify
> > + *
> > + * This function verifies whether the given I3C master controller supports
> > + * the specified Common Command Code (CCC).
> > + *
> > + * Return: 0 if the CCC command is supported and executed successfully,
> > + *         -EINVAL if arguments are invalid,
> > + *         -EOPNOTSUPP if the master does not support CCC commands,
> > + *         or another negative error code from the master's operation.
> > + */
> > +int i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> > +				const struct i3c_ccc_cmd *cmd)
> > +{
> > +	if (!cmd || !master)
> > +		return -EINVAL;
> > +
> > +	if (!master->ops->supports_ccc_cmd)
> > +		return -EOPNOTSUPP;
> > +
> > +	return master->ops->supports_ccc_cmd(master, cmd);
> > +}
>
> [Severity: Medium]
> Does this function's logic and return value match its documentation and the I3C
> subsystem semantics?
>
> The docstring states it returns 0 if a command is supported, but it actually
> returns the boolean result of the supports_ccc_cmd callback (1 for supported,
> 0 for unsupported). A caller checking for 0 as success would incorrectly treat
> supported commands as unsupported.

AI said correct, please fix it.

Frank
>
> Additionally, if the callback is absent, this returns -EOPNOTSUPP. However, in
> other places like i3c_master_send_ccc_cmd_locked(), the core I3C logic assumes
> all commands are supported if the callback is NULL. Could returning -EOPNOTSUPP
> here falsely indicate no commands are supported?


>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260525064209.2263045-1-lakshay.piplani@nxp.com?part=3
