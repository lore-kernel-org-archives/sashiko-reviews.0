Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09C3191C8
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990317; cv=fail; b=lwOf6TABlOK0Fe09kT08lVxYNHnt6yyyLkPvwOrtSjdqkPSvGi5y5EdpcS1Mn9m5tz/oChIz2wriSEt9IP2ex1oawJKGXDWCMW9oKU8aqskbNfHS0Pr6yXnYao8nKbbd5Jhkzg4cp05TFibLuVUifu2TcXZbgIVhppPfzXr2+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990317; c=relaxed/simple;
	bh=iIYa8J0XkmoeyNISXbpmciHstzXmlViOeZB8e0/Uk4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GRxKC/l89iRAH519mBPsr8YtKVXe1GJmCqYdzYjSZ7YIsNMWTAVvtzUXXOpRNoRkmJP+o0xK5pXbqrKijO6UOLqGDyzTMorouIQwTGxh2DjftyHTD6H4O/KAnqpf18VgZQFLFktLCq0sE1qdXmJJHXEsuSocZyCXilcmvzHq/WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eIMVTmJC; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eIMVTmJC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFTMwgByKfmo2zwyvKYNfcrCyhkjdw54kmvrHu8GUyZt15f7yKnbc22ppwfHJaDsWa1fkjD8o+uusaPsBFxWxL9Ty2lOagaf793FiVRj4uDAqZHVsoBZrkzSF/mIxlj6B4nOitJ39WJDT6h380s/QDW73oCsRk3OMCyLDkRyiZuPGAEYiydGPjtux2Kbv+lcPa0T9F2it/wUB54EZs4EKWPou6sh4G/IdXek/8g6vcpR1YRBZc6kS6ukCnrD0FtyB7QnfhIwYRmilo6xdk2ZwNmadXBtNwYQvpxFRfIQr4qYcDfnBxKI+9pzdlPM1ttOaRweHGCuKGSdfu8CDeNfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu5OS5PXi4MWBspkj/k5ojnWr8etTeWcSlCsQ03Kd0o=;
 b=dAbaQXBhqT/3gbSofkr2iux5UjE5j4G25JhSFFtRillkABpaEXR4MMgDDMI4UnxAS5kgMu7onOPy2tr+EoeQEPlV4XC/+iDAWkBb3Ih8dN8iyGCA5/KtCPW/tRucm0aKMNodf/xeWY3jg0j0B4I/p1v4Q7XSg3ZwykPgzuRldeSG+efoVz912lcCVv0ECDdJMpqqSQQIKkUaXlTmkQ+mksWvtgbNSet8hU9NWKdmkzvB9d38bdERxCq+sM/y2Ab2YKXJj4popzYmeCusGIi/YmIc/Ywg4z0dfqTyAwUakMrA6+ff8rgUVNUsuyBErTrvBEJvjuMYWnbKKmcHNYohvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu5OS5PXi4MWBspkj/k5ojnWr8etTeWcSlCsQ03Kd0o=;
 b=eIMVTmJCrc2fIVmGn9c5d3D32633w/MZOxDolyXgcxvuirufzRI7O7QGu4f4nwUVERFPprJjIQuHdHvYJKZRHwuHHBOnYssNvcIntJs71a/7TUmoKUo0I4+AECgw5k37UW9d4HATJRxD9qSbpff2w4ODlocYvMUT/lV+PLAMM1FGpZDlXb9zZGlbm7/dBMjvgZ/pqXgoazCatmd8QTmIm03CaWoh+oZBqCz7OYeHNG84nOo548lvg5YfJ/mzpS9Uu8Nfh2Y6HXsoCNrc7WIVL89+KuZYuAMkvlo7eE5hLZvzKHNnSK0XQVFhFip2VAcsNnPNwuNvU1Z/bFoxOeWl/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PAXPR04MB9374.eurprd04.prod.outlook.com (2603:10a6:102:2b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:45:11 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:45:11 +0000
Date: Thu, 28 May 2026 20:45:08 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	olteanv@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH phy-next 01/13] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260528174508.bqu6ks4rgkysvgdg@skbuf>
References: <20260528172404.733196-2-vladimir.oltean@nxp.com>
 <20260528174044.EBE8A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528174044.EBE8A1F000E9@smtp.kernel.org>
