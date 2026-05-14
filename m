Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721337BE89
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755660; cv=fail; b=fDpdooO9c0JIy3x4uZ/qmAqyVHsCzYuF1EWLWY88Jf5IlCbDXJ4XrvdzOKpW3oFeYUdRV2njIi+lWeodzdUjcsNVqfA07dPwHfT98IWXJ0Io4xz5FJ8bM2KSl7XapxRMeXYeI7AaOJ1wY8ZHbHBob0gH4AIMmZ94IGUZ4h+TaOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755660; c=relaxed/simple;
	bh=3FTUlOAo5rVm/AlsGpZf7568T01R3hftPd02r/jdrjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QkBw6xtxiNr0a7CMf2GYeWH+z48+6bfVre+k9pd2PayzNanf/M/fsMoi/LFlxHmqD8vuMgk/BG0M2++LdYqFLOkom/b9a4kuJE6OrQPaOXp0vd8rukzF4sixvbsb1RAqDU6Pjxj3mZbxqXX4D4zgUO3w/tZ742m0/EDRuCozdb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GYMs2PiF; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GYMs2PiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxRHio0KYBVcwlz4m6yySWy4rZMOwfE1tVTsjW7jgOjOCTPt9UTXcMJL+q7jdtTBXV7dJu+mBMg5SghnHZzEjEXVGeH7mOXvW3rtWqJ/IFEe+92kpIV108602w6ygpp4CnaU20bXxClBvR4/E9aM4W8vGzXobdYSKMNHZgXWieXJjOgsgMAQUXcgv4tN7nQYYMjXA0+8oEU2qftpfKyTe47oVyHkfrQaHFqtmuBODWvq+tQkf+VQerGVKAPAX4BLWQyLEYz1UIUOlYZAK13VLiJsdBA6hBuMg48xjJ0sYXWr8M1D6BJjiVVE9P0hEnG+c7IgKdg5yGxwkeJOVMp7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/q93aQzpnyrKyYcOwWMXiqo0D+j8mPGooacq6cSdGs=;
 b=j8HysPlNi1yMv2NPtLD4fjTDsX5+GD0clBnKf+Pazap92hdEZK7W9tWbgCLD01DGJACBzlfG8WCW2J19n8epxEr1h9gdbYp0gSSA/wqC11+zmcLSxAhtnoOVjTZYxICKfzy/H+n7RTJh3jWnRKz7s93Ef1mwV5+YJS9uDrRa6izoqXBvxE/Nj2VrOtNDZe/zsqVrZYdndNA3BDi0ffHQVam6YNRdLBlUWsM8J4QldbxxZhuATnYkE//nb4fBMkq1OfloCB20alq8vuX//xn8qx4VNpKk5fwDOoYc0ebGbJMB1wLC7jQBYW/Z1i/u/xPn+shyhmOvIc9lmSpCaeoY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/q93aQzpnyrKyYcOwWMXiqo0D+j8mPGooacq6cSdGs=;
 b=GYMs2PiFRyQtChNHTKq5hcw1+2Sj7yA4M6GpX7y/jkKvL0b81vq9XjeYMuFOOCkmMVK080XdErzu7RL+zmxtokdMQOa5LHu1aTunuO66GKXExy06eLLoyQlYRsALpa/2PTh7nDuPT/IUoJpI2qy/HNdDf3yvA2L9nOsYvnihAU4T6/K+GWDuYxtye09KZkbXvglyRxka3olJDzP37iOneEFxuMZotDHIwTD6flOqP3c58xHxGKkvgwOIb82PBYFpgdydu2CB83SVQFXt3oOCmeIaZDNJwSFrq65B5DwNTLaFLYCGtnpsCU7FJRz36JlSGBvWikJzxnvhBzxZNHFQYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by VI1PR04MB9931.eurprd04.prod.outlook.com (2603:10a6:800:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 10:47:35 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 10:47:35 +0000
Date: Thu, 14 May 2026 13:47:31 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH phy-next 2/2] phy: ti: add PHY driver for TI DS125DF111
 Dual-Channel Retimer
