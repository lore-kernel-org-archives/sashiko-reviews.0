Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E94C9567
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055877; cv=fail; b=Akclm/Z89uuNNWHG467+i7rTH49LUHQbKtXu/pTALu4D0sbxYr6bALpbbKbKRHebOIoPCuswO7oH/xoWhVzzbv6WCpQbR8LVPpG/Uz11rjU7yzi4J2qjnRpAlQ3wbKishi8N7i0OJrNMXqRdZykN+fOenli9pIQDOAUpI4SZFTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055877; c=relaxed/simple;
	bh=AZ+I4F2cDvPO4oq09j8RV/9eHbMGtq5UEpTjd561Hzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qbw5vFA44LSmxRrJcDMZAzMaBtRlxbzI1QZKJP4m5Y4fwTBovvaBm5eS+RmOhlvHykMHNw5/xL8B+Oded2QCCqRxDdxgqDXkAZDkHeSHWwX6IPTcuo6o8pkI1MexN5YPmk+/oPWNx0wNVgtwff8VXTNN2VrCMNXWpQEos7QumxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dSm1KEwL reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dSm1KEwL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+gslhcjSA10P9wrU2J6LoOmAxKsGYuvrICfRqjb6fpJyP+lChShyTN8a2FdcyjQCG/hrrQP/8sCBbtBFiASjN2v9lB5nB4iajlcq7/HVZ0QH/tEXPKziA2HaBt3qPF0N3sLQRSf+xkaadEtvGJYWAcFrF8n1b5JOWwVuCED7IvFP/+SzGjDZFDNl9d4Lg4KXyLw/chJJ8K2hce12nayRGu9DJ5zu9RfxcOpWB1D1hVjIy9kBwtvOKo7oKjD/mDsN/x6qwiLq5GdYZIdgsyhgOPO9GqXgqyrre5b248jQy9mU/mcMBHXyjvU+qeox2SvCAl5wb5Xfqh9IXCD9pjr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYdHb/LsdAwQUVUY+udEub0NAawh/x8xojKbNs0AEeI=;
 b=Q7afeu1C4w7xixXL5Q8MqZZK1Sy2eDr4TR53xpW4xnJ1UYqLMUi+xe7SXml9ip4Jx3AMh88p5a7bJszLbGLhnbu3PUls9ig1gCx4xb3wLP+INumUiK/IR2X3Ll5hyJa6oDOX5P1p1Wa9vQ1gLinfHW0PosnhbKp+pvkMPs3pgyNmeE/lnnE2nwpcxhXRj9Ut5WrMxoIt9Lbg1zL+gUnWOqcIFFzcneh8t/EV6wZCFrJjZOSZwJHx2abH+itFmhU/OuD+oGDhYbKl7hLYz5PPo/Ka8JvTL0/frPhc2upCdeYlkPqvKTR7Z/WEVzbICw4x6BhnxfWclocBOKXH0WXDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYdHb/LsdAwQUVUY+udEub0NAawh/x8xojKbNs0AEeI=;
 b=dSm1KEwL0Rc4Whc/ClkAU4mODswuivlU8Wl8/VMkzj1DzTiayvQPCqmMQFDsSDG+d2QQ2QfvU8nJgfl1Acv1ze0k5vrTyAP6vGaVQdvIwkRWLyvD4yOjbeUYHEOvSVVciFtpReXPuV7luneexwcTKhWTkiU8zIiO0whz7rLscM0W/NS1QC1Sgfdwkh2bFjGjlfSW2TDVnLDVtDyWJryH2a+63k5kt3qNCCy0JOuESTy7ER2aR94XkXD7wsSmP3Vz1rxN0daX84DDuJ0Fvvlyd3TkL3j9eY9gJHABD7p1iJ/+PucKw7Hd3kjTzbAg9Oa5BgLhJIi7uL4BXddGsbnvaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Tue, 14 Jul
 2026 19:04:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 19:04:24 +0000
