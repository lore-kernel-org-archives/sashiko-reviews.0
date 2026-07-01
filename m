Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2D423F7A
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934952; cv=fail; b=ekn9uEjO6/VqQjshgDV00Ff9H6mQBuMwnyOlCOnYR3CoHTb9x6b1uyv1oqTbBn+1boWXN8e+VCGaMLM7SKM9NeAmEVhorl3HP64kkE6fIUPvzYgnV9A3JmqV0ZVGaEhUYNdq2YtKsSA52BZ0kIUnof316nkmAeL79cqObLFkmMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934952; c=relaxed/simple;
	bh=OXnke05/O0skLcaYP1CbMcsBeWjnVScqenRmk8blj7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EH3/SOwfI4iTTMs0QEqeTcXq0Lon+JVsAv/AOPQcY9aJ3VLfNuxOSFl4ytk1PzK8E71S86Vcy9A7+usHuoPTmQ3CtvCKCSrxqzHcCZqB7XmBCJduNwuSDvkOnhjdU8Rqv7NQkZyDcdQFzimGCX34SPtdkKC3VN3sCDP8fUy8z3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iYGY+Xjf reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iYGY+Xjf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGGr+jQ2uoONftCjwikj1GbSu1umlmVasHqC3X8QT3J2beIm1wk3XRmmCT2yt2icnwLdHaAKqAJEokjOenF4lJhAmUhyuHNjJ2iY+b0xDRjlQCIGE4bMr0GyEhysMTWi6pHVrLS0MgUHJ+dJql10UMeC+wMj0MYT9pZTfjVzrYEKYAerHc09xH5bgGxY5ZEQKy8twjuVoSluTXYkfYdQWSJe4Rxkaq7Xu/7y0Nb/ih6/11Jgt9+KNvVCmWYd30U5M82KiX2xXrz5jSnEkyxjMxi93RsFDv+c7cvOKNJ8n3vEj4o1wPVn8qb1JPqzmqf/u0Lpu211UUmGN/9iTUWBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4kGjOnntEFX9szyEvqMCHWpfdDPF890E5pvlZKVoEc=;
 b=O/giAx+zT9SQ53l/x9nAttkPKmQiZvbdQ+/me0uBs8G5ZQK0575dm3P0WWYgANFngJXbbb8u0WpTL0fZo5vgH6zCdGtLYC5Z4pfwmOzXbdK+ixEHfr+/Tq8jl2gH87Yyr/D2rUY2vkmKoFDbJfl6rXVfQnUHno/+IECOrW+UiM6UdgHNauYO86zuVqICnKrG9hAf0RNFzqLdXvLaKXpIA8n7ARVR5GIoo3kzQVXteZOl14wfDX/awYhyWXwpUgrc04adsBvJzE/gwmwUkpmiFiCFH7EIX9y3jyhaYeieKvW2UDf3VeAWwE5KM0IJkAp9ik3Z/S0jDY94eA1b0NEuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4kGjOnntEFX9szyEvqMCHWpfdDPF890E5pvlZKVoEc=;
 b=iYGY+Xjfii36mlOQZO8d72AtdL8YCJ/NjE8ifjv5vYSsmSbVbMRG99ZLF8I5bmWsHf3eWlNAb9KdZiHtfPPSxawyp8A6AJXqdqMi8lzC02Sgafu1bYH/hr2AENzDpRaDrzmJkuKTKZkDLPbCZSE0dJY+uOjHnCmr/e+ujpbQ+6tMTgtA8+1CymvGXbl0YxhpfZGGKRKRMyaWQ3d3HOAXr9mx+D7UG5PjSy7YFvmPYJQ44hQ7wFvNi8+mI8JqZMy2aYEmI/ZlibYd/SM7FVQudDYrV99v94+1I9b4omwqhBQ1VpVuZuROuwhtbPQ/ddeBx0GVL7mQlqCwiD/WeuSp9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10114.eurprd04.prod.outlook.com (2603:10a6:800:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 19:42:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 19:42:27 +0000
Date: Wed, 1 Jul 2026 15:42:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <akVtnLsdN4ZEP7XN@lizhi-Precision-Tower-5810>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-6-lakshay.piplani@nxp.com>
 <20260701072319.165A41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701072319.165A41F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0108.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: 978ee1d4-2109-4c03-03c1-08ded7a8e14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	QNFsZ37IRiJgOT+tRrKNQrBv8Ow0uvzk8+96Ae8JAttDWudarpk+ksy2qIMr441TDuRC4HYDK3besjEk5vm+I1X8rQiZPf0ftf5UJAo0/7Lmpd2ABPN9GjeomAxmbaw2AYWeXiQRPtZJURqVCGhlz/R0vSTO2rRL4eo/LnQoFKM98tOBNpOxXiz/dVriEfmAJ+4Ff/XU1Xf+COcTBaLhsdfa1w0CKW2DScWYzlgGwkR49ffSnQ6ujAFJzGYclHPp8jwyc0s9NdYyJKTLaplt57Rsh3cPRjdtS8FYUaLtCScbfDw1s66eFhKF5i5IlnqQ4m9fbou8w7PEYUYK04vJ24hFTv/0Ig6Iqlph5O9kQNzKKUmNR9gVQV8xMNb4Rx4JOTP8pRe3rezfMKu6U1zqVNOzw84KoZU84JpzJptRzpJggP+0gNX80v42JcOOVnVelrYcv/1/nEAabSP9s/35BpdMad/9POfZuFlFj9VC9+K9tv9XRK2nblk5rhmlblbsoB65q5u9LDMjLpcQFZmUyY7TyGmkGBktn34D/w9rT+6Fq2RfLN03vquVFUS1FjJfoX+kvD0OubuJ5RcuEGMcbRiMiaQAg7Zf5HImlJE5mis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0UjB36NJEUsRCWh1T0M7rb96FIB/o0/th1IiXYRh9E4iPuitEeyN5wsNAX?=
 =?iso-8859-1?Q?ujiq0YpE+75g5fMnoe2Ob7gEOrgJYwyJXemeqLtnY9noPzHI0ZR1RuGj99?=
 =?iso-8859-1?Q?gYC4hwph1Evk5cRvguCCcbEWdXOH2XKLPsUb4CygbVZN1+JuTAoBQNflzQ?=
 =?iso-8859-1?Q?wePQJSmyJBZSboRY6dvUHjJ1UGrWyTgRx73SvtRzXyhi8eb0bg3+ut41vQ?=
 =?iso-8859-1?Q?5p+st/KbN+aG6Epp0URTea7gINxeTTev8Vi8i0lTlqr2ImH+nHlyo7/eIL?=
 =?iso-8859-1?Q?Q2FDc7PYruRCErdnACyqwsx5GAJB/Ev36cjL4w/14Fv0d0GEMGmpXzZcYl?=
 =?iso-8859-1?Q?NbV8v9/6ZWOUZfRqFtagHtjYWCTswoy+9SDn/UNfjO0QmsvlWjuFMOMuds?=
 =?iso-8859-1?Q?GhxjXAVAYLf0f+wFBZ3RI3WLJEXc1bfHzBoLe6eIptWedQHQ1U1qxZv9jJ?=
 =?iso-8859-1?Q?zoSEYScrmYSTcoaCbNBUgWbCNMJ/hVHE34pPUzxsWe1d5ALFuIvDMLkz04?=
 =?iso-8859-1?Q?k9rXYYqW3QAcEhWclA459CAd3970NkqyIi3BO2mJPcUjiuv01wRg/7Nz7S?=
 =?iso-8859-1?Q?K/1teDUtGK1FDFB3cODOB7TKjQ14Z07QFyYgSdB6dGULik7wPAjwDZWzlB?=
 =?iso-8859-1?Q?kedZvlUkL1ET6B5E+UKOUX+ESCF7gaQecYXbeZwqRNtt+kjKZcDtsJssyi?=
 =?iso-8859-1?Q?ijm5ueb6Svr9pYeUxPcZUxBDmZ5T9qb4ECRuBGjhralQiIJ0di37bkEI1U?=
 =?iso-8859-1?Q?lxXIWMrl9nFBfcke1n16MYWeW4jJIeiovKz0gVo7uTRdUUEHq91spSg1yt?=
 =?iso-8859-1?Q?a3HT+R9rc/lVORQttXQMc8YFgDO6QtHtB1RTIGh9a2rtazX7oHn/iXWZJB?=
 =?iso-8859-1?Q?TlanUsN4kD82/nZ1E7EeBaDQdPfFEvd2w6qTQfiuynPzFDM8fEj44gvz8C?=
 =?iso-8859-1?Q?EFHQ89r7uEenQEpyPYZhNs02h7TpnSzp0vp2VZq6r+GBe2FpzA/m5zDwz/?=
 =?iso-8859-1?Q?WH4KGl3ofErivbTmpYjwMXi1E9U2HqyC70Hps7rkQu7RTEhLhJbvLOyHVx?=
 =?iso-8859-1?Q?TOkRrgM0MMjybrpzESYFFu0UQGPSGt9RlAEFFLFg9kHKZrDwM1HiddsmLv?=
 =?iso-8859-1?Q?u91WWFGzokG31ublP+G89gwEyzrz4mRSq5G8OWW6sdT6wFkxcnf6UmPKkF?=
 =?iso-8859-1?Q?QCod1Qqewt/kRyILQdi7c4LYjuNfC2Y+AvOk7B1jkZGM8FgEJr8CuqXz7U?=
 =?iso-8859-1?Q?AQZR7egFHTiq1NnWkZkR0QQzn27q/dGMQgKCME4glLZY8HpgughCr7TVzT?=
 =?iso-8859-1?Q?6MhmqcOI5hdA5A6tq+uio6ODMo3r/wMkCf+1U1SEEH+KvNtg5kT9r1ZTBs?=
 =?iso-8859-1?Q?rXDn0I0q7H5yneMDKkjVFWUonDc4d8MgoYpovkMbXu6xPGHoSGv2s+lHTR?=
 =?iso-8859-1?Q?p4sd5wRhr/OC+MfSO4FgT2aTwGazmCN8+ChFQTDy3GuSW6fYjeDTMhXH4r?=
 =?iso-8859-1?Q?GgTrfQtjvRG+v6nLOEOyzlRDvKvzZutsMrC2KOauD1bAnW1bCgcm/12odV?=
 =?iso-8859-1?Q?yQx18zjPlX+PCFYP51Oq3z6SltUhbwnTMO8phFTc/6VOzV8o23a3HWuxG6?=
 =?iso-8859-1?Q?pd5ta4Y38lTQnE8BbItmyhsoKGPAtgdF8NvrEe8V8iiPqNxV/RmHMLpWnI?=
 =?iso-8859-1?Q?1V/sXYTCY8NBiV9n9f7T0eU/3geh1PHLXd0yLo2sRA53Nx+HTiU/nXs8PN?=
 =?iso-8859-1?Q?1eonQKHKAuk75ULHPo/wruNOyJU0bZ/Qw0bNpLnokRMCVxcsZtEft3XTr8?=
 =?iso-8859-1?Q?iD0VZ1jywWyJ1jHXqWj50yPY/CfT5dqAnyaKeH0nmrYyQQmJVhTm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978ee1d4-2109-4c03-03c1-08ded7a8e14a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 19:42:27.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RGmtlu1CWb5b6i91dF8sZnTjAsWFIU1KLMMgDPKygMojwDzZZVvNELVeiW2xdgibrSqDGrvoHCx4jPPUmcOxmf0xKn5Q7y1/IdPHZb4VCLRCzs+YK7r/UOoqX+/z6iF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10114

On Wed, Jul 01, 2026 at 07:23:18AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [Critical] `i3c_hub_request_ibi()` intentionally frees `desc->ibi` out from under its caller without cleaning up its workqueue, causing a memory leak and a double-free on failure.
> - [High] `i3c_hub_free_ibi()` causes a guaranteed NULL pointer dereference in the core IBI free path by recursively clearing `dev->ibi`.
> - [High] Address spoofing in `i3c_hub_master_priv_xfers` corrupts parent bus address reservations and suffers from an unprotected race window.
> - [High] Missing `xfer_lock` in several hub operations allows concurrent port enabling, breaking virtual bus isolation.
> - [High] `i3c_hub_free_ibi()` permanently destroys downstream device address reservations on the parent bus.
> - [High] `i3c_hub_do_daa` delegates DAA entirely to the parent controller, breaking boardinfo matching and DT topology for downstream devices.
> - [Medium] Acquiring `parent->bus.lock` while holding `child->bus.lock` triggers a lockdep splat due to unannotated same-class lock nesting.
> --
>
> commit 22c2a31197952a434777498d93a1ed925009d6de
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
> Subject: i3c: hub: Add support for the I3C interface in the I3C hub
>
> This patch adds virtual I3C bus support for the hub and provides an
> interface to enable or disable downstream ports. Virtual master controllers
> are created for the downstream ports, and bus operations are forwarded
> through the hub device.
>
> > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> > new file mode 100644
> > index 0000000000000..d29ed40b6f735
> > --- /dev/null
> > +++ b/drivers/i3c/hub.c
> > @@ -0,0 +1,566 @@
>
> [ ... ]
>
> > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > +			  struct i3c_master_controller *controller)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	i3c_hub_enable_port(controller);
> > +	ret = i3c_master_do_daa(parent);
>
> [Severity: High]
> Does delegating DAA directly to the parent controller bypass the virtual hub
> bus entirely?
>
> By calling i3c_master_do_daa(parent), it appears the parent discovers and
> attaches downstream devices to the physical bus instead of the virtual
> controller. Does this cause boardinfo matching to fail since the devices
> are defined under the hub's device tree node?