X-ClientProxiedBy: VI6PEPF000001FB.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::909) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PAXPR04MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d24f0ec-63b6-4606-c6ae-08debce0dde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|19092799006|3023799007|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mwcXF0Ofg/tKbUwj3lqi6z3Hd/QdF7hUi8slHKK43U10z/mpIow9RgK2qwkXELETcTBTv/Ffdjrxg5bpAw1+GYo73c46nhXsvRgBWm8AwjWCBlA57xxv9/41Pnrk7hEDxtCaOu1YV4b5L6PpVtLw7RGa9ndOJrufXJXzq/wSqBEoggitGd318zvE0QXGSpR/00woIxuWPFQ0kkBnM4AF2612LXOEEgmCfkX38o60FzITEj74LnL1mKeQYmmYZqhrVdXHhuAokbVhxtEiQYWeVSIS/FBsNv+PDioWpyg14Qqe5utoMMprgi4bcNhOmkXX2uHDgeYlKXZqEqrH12u4QWdTutTMu+4usscKGBD2FLuLFcXjD861ozY9WKEY7S2jO8voUH/RIKL5AfaKYWAoVq0gDqDOR3nO3YJ3JgUSPIyEypYxap12glIYEM2g9OMiVdp5NgqcaMWlCExfTfprOxG4nxQw3qLBz9NXSaGDITQv2sgvp6zQAJiCr1IXmPaulAKORGQGQ415GMGzx5WhWmsvlOo0HaxJAw9NU0bG2H9ssKwx0HqYA2QKsh/zUqPIzJVOSmu3oO3Ky0eGhRlwx0Fze423Eb/bYsqD+qjiNYmhcGjhPKjYWur9bEY5aZQ+FTwXaskSWm9s/nZBKNrLbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(19092799006)(3023799007)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zeSFYrJVO/1oys7g5q+11aRfW70mPouVQCjB8YHNJH9UZzp/4IrWFpz3iy?=
 =?iso-8859-1?Q?BEDeOQEipUBWu024njCt+pl0o4adsCWr01WOrVh1gUZ6KBam5gsKYXX+Vp?=
 =?iso-8859-1?Q?Uk2JqVVpXHiKpeQx+Otd4crSh7oS8zRgn83xnWZZwjAThZAXXXv0T6no+B?=
 =?iso-8859-1?Q?cA9YVZUyAhE6pJ6G+94SZIXWqbaOO4u3MboZf9hr5iP7dARPDRlrI8mNH6?=
 =?iso-8859-1?Q?kG4wz1arp6vNHWAQB9U8Q7vPdNJXrw9WogTeoo/KhoQ/KbNfaa3kyh6LGT?=
 =?iso-8859-1?Q?muOTF+upDYblPRnNRKPYVG779fxGPCpFps1El/pCERtf6BvGROdxZyVrKS?=
 =?iso-8859-1?Q?GYUD/LpA9Fe1fg9HBiGqQlvqKuyC9toYXV5tBEgoPukbv1QqXg/nJz55KU?=
 =?iso-8859-1?Q?cslwMpUnHsrfm1uzXQZrHw45Eov5TVuocQ5yOEDRaxxcxthbjBxAYlxBDg?=
 =?iso-8859-1?Q?nedxX1qhY+gLGr8D0yz1zvrGmIwYFqNZzDkZn+2miZ8n6Y0lPtE5Z2rLXk?=
 =?iso-8859-1?Q?CZT8PDxmrcvfb6ElzxmW4my6zQa8B/0Pe57Dy/5aIIyLhLEWJqr/rYQ6HV?=
 =?iso-8859-1?Q?9mdF4PEZpUT6lOrWvZh3uN5KG8Yv+ghaWakZoUV74RmQwMbE/N6zfpRMzL?=
 =?iso-8859-1?Q?9UjuTjFMGpgRjsiGmu8VO/zbcTKbojtzEsL+p6ml/xWzrUDfuBBq7Rx5+5?=
 =?iso-8859-1?Q?GRp7O+z/jsm71qpPW82T0ibLFVNeF7Rt51DeK9W4HPFN/TuffEyXK9oqfk?=
 =?iso-8859-1?Q?10TMZRgtgrm30xJ1ROm5Rlu8CtHckps60PcBFfElJzv5kMFIxGCL0ND1gu?=
 =?iso-8859-1?Q?Q10ZEzhnflas1vIYpIjzP/Lyc3UubuPXyOhNLxTH/GLiMfwVhXNQOwt4Ke?=
 =?iso-8859-1?Q?B6zdJHhSGMtgZjPbdGlHbgxaHqaRuTbD+7hNK+PxLGomGW+OZ6N0IF022J?=
 =?iso-8859-1?Q?k2Ji0ZHT7LZ4A07J70cPT634ggC/z8/Ixwu+GJA9WY9tx0tETBV0wts5sg?=
 =?iso-8859-1?Q?PviBjwTbvM0u5XYxpzCa44pbm/d724QLE/jJ+A4UrhF0qND4rGUKI46Xf/?=
 =?iso-8859-1?Q?+tv0/L2+nmzxCINbxPBlL4w3uoTzcusD/NCT9s7HuO5O2zYtUGJ8JQLEJ8?=
 =?iso-8859-1?Q?SzBGrz0LoDSRKch3B6b6vbZA/MRnGAS+6+vFy+tZUKZcifCcQv81e6QBKy?=
 =?iso-8859-1?Q?LXd1PF9s17S1++qQ+EpCbbu2YFJBRbaH4PZuhnUBskadnu9tLWXw8Vo1iv?=
 =?iso-8859-1?Q?1iw774jYJx6MYW0srspEWb8DMCfeqr9ZxfGITohSkTBmNSCQAQsyHtI2me?=
 =?iso-8859-1?Q?PY/7TrtIIl48wRFerpfOdIolXtwLjIO/JTEIu5fvaJ1uwy3l15NKoPK+3K?=
 =?iso-8859-1?Q?F/DYNDbZLByPzUn+1ptORKtpe4zmmOD6GivufoRrngC2OWif3rUSJxCNTV?=
 =?iso-8859-1?Q?NqMxR1D1qHlypXjR7rE5VCrtfS/afyh2I9XOdTR+0qD/JFOSOs2dBwZUC4?=
 =?iso-8859-1?Q?jIdCi51+pCObiSFRGxZMyBo56Z7oSl+jT0bxUK1/CWQkh9mj1jDvX78/XX?=
 =?iso-8859-1?Q?uVRqpOdbs5vp1pM2fkLsYPSuJQtHbtbFxUB98WhP63YDPIA2o4c36X5KaL?=
 =?iso-8859-1?Q?nMNvjhp2slve/h7gBP5Kb/EeiWkAnaGq1k7sLWIOeC8AI+9u6JeO4UYIz3?=
 =?iso-8859-1?Q?V9EqUSB4i4RHE1TRGJwZJL/jc5hAaQBNFYjnl9vd75rqDK0sM7hkXMXba9?=
 =?iso-8859-1?Q?yMhBsvyR9zrb2GwRjbHnYTlMzerAemh7ctl9nOqoPxLPsL6BZBP1JwfeBM?=
 =?iso-8859-1?Q?n4eOV1ICAMRowd7eFrYHSwFn00CsEp82J4adXG2lEswV3ndrYJ2MUzcBkW?=
 =?iso-8859-1?Q?vD?=