Date: Tue, 14 Jul 2026 15:04:16 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 1/8] i3c: master: Add APIs for I3C hub support
Message-ID: <alaIMOhdFQxC--93@lizhi-Precision-Tower-5810>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-2-lakshay.piplani@nxp.com>
 <20260714100322.7F82A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714100322.7F82A1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: cf573693-d681-4bf8-5464-08dee1dab83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|6133799003|56012099006|4143699003|11063799006|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Kkh4QwW0KRg03LsP6FPOjjoL6PIlHnDS4G9AmswaYq0Lrb8D+y/TlcXwchCn9gXLhQ+u3SxrbeYq1M1ZSR/hbIM7i48Rfy8YN7WXtOEwHaFx7DY0IDr4OZZ1NYgtW8rI9bWrXGLLrmOd34VBk61LGtJbnSMuCIDTTK4OClgfKrzdYtl8SnzP4packet9goQtz3FyRrzKZixY7UeTEM2L5/7TrjYlPVRcYG8sQEkGMDATE/lWxPTNth0OIT7Uz1w39N1Zf+XflfZXs9TEwLZaaeDyRyNu7OZPPzjQTaardSKdo5yPZNnfUObwM4ugxoiu9pW/JvHXLZ3L4MOJELdbis02znJT8HJZ0fYGIYfMjZRQBvnbv/RUcznxQ9UB4VyEVF+USYSRiEhX5mjtqhKOY8e3hPsoyk/UTOU9FphV9gragbvGYreK2wEuswmjnYWoDr+dlk/Q0xBqxpY+0TmcuENDvj9Vsk6vB+claArgVaSoroH2jB5Ve/yP7Bagl+yCtkGClGYLndGYhsU119G0iIWb4PpJkRI1DSZ/gl5tIpqgdn9LLRU5uxo3aYXT/D+GGaixSrC/s7jr3GwOQI78U4SSB+etZ6JlO5dp4nKiLT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Sm+h81H1k9p3mAFGdy4kbFJBOAi5a3t8ltvFltt5kaYCjtFr+6oG3F3aQO?=
 =?iso-8859-1?Q?enloPs4XCSvlIZwBVoTqVkZHCnfzoVTDwG7n7b5ZmzJslYtvi4NZvXJCZN?=
 =?iso-8859-1?Q?5VX3lWjmJw+6ysHemdUgXa6cxoHrly4suKsD5QpmSM5QZFqbeSrg5cmmV+?=
 =?iso-8859-1?Q?I+gtJaB84eJ61Wd+3wsS1XzENaqlD7mJM2otXM+TX5s/isC1jBcCtsmtgk?=
 =?iso-8859-1?Q?dAEkRSpPs5VpUiHZ0IySbrJoVMOoJM4yCdZDwzmVtOOzpaw5Q+iEv1DykX?=
 =?iso-8859-1?Q?7B0h3yl63ist1jJSj6LGJxSH8ZhRtQMmX9GhSehbGlQSlSfOT3sOG1ajyU?=
 =?iso-8859-1?Q?vWeFUuTBxZb6PfUbwG7JQwte+bdQDPR9lz1v/o+vzwXuuocz72BA1j4DLF?=
 =?iso-8859-1?Q?yW2dudsaOt8uFjrXsGvB0+hediqNKtBV/rVFnqUjmz+zCFGzycjbrwpKRM?=
 =?iso-8859-1?Q?Qg0Fa5B2dj4F6ZJ/i9v7y/UA0//8fE/Gcbb4xQDhS5LsaexU5+4pJ9UfuN?=
 =?iso-8859-1?Q?pjoB2eG/yX7hHJIFjKcCPCBIFd30UXOqv2QUgjTyix025kn9ubAqC9wYVC?=
 =?iso-8859-1?Q?PhMxOJLyzUL85F57qQ9AsYHfv8yfVFuPCKo168Z9qs+AzEXdX0HPFdEquv?=
 =?iso-8859-1?Q?5cZlWHAR8F1GF77Ron5lfnCvRSvDV2x9YSxo13+cT+fncCIlhdKwnC8i/i?=
 =?iso-8859-1?Q?Te6X+ZWZycsiXonx2gPbHDPGkppUD+/nY5Veic81ScEtmMxJrtE9/LPlTG?=
 =?iso-8859-1?Q?Lb61UB8ehFj7s33ut7B8sa1+pnAC1jmH8DreQCe1AdXxM75s59cRZuq7EB?=
 =?iso-8859-1?Q?cFyYNAUXjM0ujENd75i9K+P6BrJ/6YtKuQ2KwRO9A0mgqMFTsszU8bPBb7?=
 =?iso-8859-1?Q?7rk0m+f6kgOSw+FLByW26s6+yy8w9I8nJKpalWlw7XzjUWtju/eN4JTu1l?=
 =?iso-8859-1?Q?0ryEyMBgqW/OMruGtuJzWWtQYGT7W7oew43xArok8NFJ0LSqevNVOkWpJg?=
 =?iso-8859-1?Q?OySkUUqHKIa++A+lsF0xXfkcSCdDV/1Aj8cVcRCzX3O5aFDbDG9FDeCSFc?=
 =?iso-8859-1?Q?4llpKycRcd7C94IUTLlimpimbaXhcS9tzo2ACKg1kbA8FzY3DTdfmXvaHP?=
 =?iso-8859-1?Q?YY5OgmJDRSBePq5S0oooQKYWODXoHih7/zCdFdeqt/I4quLVLU3GxBy7xF?=
 =?iso-8859-1?Q?/FKOA9tHfaFAf9DkyR4pRwk4RmybLUIH4sV+wLQoNX0qbhBTqojuy6EQbC?=
 =?iso-8859-1?Q?KdnCdyynEJabZkYT8G2Prrs4q1WusfxWx8Ij0/O9oPCilYv1bLExncEDsm?=
 =?iso-8859-1?Q?LuRkNI+Espo82bd1TEpzIyEkKAqfqjUUlfM/efk+ObAEZ2FxE+Cj1l2ant?=
 =?iso-8859-1?Q?+b84hz+mPW0QUY7G3J5D13WVZDfihkOLixQewAsgDKCmab0ORI4AbtIPd8?=
 =?iso-8859-1?Q?xQfrAnGLd16b8K3oe0fCO73Ys3JgSPJ5JZh/AHam52qQYWnzHDYeX8WfBv?=
 =?iso-8859-1?Q?U/JQYlSJcd5/0MhHnGUFW0OxA22Jh/jioM7kik99fKJ4H4AmiEMmu6IPiq?=
 =?iso-8859-1?Q?IrpZV/s+PFFDftte6GIjFbmCwsCONJk55MSt/2k6T8aRiJNlniCbTd5Ktx?=
 =?iso-8859-1?Q?9SyX+3aKtjufpe3EiVfy2qHQu4ur443njGiZ1kGy7gwk+aCT9edc5sgukm?=
 =?iso-8859-1?Q?5ZQCT9ZDc52jnhXEKtXzStDvIckmjm05dLxA8JLCl/QxUkecXUt+yPNd9c?=
 =?iso-8859-1?Q?VBkL/zZtcbXf5JnXZyKhmxlxPP760BI0rEW60Uh7qFEJpPlcprc25WXuZ8?=
 =?iso-8859-1?Q?Fnb/h3Ekd5TpsbZTZNkyELqhZ5/R6z6GF+cycfy+LRKoiBWOAvRM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf573693-d681-4bf8-5464-08dee1dab83a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 19:04:24.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBRBQOLIRYcfupUtwvOpLAcoZUAg5hRS6fLmAhLfEfxa5q8vbjqfWkAbu5J8h7doRqk1Yzz8Iv7Sed6Fdn0Ggc0kRBURAVM1zbz98eslSN7jTTpK7jkjqlw9DBCPuIjO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639