Message-ID: <rvkq5fnqythnnh6jbitkw24whblqc7domwpxnyxv7hz7mwp34e@ofh7mt6tfdip>
References: <20260513185103.1371809-3-ioana.ciornei@nxp.com>
 <20260514103143.4B33BC2BCB8@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514103143.4B33BC2BCB8@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|VI1PR04MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: cae3efaa-1b6e-4f42-0a75-08deb1a6353a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|4143699003|18002099003|22082099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	3P+9G6gw/joa28UpSYRur2oJU6J2HFMudsEFSvCvCDrghUy9Oa8AlPAYH6gLd8Dw/FicF/HnibYKI0gyn3PzniuXgqnOkL3dh39HZV5V+7meZPZSsKN9Ll5oKkG/FC9gPNKPkLF78R1DUjY33HhryEeRhNf2263GZrfts84nXiWPH9rcFzkvP4Ui7STKZCAjTVG2P8xwDdu+SkECHPLeuSZVh2CCcT8Hp5jCLqZs4CRb7cYjkpuI5AcC54y/i91THdQKtipblUPxXTnO+1JkoOfyz4AgHx21MXTE9PzBBZoB0pvAfmk9c7CsRgCgfWRzLqX5DrRR4Zo8KCyigVo8TI61n2McSsS8kTuhML8NOWGKc2SjjkMnEynqHIIf/azdyxhYOixaFn8SR2B6oPB/fRZVB5t0hAvA0AfYKxWKfGCcHRf+/1uFJhvk3vvsZMopa+cFaM1lsCdC/Otqw+2UeIUR/vTXwD3e0jGXL1NYrA0xh6px+WbLGoywE0Njet+C/+EaqR2PMTbRfqftWgqDRelkJk87AsRvoLgFSr/QDbHyTLA7/+rkM2WfaJ7mhg0AIN1roN1p4MktmTdcSfhlsBE7oSYmt/H+i2vYhmSV0mOXU7rTc1Z8hli9JmTV9Ur5si8SIZKhTpa2tmPGkdWgsry+F5EN7xM2WNoLrcZLUpQmCGQZ8L0H7II/GDvy6jvu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(4143699003)(18002099003)(22082099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XTjoQsIWCo9X/N5Pgu47xIbnNU43xsvOFcSiy+0+cVHrWoDk0/GtmsyNTyG0?=
 =?us-ascii?Q?3cl9OCARXSWBNNuDEA4hEz7GIwr3Yj++5M5e8KEQ+T4g2for9gBqE3R08Yih?=
 =?us-ascii?Q?E12MmH3TAjr7A+Kx/Cp1lywT1D3ZMWauc7ZZvr2U82WGeIxOSfVZ7bDdldzG?=
 =?us-ascii?Q?S0U0SZFpwmhPr4EP8B42YWzPhHFA6GP5PaTEvOs10AtFI7nAD2iCrMwGTNxm?=
 =?us-ascii?Q?ok8+9mw3yc8O6RHl3aSddQYfq5V7ao0JxaoKc+d0pc6SJ+4gS7Y7tGKN3Vn7?=
 =?us-ascii?Q?rctiju/RU8TPMIlb6YqhA4a8Uw2BVSJbgcOMNU0VH/5gyW8MDMKpz4wrOJVG?=
 =?us-ascii?Q?cZvx/KevPfM6FmA+AJ9bVj7wuvgyeybQl3C7b9QVPmZ8Fpb9WNuVxR2PJObl?=
 =?us-ascii?Q?ue7FjD1IO5f0HuuRIpDNPu+QqeGP1/5KsQAZpjpbbBy9O91lHdSdAQKqp4pD?=
 =?us-ascii?Q?/o+Qs6tE0a8tyFkliQyIGnC4/RGmNr+JaYe29msH91rjgTLacKk7MtJ92bhY?=
 =?us-ascii?Q?DCKP+onKxpK2lcXlEy7cbKWT9yGS6ngPd78JbB8FUJBnoyWTe0J9vRrNSXjD?=
 =?us-ascii?Q?ccCWOmWxvwTX8dDacF4n5yUSBqYK1vcS1cH+BChEeUwp7Ffnm/smG8OSkbEw?=
 =?us-ascii?Q?75HtnVqYB0egBSMTmLzFHpNNEstPvctXpaNvhQLPwDoBbm62gOggo7gp0TWD?=
 =?us-ascii?Q?ESyDk3TnWMeGF53xcSeN8pw8ozlHYScdwfWHothwTz+rnqBFZvZ89xZRTFfA?=
 =?us-ascii?Q?OaSyWAYbxiRribwMtnQTjAWWcukZJVV0D/lnWNXAwTivOs7C1j3hflKpD38z?=
 =?us-ascii?Q?Y525kyIl6V4c/wxzPH+iQjwMEpQplc4BLjLAvceYngOSubQMZ/+EvGFaD7kS?=
 =?us-ascii?Q?FG5BqJ5WL9J0vW9kMkaPhwybRPhYYA7/LRWclKHuJ/3v/TeJEPCs7YoWQHgv?=
 =?us-ascii?Q?3NI3w3fB6l9SphNB0DkDBbyR8fdC16PMds4KTtTK1alp8BiOckp2Av3gsDoK?=
 =?us-ascii?Q?stcUW0ca6XCcZiG9vLxF/CH63xbVTvVLh3Ad2VXsbbMBGjK5/tdP9xhink52?=
 =?us-ascii?Q?n8+UZGpyoIBT5rEg/ib+LUbebl/3X/P95+b+eCfwnqe3D60utAKsWz8YRa64?=
 =?us-ascii?Q?FvHacq55Nc18IMBtIXVzAyfLS92lDz1wEMCFPV1FOYTFx3vPKVsHFmgrfCjm?=
 =?us-ascii?Q?pdvDe1uMIdpP53UoJ684cMHlQeYtbZy78odnXK8KaD21cfwBdJove567VpnR?=
 =?us-ascii?Q?2LLc+pvkNXDjnpbRhrzGJ7+zEVW+ngW54w9InnavDydXo97DpwkvJ6wDdSEp?=
 =?us-ascii?Q?+MU2lA+N6yNHZ8+/Vxd2SDeVeg408DJP7ojfjfaiHRNO1/haooGrmyiILIZ8?=
 =?us-ascii?Q?7m0WoX++0eWilWxqBEffTGNw3BsHDPymNC5Q5ao/OoV4dig98d0vBMy7SszW?=
 =?us-ascii?Q?83btVWsvwaC+62HXtlXfDC5MkgwNdUf/ZfZfQNtP6UF5q8cAKF/ilK2dGsCp?=
 =?us-ascii?Q?qn/0J127QYxp2Kwi9K/LJsUm8cCcImKZZxkiHXtW9KITi6OgtxXGTZcUUSbL?=
 =?us-ascii?Q?GlnHLwd6ZwRkdnLey5csiKA0cAZAhPK4wKdjhLpKqTD2C5plTUNGtwZrUSwQ?=
 =?us-ascii?Q?fJ9UK4IuNGRUTvqzIlbgFI00E1lCjD+bEI2TmV0dC8lj3KLU/yN+JzWfIR65?=
 =?us-ascii?Q?sfiqZ3t/D/u9VGv5HJOGWyfS8klZ8nhxfWTdWYlAGIyEBmJ6lz4/loBZHme0?=
 =?us-ascii?Q?xBzKtjCBrQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae3efaa-1b6e-4f42-0a75-08deb1a6353a
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:47:35.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKiGY0Wltguu+l7rPbAKaL4MZuT0Qc7xQl+7KU9O4KkVLf53ebt/ymxuE1odb7kL3C8ucKHHDYs1YwehHDbDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9931

On Thu, May 14, 2026 at 10:31:42AM +0000, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Uninitialized memory read in `ds125df111_xlate` due to missing `args_count` validation.
> - [Low] Missing explicit header inclusions for macros and memory allocation functions.
> --
> 
> commit a5dcf247e2e2a6b752d667ac46227925aa476def
> Author: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> phy: ti: add PHY driver for TI DS125DF111 Dual-Channel Retimer
> 
> This commit adds a generic PHY driver for the TI DS125DF111 Multi-Protocol
> Dual-Channel Retimer over I2C. It currently supports 10G and 1G link speeds,
> and registers a separate PHY device for each of the two channels to allow
> independent configuration.
> 
> > diff --git a/drivers/phy/ti/phy-ds125df111.c b/drivers/phy/ti/phy-ds125df111.c
> > new file mode 100644
> > index 0000000000000..8ac10c603bf70
> > --- /dev/null
> > +++ b/drivers/phy/ti/phy-ds125df111.c
> > @@ -0,0 +1,245 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright 2026 NXP */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> 
> This isn't a bug, but should this include linux/bitfield.h, linux/bits.h,
> and linux/slab.h?
> 
> The driver uses FIELD_PREP(), GENMASK(), and devm_kzalloc(), but relies on
> implicit inclusions for these headers. Explicitly including them can help
> prevent build breakages if the include chains are refactored in the future.

Ok, sure. Will fix in v2.

> 
> [ ... ]
> 
> > +static struct phy *ds125df111_xlate(struct device *dev,
> > +                                 const struct of_phandle_args *args)
> > +{
> > +     struct ds125df111_priv *priv = dev_get_drvdata(dev);
> > +     u32 idx = args->args[0];
> 
> Is it possible to read uninitialized memory here?
> 
> If a consumer's Device Tree reference incorrectly configures #phy-cells = <0>,
> of_parse_phandle_with_args() sets args->args_count to 0 and leaves the
> args array unmodified.
> 
> Since the of_phandle_args structure is often allocated on the stack, for
> example in _of_phy_get(), evaluating args->args[0] without verifying that
> args->args_count >= 1 could result in evaluating stack garbage against the
> maximum channel count.

Good point. Will verify the args_count.