X-MS-Exchange-AntiSpam-MessageData-1: +FHPc31bpiBV+escswbv1MO4wfqbfBCLAEg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d24f0ec-63b6-4606-c6ae-08debce0dde9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:45:11.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sb0mCzeIWXCPLgmfXgp+4INSQy8u0AoXHvzCa569zCYs4fWYX0bF7gVTZD6iFE/j0/ut9cHN5YOczHy4Zg/A8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9374

On Thu, May 28, 2026 at 05:40:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Invalid JSON Schema syntax for the `reg` property constraint.
> --
> 
> commit e219405276839837989c30627d109ff39c15e361
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> dt-bindings: phy: lynx-10g: initial document
> 
> This commit adds a new device tree binding schema for the 10G Lynx SerDes.
> It defines the register map constraints and allows flexibility for the
> #phy-cells property.
> 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > new file mode 100644
> > index 0000000000000..993f076bba4e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> [ ... ]
> > patternProperties:
> >   "^phy@[0-7]$":
> >     type: object
> >     description: SerDes lane (single RX/TX differential pair)
> > 
> >     properties:
> >       reg:
> >         minimum: 0
> >         maximum: 7
> 
> [Severity: Low]
> Will this cause a meta-schema validation error during make dt_binding_check?
> 
> The reg property is parsed as an array type by dt-schema. Applying minimum
> and maximum directly to an array property is invalid in JSON Schema, as those
> keywords are only applicable to numeric types.
> 
> Should these constraints be wrapped inside an items list?
> 
> [ ... ]
> > allOf:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - fsl,ls1028a-serdes
> >               - fsl,ls1046a-serdes1
> >               - fsl,ls1046a-serdes2
> >               - fsl,ls1088a-serdes1
> >               - fsl,ls1088a-serdes2
> >     then:
> >       patternProperties:
> >         "^phy@[0-7]$":
> >           properties:
> >             reg:
> >               minimum: 0
> >               maximum: 3
> 
> [Severity: Low]
> Could the same meta-schema validation issue occur here? 
> 
> Since reg is an array, perhaps this constraint would be better enforced by
> rejecting invalid unit addresses in the then clause entirely, for example,
> by setting "^phy@[4-7]$": false?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260528172404.733196-1-vladimir.oltean@nxp.com?part=1

We have the same pattern in fsl,lynx-28g.yaml and it didn't cause schema
validation failures there.
