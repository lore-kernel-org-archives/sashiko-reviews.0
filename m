Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A4380FDD
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935800; cv=fail; b=eE0zVRihIDBRtNar0JxIzi7it3IuzANcs7gIvJgAERzis4Qm6QlfesKVnBu+Je7rQdBH/aRTCyv+7yE1J6V3EaHi1Yqqpw3ZsAxQxp9p46niWuPxCuodUfXwHOcXEsuoS4wgvYwFks1rlUOoRVjXvGDKSRzXktryXRIRIGfd3Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935800; c=relaxed/simple;
	bh=I8GbEfm/5qF6PY/JfD1v+C+SuOe8+q8YUFiUTUUDDsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VwLMdtCZ4QlFg+MOvvLjt6L62cBxcx0h1vFeWmioUZk0dAws8KlUDrxjxjwnPPBIEOM5eT2MY+EWf1SuUO6lln2rKmgP3DYPNe3yCcGhf473A4+0W1UOMbq3XOLFtAZ/oF9wVFdHJJyuA2gedh0lIe8OTA0zqWe0rKMlt7t/0e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jvw0GUAL reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jvw0GUAL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYVmEjODBR5C6vX8KPdu9Ff4ezmA3059ZjF8gS9kM8rRCH0Gs31qoxu0u7Q9K65e7Mae76pOJzqoHti9cSPMtYfS/aWVD09x5Ad+csqdMxcRyUS0gLyXVUOFR9VQhVfvyR3JATQgqiKzo6C75cJlFwKxO8GWxbJNH1ymabHNTsWcb6mmdrg4eU4AMw287w+t/gAnjJHA1+luk1IMuwnQSFKt/sppDgk28MTM2OPQaB3MnpZqbdGB3MSOv21mFtr2ObIyzXPl1JRb9wIlf5AYbniL/kMwBEnvSu1tozQJKGEBjoF2EyPHIYsqEqJyGklkyx0homzgtoE/sx0aNKSuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/DC5SItapnCnqtwfoIouEMM6jZnx3WWiIiZ0Uin9+Y=;
 b=h8Egaijaza1p81lnZbsav4nGPZlFZa+i2e3vqyRv0Poxzf/axG7KNRc2CD2E03zQELmDf5m4eFhGblOrJc1OPcZLsQ82cF9r5i1j9yh8X5MtxM7Li9Yj5OWUrabDKDgbvCRNDDJ+bP3CCZREuTgw3A1xNoXVrcBFiIL2vEbFqPYiOeYKZhPDw7WuqSg1ZIPH0xcVHK3AM1uNY30oGBbLyL1A+Ybx67jrgetFzE8W6xlTNT1OPK+OAEjPJIPv5Cl1oa27OK9AjzaFcuo8NKMBFw6laS7kTnZajwI0gPItU10LVdwckvgcy03fuRqXM1DkB92wNM66YIntMxDmCT/ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/DC5SItapnCnqtwfoIouEMM6jZnx3WWiIiZ0Uin9+Y=;
 b=jvw0GUAL/qcKFyUOnzIzLByvbPMihxiLoLHDtDBQZfOb9CLNV3mbO8RxLLimIThyQV6cQoaTD6xUimC1pY/kAo/KbwdMdeqNEk/GjHaDKUovKfaGFMpM54GEztV+2J5UDXiHvo+BFlaT3IftOvf1XoUfMXYZBK4qDRGMgZ7MBtJAzzblUUeo6+tBwA3O5FiWzPoR3bwsnKRRiv4Cq5mdvmKqHgYYj4lF6WsJinLrHU5qQenGsDGXjvv1RCwyWdQ55dyWQtoqLHrPtT1bAZeLe5MDii0VHQjzXewqzriN6nFlvO3tbKXCGuyYxKccFlUwyex6jNA82hnboalLj+pKgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10999.eurprd04.prod.outlook.com (2603:10a6:800:266::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 19:56:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 19:56:29 +0000
Date: Wed, 1 Jul 2026 15:56:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v13 6/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <akVw5-uQHW-MGTSe@lizhi-Precision-Tower-5810>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-7-lakshay.piplani@nxp.com>
 <20260701072149.644591F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701072149.644591F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:806:f3::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10999:EE_
X-MS-Office365-Filtering-Correlation-Id: e39696ec-51c1-4c5c-d490-08ded7aad7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|11063799006|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	MMu4J1lWiNpWsgPD1FubGEbzLzK2LMtAENVpkHN/tx/E8PP7cyPqOcEpCx/euxrUDeaFZHlL7wmg0ugSW19qLbhkbQbro5qukZhEhasQMow/MC5jCq7fs/43W07MmFaVINVZ41iiElBYHSA/6YB7z5GLhxs4vr3pVDnABY/E/QfquD7RUJAL3DnAL0tqqCShVTttszpWtOtt4KCQazg+84bziiQL2ozScxvGTckr+YIhfEqzN7LC0gNeiICzF76ozNvFUoo+1nVXea++gF/unATbMRoZY7piAhWXxpVPAAQbiv7wTBla/skMYlFCdIUxzNk83wLsEC+vb69v++D5Sdx33zDc2CAxs0PXjtzU5Ik0yiMH/DjsHTfIt10HghD8Guwfb3nS98OHfmyMiIWYBiYDrsUhCVag7ASchFyCJbknholsDEHwN8d55Jc4fMrGLTL/c/FpfQO5nL8wmcLeN00tGw+mYnFVO7SqHYjZi4pViLIBK9P5dehu4EbpR7e+w2hmPGbARFKZy7GA9ZylI9zjDhqqSw6MNPUpm4zufX58BWENvlPPWJz7PPi2hzF/REiLmUVN0wAiqStNWTEahSCSYTmQip6WfRXzaGIKRfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?giO6mdJa90/Diemq80GMavMo9JzCeJ02pxiHm2fgQVO9GIk935VGsP6zA1?=
 =?iso-8859-1?Q?94sHvHbce1V36Kz/jCzIN+zi1ViwnV+A9UVLEDAzhgQB5MVQT5/sVgQgRn?=
 =?iso-8859-1?Q?ZY3v5gGw+WMmcKlJJqvZM9Ne4pPyP3WH+/u5TtdoBcSqt62TVFme+g/f+P?=
 =?iso-8859-1?Q?fr2mJ8BaWmZwiV0BaUJBnoXZSVAbSvdjpdfBYSHISxfVx2ZUW75yJehigJ?=
 =?iso-8859-1?Q?dLxbRrUG8IiFjJX94yp3rFgvhN68gXsTSjClCK3XSV2Rkt2c0G9hVn9/QG?=
 =?iso-8859-1?Q?euD+Fc+d2bFZyvznFUbqfzji9AjZrkh06A4zLCnvEZEiTosAomKatiAIiY?=
 =?iso-8859-1?Q?275FREnXhzihuzA1Gsw7pkd0WIcfP0mn+n7U8QcwTRomh0S6yhHzPcYMLn?=
 =?iso-8859-1?Q?oonRLiiv2Lvq0hLep766WycpTVfx7E9abaVsUU5WDOrqBcOfocP70Xxugx?=
 =?iso-8859-1?Q?acHLa94qKgo+SkjthtLbK3QmQwzrwuvdi0tVURJQFXakjISJ7u55aPaZQP?=
 =?iso-8859-1?Q?fu5SRzjqGU0rrlgUjKYWyrluGzzqg2IzweyenW48kG6zCWX7g1m7UGru90?=
 =?iso-8859-1?Q?LG/+/UTIca5xUoGjVb5ZaGlFgDFxLiwR6ZXQwIsIPhsyEa3njb5ZH9Wdf0?=
 =?iso-8859-1?Q?wIZtDn2ADOj/Y8Os2hFOf0BDiHcgSin8Nk53p28JTMa76LHydZPAn1ZhdC?=
 =?iso-8859-1?Q?v3XqDzZirmvZl9raiBgw4MqRzygSRIv4QHl9oLa7xRBw2okeOZqA/K5RVp?=
 =?iso-8859-1?Q?0/CmqCal08siHWLOTxxzCB4HCtJsZXK1CX/Sy1kKvf2GKiwHIlgCgyuas0?=
 =?iso-8859-1?Q?9KCs8wDgMB2p+psJGa6/zuqGH4Do/xh+aGZnwT11Sz0Jr+iKgHzhPln581?=
 =?iso-8859-1?Q?WN9tbDHtHNdogjoMb8pnmcL1oDVDrIcm4z1iQWpzcbFsu+yyOZ2Ob9yVRG?=
 =?iso-8859-1?Q?scjnFMposUp9jCDd3y/nagydHXueU6OvdYYR5mjMnLTjmt8sMhB333w9Dr?=
 =?iso-8859-1?Q?PM91sdEWY/DYowh6JL4IDlwxDiERwZIJQt9yrs9xIHAz7K59t2IXY27LtS?=
 =?iso-8859-1?Q?5Q1uRnMc78rwQ53rdzYehJ7M8djM1KStpuT281cgRujhV8RloC/D39LGTJ?=
 =?iso-8859-1?Q?CKhECdDENKa/JGkvVJzPX+pjV+NnmhVC7WRq2zvY3YBsWoR6iXEiq6BpJh?=
 =?iso-8859-1?Q?ynL6rVYl02xf21c8Ngh2zieE5d0C7sFltczZojC1aMH6wNQdxou9PMVMqf?=
 =?iso-8859-1?Q?Kgw1wB3x+AGmmgoFvZIxkKid/Kfx1XI8mVTyvdbQEW7TnzK6YRTuiFKKpd?=
 =?iso-8859-1?Q?dIw0kL0Y+Wb0pfA5TgcGuDjRTTv6BGiijCEiX7v5QJxZFfimasfcDUSanY?=
 =?iso-8859-1?Q?9f151k3a/Rdv1YEjIptE0pwVRYYRMkLQiMr1fkKTi3aZoNHSAFXv+TLlxN?=
 =?iso-8859-1?Q?oiGwWCkhl4RZCU42T+LprZJ0rp8nSCht310Z67rmc6Fm4iNu5s7NY9N2f4?=
 =?iso-8859-1?Q?vJj9oNeZkgowpHOw3q7qHVV9uNOoGKR7VbVwX+G3Pg2GEHay13b3vz8pLm?=
 =?iso-8859-1?Q?z9z2+nxUlK5rZwRzeaMlRCd+lJ6ZWE7LSNjnh4xzvFPXih1ylWTxLNEwBc?=
 =?iso-8859-1?Q?Y/L0R/EQa2npRY8FABoAKKl9t9HEdke8tqFAAiyAEBWSFUSe81T7K6jhqB?=
 =?iso-8859-1?Q?hdqmVktnfYkL6r1GDaqbZ5ML/dZJxWjPYSboJJTLXgtxMeiaV6WAZd19YP?=
 =?iso-8859-1?Q?aNpU8Ft0HE1aivd9VsGEcWauKHfh4bbEm1Hx7P21chDzJM7INByvJyN+k8?=
 =?iso-8859-1?Q?0aevXp9bgXQmHqNBrRj/p/RmTWGBnwlMNep4T6jKK6o23ubEfu2R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39696ec-51c1-4c5c-d490-08ded7aad7a1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 19:56:29.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVvNMfescDDNkZ9RJWbcZ045FG/55HVx+yFpjpX/6qx573mcdFxEHX/PcEgTm2QUoPJ0y82bO6F74GePwW9vJ3kUsSFGVFaAhZveWhV+Y5pE+zhS+n/vSnKq+tne+6QN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10999

On Wed, Jul 01, 2026 at 07:21:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Unprotected and temporary reassignment of a live device's `of_node` creates a data race, and missing restoration on the error path causes reference count leaks and a double-free.
> - [High] `regmap_read_poll_timeout` is configured with a 10ms sleep interval that vastly exceeds the actual total timeout, artificially delaying every transaction and causing spurious timeouts.
> - [High] Failure to allocate memory for an I2C adapter leaves previously registered adapters active but with freed backing memory, leading to a Use-After-Free.
> - [Medium] Loop counters `msg_count` and `nxfers_i` are `u8`, causing infinite loops if the transfer count `num` is >= 256.
> - [Medium] Race condition between the I3C hub driver and other MFD child drivers over the shared `P3H2X4X_DEV_REG_PROTECTION_CODE` register.
> --
>
> commit 37198d19f613736872b6f1fd4f9a75597b1f0ab1
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
>
> This patch adds I3C hub functionality for the NXP P3H2x4x family of multiport
> hubs. It enables I3C/I2C communication between host and hub, downstream device
> support, and target port configuration.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> > --- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> [ ... ]
> > +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> > +{
> > +	struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node;
> > +	int ret, i;
> [ ... ]
> > +	/* Unlock access to protected registers */
> > +	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> > +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
>
> [Severity: Medium]
> Could this global unlock race with other MFD child drivers (such as the
> on-die regulator)?
>
> Because the protected configuration registers are unlocked at the start of
> p3h2x4x_i3c_hub_probe() and left unlocked during the entire hardware
> configuration and device discovery window (which includes sleeping in
> i3c_master_do_daa()), a concurrent MFD child driver could access its own
> registers and re-lock the protection code. If that happens, subsequent
> hardware configuration writes in this function might fail silently.
>
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to unlock HUB's protected registers\n");
> > +
> > +	ret = devm_add_action_or_reset(dev, p3h2x4x_lock_registers_action,
> > +				       p3h2x4x_i3c_hub);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = p3h2x4x_configure_hw(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");
> [ ... ]
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> > --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> [ ... ]
> > +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> > +{
> > +	struct i3c_master_controller *parent = i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
> > +	struct device_node *orig_of_node;
> > +	u8 tp, ntwk_mask = 0;
> > +	int ret;
> [ ... ]
> > +	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> > +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> > +		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C)
> > +			continue;
> > +
> > +		/*
> > +		 * i3c_master_register() derives bus population from the parent device's
> > +		 * OF node. Temporarily switch the hub device to the target-port node for
> > +		 * registration, then restore the original node immediately.
> > +		 */

i3c_master_register() use dev of node. if add API i3c_master_register_fwnode(),
pass down a children fwnode, things will be simple, and no below AI' report
issue

> > +		orig_of_node = p3h2x4x_hub->dev->of_node;
> > +		p3h2x4x_hub->dev->of_node = p3h2x4x_hub->tp_bus[tp].of_node;
> > +
> > +		struct i3c_hub_controller *hub_controller =
> > +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> > +		struct i3c_master_controller *controller = &hub_controller->controller;
> > +
> > +		hub_controller->parent = parent;
> > +		hub_controller->hub = p3h2x4x_hub->hub;
> > +
> > +		dev_set_drvdata(&controller->dev, hub_controller);
> > +
> > +		ret = i3c_hub_reserve_parent_addrslots_from_dt(hub_controller,
> > +							       p3h2x4x_hub->tp_bus[tp].of_node);
> > +		if (ret)
> > +			return ret;
>
> [Severity: High]
> Will this leak the original parent node reference and cause a double-free on
> the target node if i3c_hub_reserve_parent_addrslots_from_dt() returns an
> error?
>
> If the early return is taken, dev->of_node is never restored to
> orig_of_node. When the probe unwinds, the devres cleanup function
> p3h2x4x_put_target_port_of_nodes() drops the target node's reference.
> Later, when the device core destroys the device, it will call
> of_node_put(dev->of_node) which now incorrectly points to the target node
> again, causing a double-free.
>
> Concurrently, modifying dev->of_node without synchronization creates a data
> race for concurrent sysfs or uevent reads.
>
> > +
> > +		ret = i3c_master_register(controller,
> > +					  p3h2x4x_hub->dev,
> > +					  i3c_hub_master_ops(),
> > +					  false);
> > +
> > +		p3h2x4x_hub->dev->of_node = orig_of_node;
> [ ... ]
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> [ ... ]
> > +static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
> > +						 u8 target_port_status,
> > +						 u8 data_length)
> > +{
> > +	u32 status_read;
> > +	u8 status;
> > +	int ret;
> > +
> > +	ret = regmap_read_poll_timeout(hub->regmap, target_port_status,
> > +				       status_read,
> > +				       status_read & P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG,
> > +				       P3H2X4X_POLLING_ROLL_PERIOD_MS * 1000,
> > +				       P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length));
>
> [Severity: High]
> Does this polling configuration cause spurious timeouts or severe performance
> penalties?
>
> The sleep_us parameter is set to P3H2X4X_POLLING_ROLL_PERIOD_MS * 1000,
> which is 10,000us (10ms). However, the total timeout_us parameter provided
> by P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length) is significantly smaller
> (e.g., between 100us and 2,000us depending on data length).
>
> If the transaction is not complete on the very first read, the thread will
> sleep for a full 10ms, drastically overshooting the intended timeout and
> potentially returning a spurious -ETIMEDOUT depending on the state when it
> wakes up.

Make sense, pleas double check it

>
> > +	if (ret)
> > +		return ret;
> [ ... ]
> > +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > +{
> > +	int ret_sum = 0, ret;
> > +	u8 msg_count, rw;
> > +
> > +	struct tp_bus *bus = i2c_get_adapdata(adap);
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
> > +
> > +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> > +	guard(mutex)(&bus->port_mutex);
> > +
> > +	for (msg_count = 0; msg_count < num; msg_count++) {
>
> [Severity: Medium]
> Can this loop run infinitely if the transfer count (num) is greater than
> or equal to 256?
>
> The parameter num is a signed 32-bit integer, but msg_count is declared as
> u8. If an in-kernel driver submits an I2C transfer with 256 or more
> messages, msg_count will wrap around to 0 before ever reaching num, making
> the loop condition perpetually true and causing a CPU lockup.

make sense, please check

>
> > +		if (msgs[msg_count].len > P3H2X4X_SMBUS_PAYLOAD_SIZE) {
> > +			dev_err(p3h2x4x_i3c_hub->dev,
> > +				"Message nr. %d not sent - length over %d bytes.\n",
> > +				msg_count, P3H2X4X_SMBUS_PAYLOAD_SIZE);
> > +			return -EINVAL;
> > +		}
> [ ... ]
> > +int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
> > +{
> > +	int ret;
> > +	u8 tp;
> > +
> > +	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> > +		if (!hub->tp_bus[tp].of_node ||
> > +		    hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_SMBUS)
> > +			continue;
> > +
> > +		/* Allocate adapter */
> > +		struct i2c_adapter *smbus_adapter =
> > +			devm_kzalloc(hub->dev, sizeof(*smbus_adapter), GFP_KERNEL);
> > +		if (!smbus_adapter)
> > +			return -ENOMEM;
>
> [Severity: High]
> Will this early return on allocation failure cause a use-after-free for
> previously registered I2C adapters?
>
> In this loop, if devm_kzalloc() fails for a given port, the function returns
> -ENOMEM immediately without calling p3h2x4x_unregister_smbus_adapters().

make sense, please check it.

Frank
>
> Any adapters successfully registered in earlier loop iterations will remain
> active in the I2C subsystem. Because the devres unregister action
> (p3h2x4x_unregister_smbus_adapters_action) is only added at the end of the
> probe() function, it will not execute. However, devres will automatically
> free the memory allocated by devm_kzalloc(), leaving the I2C subsystem to
> dereference freed memory when it interacts with those remaining dangling
> adapters.
>
> > +
> > +		/* Initialize adapter */
> > +		smbus_adapter->owner = THIS_MODULE;
> > +		smbus_adapter->class = I2C_CLASS_HWMON;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260701065755.2067793-1-lakshay.piplani@nxp.com?part=6