On Tue, Jul 14, 2026 at 10:03:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Asymmetrical cleanup in `i3c_master_direct_detach_i3c_dev_locked` leaks resources for unaddressed devices.
>
> Pre-existing issues:
> - [High] IDR entry deletion on `i3c_bus_init` failure causes ID corruption and sysfs collisions.
> - [High] Missing NULL check for `dev->boardinfo` in `i3c_master_get_i3c_addrs` leads to kernel panic.
> --
>
> --- Patch [1]: [PATCH v14 1/8] i3c: master: Add APIs for I3C hub support ---
> commit 1db519c7da22819d977429d77c0d05ba94daedf9
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> Add helpers for attaching and detaching I3C devices and CCC helpers
> to check CCC support and send CCC commands, address slot helpers to
> query and update I3C bus address slot state, registering virtual
> masters with an explicit firmware node, and exposing the bus maintenance
> lock helpers.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index f1be38a640ca1..3b1c342be2bc5 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -1775,6 +1792,83 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
> >  	return 0;
> >  }
> >
> > +/**
> > + * i3c_master_direct_attach_i3c_dev_locked() - Attach an I3C device to a master
> > + * @master: I3C master controller to attach the device to
> > + * @dev: I3C device descriptor representing the device
> > + *
> > + * Attach an I3C device to its master controller after reserving the device
> > + * addresses on the bus. The device must belong to @master.
> > + *
> > + * The master device itself is not passed to the controller driver's
> > + * ->attach_i3c_dev() callback.
> > + *
> > + * Context: Caller must hold @master->bus.lock in write mode.
> > + *
> > + * Return: 0 on success, or a negative error code if address reservation fails
> > + * or if the master controller driver's ->attach_i3c_dev() callback fails.
> > + */
> > +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
> > +					    struct i3c_dev_desc *dev)
> > +{
> > +	int ret;
> > +
> > +	if (WARN_ON(i3c_dev_get_master(dev) != master))
> > +		return -EINVAL;
> > +
> > +	ret = i3c_master_get_i3c_addrs(dev);
>
> [Severity: High]
> This is a pre-existing issue, but does exposing this new API introduce a
> potential NULL pointer dereference?
>
> If a caller manually constructs a virtual I3C device without an OF node
> where dev->boardinfo is NULL, but it has a static_addr, calling this
> function will invoke i3c_master_get_i3c_addrs(). Inside that function,
> if the static address slot is not free:
>
> i3c_master_get_i3c_addrs() {
>     ...
>     status = i3c_bus_get_addr_slot_status(&master->bus,
>                                           dev->info.static_addr);
>     if (status != I3C_ADDR_SLOT_FREE &&
>         dev->info.static_addr != dev->boardinfo->init_dyn_addr)
>         return -EBUSY;
>     ...
> }
>
> Could this dereference dev->boardinfo without checking if it is NULL, leading
> to a kernel panic?
>
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Do not attach the master device itself. */
> > +	if (master->this != dev && master->ops->attach_i3c_dev) {
> > +		ret = master->ops->attach_i3c_dev(dev);
>
> [Severity: High]
> Could this cause an asymmetrical resource leak for unaddressed devices?
>
> The original i3c_master_attach_i3c_dev() function includes a check at the
> beginning to return early if the device has no static or dynamic address:
>
> if (!dev->info.static_addr && !dev->info.dyn_addr)
>     return 0;
>
> This new attach function lacks that check, meaning it invokes the master
> controller's attach_i3c_dev() hook even for unaddressed devices.

Please check it ?

Frank

>
> However, the new i3c_master_direct_detach_i3c_dev_locked() function
> explicitly skips detach for unaddressed devices:
>
> if (!dev->info.static_addr && !dev->info.dyn_addr)
>     return;
>
> Will any resources allocated by the controller driver during the attach
> hook be permanently leaked when the device is detached?
>
> > +		if (ret) {
> > +			i3c_master_put_i3c_addrs(dev);
> > +			return ret;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
>
> [ ... ]
>
> > @@ -3195,34 +3342,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>
> [ ... ]
>
> > +int i3c_master_register_fwnode(struct i3c_master_controller *master,
> > +			       struct device *parent,
> > +			       struct fwnode_handle *fwnode,
> > +			       const struct i3c_master_controller_ops *ops,
> > +			       bool secondary)
> > +{
> > +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
> > +	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> > +	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
> > +	struct device_node *np = NULL;
> > +	struct i2c_dev_boardinfo *i2cbi;
> > +	int ret;
>
> [ ... ]
>
> > +	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> > +	if (ret)
> > +		goto err_put_dev;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does an error here cause
> global IDR corruption?
>
> If i3c_bus_init() fails during idr_alloc(), it returns an error with
> i3cbus->id still set to 0. Taking the err_put_dev path calls put_device() on
> master->dev, which invokes i3c_masterdev_release().
>
> i3c_masterdev_release() unconditionally calls i3c_bus_cleanup(), which runs:
>
> i3c_bus_cleanup() {
>     ...
>     idr_remove(&i3c_bus_idr, i3cbus->id);
>     ...
> }
>
> If i3cbus->id is uninitialized (0), does this mistakenly remove ID 0 from
> the global i3c_bus_idr? If a valid bus was already registered with ID 0, it
> seems it would lose its IDR entry, causing a subsequent bus registration to
> be assigned ID 0 again and triggering sysfs collisions (i3c-0).
>
> > +
> > +	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> > +
> > +	ret = of_populate_i3c_bus(master);
> > +	if (ret)
> > +		goto err_put_dev;
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714092053.2461482-1-lakshay.piplani@nxp.com?part=1