Add comments here: like

/*
	All target devices which connect active ports of hub are tread as
connect to parent bus at same time. So keep simple, all devices dynamatic
address should be in the same address space, that means it is differences
for all target devices even it is at difference ports. So far, address
(128, need double check) is enough now.
*/

Please rephrase it.

>
> > +	i3c_hub_disable_port(controller);
> > +
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> > +				struct i3c_master_controller *controller,
> > +				struct i3c_ccc_cmd *cmd)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	i3c_hub_enable_port(controller);
> > +	ret = i3c_master_send_ccc_cmd(parent, cmd);
>
> [Severity: High]
> Could the omission of hub->xfer_lock in this function allow concurrent port
> enabling?

look like correct, you acquire it at i3c_hub_master_priv_xfers(), should
be similar here.

>
> The lock is used to serialize private transfers, but callbacks like
> i3c_hub_send_ccc_cmd(), i3c_hub_do_daa(), and i3c_hub_enable_ibi() do not
> acquire it. If a private transfer runs concurrently with a CCC command,
> could multiple downstream ports be enabled simultaneously and cause the hub
> to broadcast traffic incorrectly?
>
> > +	i3c_hub_disable_port(controller);
> > +
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> > +				     struct i3c_xfer *xfers,
> > +				     int nxfers,
> > +				     enum i3c_xfer_mode mode)
> > +{
> > +	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
> > +	struct i3c_hub_controller *hub_controller;
> > +	struct i3c_dev_desc *hub_dev;
> > +	struct i3c_master_controller *parent;
> > +	u8 hub_addr, target_addr;
> > +	struct i3c_hub *hub;
> > +	int ret, xfer_ret;
>
> [ ... ]
>
> > +	if (hub_addr != target_addr) {
> > +		down_write(&parent->bus.lock);

call i3c_bus_maintenance_lock(), move it to API.

>
> [Severity: Medium]
> Will acquiring parent->bus.lock here trigger a lockdep warning?
>
> Since virtual hub operations are invoked by the I3C core with the child
> bus's lock already held, acquiring the parent bus's lock (which belongs to
> the same lock class) without nesting annotations might produce a false
> positive lockdep splat. This also happens in i3c_hub_enable_ibi() and
> i3c_hub_disable_ibi().
>
> > +		hub_dev->info.dyn_addr = target_addr;
> > +
> > +		ret = i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
> > +		if (ret) {
> > +			up_write(&parent->bus.lock);
> > +			hub_dev->info.dyn_addr = hub_addr;
> > +			goto disable;
> > +		}
> > +		up_write(&parent->bus.lock);
> > +	}
> > +
> > +	ret = i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> > +
> > +	if (hub_addr != target_addr) {
> > +		down_write(&parent->bus.lock);
> > +		hub_dev->info.dyn_addr = hub_addr;
> > +
> > +		xfer_ret = i3c_master_reattach_i3c_dev_locked(hub_dev,
> > +							      target_addr);
>
> [Severity: High]
> Does this sequence permanently destroy device tree static address
> reservations?
>
> When the hub's dynamic address is altered via
> i3c_master_reattach_i3c_dev_locked(), the hub's original address slot is
> set to free on the parent bus, leaving it vulnerable to DAA theft since the
> parent write-lock is dropped during the transfer. When the address is
> restored later by passing target_addr to i3c_master_reattach_i3c_dev_locked,
> this marks the downstream device's address as free, which seems to wipe out
> its reservation.

It makes sense

	i3c_bus_maintenance_lock()
	i3c_master_reattach_i3c_dev_locked()
	i3c_device_do_xfers_locked()
	i3c_master_reattach_i3c_dev_locked()
	i3c_bus_maintenance_unlock()

Another problem is previous lockdep().

int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
                        int nxfers, enum i3c_xfer_mode mode)
{
	...
        i3c_bus_normaluse_lock(dev->bus);
        ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
        i3c_bus_normaluse_unlock(dev->bus);
        ...

        return ret;
}

simple method is promote i3c_bus_normaluse_lock() to i3c_bus_maintenance_lock()
when dev attached to hub devices.

and also lock parent master's i3c_bus_maintenance_lock(),

So here needn't lock in hub.c

if parent master use write lock, hub->xfer_lock needn't

>
> > +
> > +		up_write(&parent->bus.lock);
> > +		if (!ret)
> > +			ret = xfer_ret;
> > +	}
> > +disable:
> > +	i3c_hub_disable_port(controller);
> > +	mutex_unlock(&hub->xfer_lock);
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> > +			       const struct i3c_ibi_setup *req)
> > +{
> > +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> > +	struct i3c_hub_controller *hub_controller;
> > +	struct i3c_master_controller *orig_parent;
> > +	struct i3c_master_controller *parent;
> > +	struct i3c_hub *hub;
> > +	int ret;
>
> [ ... ]
>
> > +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> > +
> > +	ret = i3c_master_direct_attach_i3c_dev_locked(parent, desc);

All IBI cap devices should be already attached to master bus when DAA? need
attach again here?

Actived port's devices logically attached to master bus?

So needn't switch port.

> > +	if (ret) {
> > +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +		up_write(&parent->bus.lock);
> > +		return ret;
> > +	}
> > +
> > +	kfree(desc->ibi);
> > +	desc->ibi = NULL;
> > +	ret = i3c_dev_request_ibi_locked(desc, req);
>
> [Severity: Critical]
> Can freeing desc->ibi here cause a memory leak and a double-free?
>
> If a downstream device requests an IBI, the core i3c_dev_request_ibi_locked()
> allocates ibi and ibi->wq before calling this hub operation. By calling
> kfree(desc->ibi) here, the outer workqueue is leaked.
>
> Furthermore, if the recursive call to i3c_dev_request_ibi_locked() fails,
> the outer caller will execute:
>
>     if (ret) {
>             kfree(ibi);
>             dev->ibi = NULL;
>     }
>
> Could this result in a double-free on the original allocation?

look like make sense

Frank
>
> > +	if (ret)
> > +		i3c_master_direct_detach_i3c_dev_locked(desc);
> > +
> > +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +
> > +	up_write(&parent->bus.lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> > +{
> > +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> > +	struct i3c_hub_controller *hub_controller;
> > +	struct i3c_master_controller *orig_parent;
> > +	struct i3c_master_controller *parent;
> > +	struct i3c_hub *hub;
>
> [ ... ]
>
> > +	i3c_hub_enable_port(controller);
> > +
> > +	down_write(&parent->bus.lock);
> > +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> > +	i3c_dev_free_ibi_locked(desc);
> > +	i3c_master_direct_detach_i3c_dev_locked(desc);
>
> [Severity: High]
> Does reparenting the device to the upstream master before detaching it
> destroy its address reservations?
>
> The detach logic calls i3c_master_put_i3c_addrs(), which resets the device's
> static and dynamic address slots to free. Because the device is temporarily
> parented to the upstream master, this frees the addresses on the parent bus.
>
> [Severity: High]
> Also, does the recursive call to i3c_dev_free_ibi_locked(desc) guarantee a
> NULL pointer dereference?
>
> The core i3c_dev_free_ibi_locked() function calls master->ops->free_ibi(dev).
> When this hub implementation recursively calls i3c_dev_free_ibi_locked(), it
> frees the IBI and sets desc->ibi = NULL. Upon returning to the outer function,
> it executes:
>
>     if (dev->ibi->wq) {
>             destroy_workqueue(dev->ibi->wq);
>
> which unconditionally dereferences the newly set NULL pointer.
>
> > +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +	up_write(&parent->bus.lock);
> > +
> > +	i3c_hub_disable_port(controller);
> > +}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260701065755.2067793-1-lakshay.piplani@nxp.com?part=5
