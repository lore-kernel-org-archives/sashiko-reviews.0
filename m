Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795792366;
	b=GtTd1YecXkQMHSRG/6e+N2d1PttAbzwYp0J2G8Uqm/3pFjIBpYBAEKsaVmcR4vwbL7TC
	 kR7CTW8tUSzdAjtiNAe2dDQdeNQeZZ9WP95ozDGhrrAgB4FsFEXjfu7clFtyodNI2lu8w
	 /DLh8KKyeddhT967gS8o9vgmsYVUfQK3emtbKqIy0TIldvR7a/h31fbntD9258VuyXgj0
	 9a8J3OQrrJAwGHoJN9UjQlpgCIC4+9rtluTySQw34/MgeIHMRYeg78R3ZKKpVxbnMrBcL
	 NBCf59PkJohWlKxdqAmFzA+qPrfV3I5B3SC6u6V+6jWkG0Nmtl5o1leB1dQ41qGfnww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792366;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tOAwPJSfuflnBO57oFzChLi0EMQJ6Yf8/ZXjl9fF2d4=;
	b=gVh/QlEU+bJNk+jWCcsWa2j8JwavEaZyXsvsDSbvrHG9OMgi4VzB1RtZuAchI68oO66p
	 YaglvOe3edib1Ou+dcQWgeN+KvEeir5HWsOTPkvp07N99B9mszaqu02fRcZJtvSsgrlub
	 o941Ls51Un94F7tMYIzhAHhw5o1nqJGr9LJeaAoq/jq/Jt6WwEHrmxG+Y7DQTCLqQ+AHQ
	 geNzk1CFEABNodVRYn800khlfhLI4pngPsZ66KJpWps5gz1FMEoqhXO0q3rbkN444AQur
	 BOsliVnRPg6TYArOzxJBOa4AZpFOpFlpgIVpPLGl9KRrIyWRMuuM1/mrI4p+RvQvGyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UcU4PxSN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569F606A321;
	Fri, 27 Nov 2026 15:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2569F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UcU4PxSN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9GB5anrPjUIAb6dJCMpXnHwc/Tc+Y2J5glld35rvfzzF5kD5Cj8cDPtyiyJf4/JGqfBtR/Ccp4TnOGxspQ8k47YJ/jtKhxJhGye5LoErIq2FhHn4dg6oEpO+cg2F/NjMhzcZ/VGtB6f4oNsXTLY9+lxZCP4CUUAh/TE5lcOgSqzuKua/pVV1PA+UlC+SwoXgcsBhRvXgnvrNl8vvRXhAMSqhAUDwF0SCEIUe1Y2luAD6id4boJ0XpGDMa0NdII1HMe3BBtl8t5LPguqnvNH0q1viwSUWPj+rJZx8ADWM6rVhKajDcIur0QwaVuT1xR6AO1avCUuEFDmzqlJI3iGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOAwPJSfuflnBO57oFzChLi0EMQJ6Yf8/ZXjl9fF2d4=;
 b=Sh763aKC0uNJ4vmU+IOlA3VZxabbnM7HxBU8unVS/Mb7Digtc4btaUGsP/D/x4fmbjNlGp/KNwTKLL24YrUmTzRC6qIHfmVnMOPSERjlWmbmVc0aWhpAvwcAkOEa5zvZBMgZMo2AHVu50jEndYO2tGeDamwl7d1tgzIsip0g0IKC9scbskxEbDJazikaiCHbfvGHndI2XrlB8x6Ke1tlRqzN0sajF3kR+1R4pvQQP7Ty1FUldOWhRKOL05SN8G/1x/PvQi6FeWBV1GMX/CbLVxq73J4uhjoMBKStJTUpXcqLO8Ejr9j0sqBA86Dl9olkCe1QupPMEE13vkN6kpZHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOAwPJSfuflnBO57oFzChLi0EMQJ6Yf8/ZXjl9fF2d4=;
 b=UcU4PxSNlKGgrlvF9XanMg/tfMnqh3yNgfOh3lg+OghrFtkz27YlxI+gAvdv+PmTi6LDouw1Xs8WY8di6xEboZez8N9ymH7oPYiVREj7EnQz3CHiWIXyYzuyi8gUtKzZ0oYOtzRhVMnBUCvuIjg8xovzOKmhanJfduDcFpqUTxTTfPridpTOtwttHIgCW5mpyVqsbZbUiC+CaxKLKHkx9G/QEhN3j31SKOJS+YbS+3poSmEXQhM34kbyDi4vvLYB0/dTQyhHoBE1uihD+OkQTjNc28hZY4nTeOib0ase9z3QcMb7BIEZdKt3q2CmpTTDgLFV+5PmsuNea4uqHpbKww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9737.eurprd04.prod.outlook.com (2603:10a6:800:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 15:12:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:12:40 +0000
Date: Fri, 27 Nov 2026 09:12:28 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-mek: configure ENET0 pad compensation
 for fec1
Message-ID: <awmd3BRC6KZIV-E6@SMW015318>
References: <20261127135237.2153934-1-daniel.baluta@nxp.com>
 <sashiko-outbox-237525@kernel.org>
 <d693bd71-f83d-4b6c-9257-3c4033ade261@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d693bd71-f83d-4b6c-9257-3c4033ade261@oss.nxp.com>
X-ClientProxiedBy: PH8PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: a3666a8e-668b-4615-8757-08df4c98e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|6133799003|18002099003|261009223027099003|22082099003|3023799007|261102123227099003|10067099003|4143699003|56012099006|261022105027099003|261022075727099003|261026140227099003|261021121427099003|261028144727099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	r2N1/FaZBXlDejhXzjfNQL6lu0KSi1tKTdI6uHBHlsc0tyAGfplzhmS68bHidLZ0O0vq/fJFAl4GVon2Hwaj8pwzf/dfQ99ots+2ULmIKNZouaCkReW1f6u1Xqe5/1aQVfyAXl8YiOUhpBs72JSeW7XiLwwtVoo3s/DToeQW95Oln2GDvFUYAv87DwVYTJRjbn0eTmByO/F+duklWCJ5btNj4RJCmNVTRBYh6RfYXcztnd8rnv6aqcoLcdaXK9T0UUV4Uw6GC9pIeJb2XahcM8IymZUy5ZShmikNhMVPnYSKb6s6vbvLGt2BV2Eyk9Ybn/3+qozoegs8OmTVd7l+zpaJ+UEU5DyCdwHmRS0eogkLI0Wq2RAB1ZztssS4qv3qLX0b64a8bmei3fjK6mRdtdmYxPvbXnrS1tdgT1zCiaIMO7NyTxIjKKS5c876+0IyqJ0JJJmX2U9tTE7bM0/bXc03aB6uCEAOIrPSiOXAsTiQ497aEhv99fZDKkJQsJEG4iGukxV1q9F6qfYPVf44gJpehgs85EWfg/5cKYmcEdo9Do3+NpKeQBjWGmQDMOWCHSo86U6yT5kSTxQn8x8XaM9He2N2LBuzPOH8wlvx5owH+te47OV9OeLS8KHv0qmhoOe2BNnVfAEkikqFG550Cb5JSmZ70wkpbzN9dekd8Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(261009223027099003)(22082099003)(3023799007)(261102123227099003)(10067099003)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261021121427099003)(261028144727099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?egndA9/BMUOLpFEuxyrdZE9tR3Er1RzaSjjelKye5pA6ox3j+288lBlZYL+/?=
 =?us-ascii?Q?2FhQNM6qbol+mhXC2ZibdX/ZnDF6+PEFMovk0p1q0cbWNutxl3369I4mZKqh?=
 =?us-ascii?Q?iujHCJDexdVK4aIgYerb0WaL4OS1wqJHWT8YexXbXcTXHsp/f4xVssVHjRDJ?=
 =?us-ascii?Q?U4EItmdgj3ObA4FY9hGUIuxh4gQfy9xtASR4eM76KWsY8g6XUWJhowvSh3nr?=
 =?us-ascii?Q?7jVU4dkwFAnqYYB6xaEs/IbMA1STTRqGyPuEBvQv1DUEA/KFFD6bKbLdU5rh?=
 =?us-ascii?Q?w8Wxp6RooUqbzfBmrStydPCsxNN814XCnpdr3Amps00rgNjRTgLkcikGRbxq?=
 =?us-ascii?Q?9gS7qEsJC0SVFd22V1tQdfWZYm/Gg0o8dwEMEL9S1O/AE2gYhA5lQfuclX/p?=
 =?us-ascii?Q?rcMtVQndw+WuOfAu/L8hizgLoSiluWeYvjIh29YDkjsTsluJiswROelgFN+y?=
 =?us-ascii?Q?b18t4b9bTw+ET6Snfxcjm8jnooB8PeiuZjpbLjFuzu3of7zefvV8P05iKhpG?=
 =?us-ascii?Q?FUfb2lZGUI588Cg6yg1tvKE6fsBzLeiwlHGJGrqMF9zUfHmyvZOvJ1ftV91L?=
 =?us-ascii?Q?B3af5lnjngC4JMtnRCZJgXc3d2IsQ165+tg54U+wGXTQ7tVaZEb7Zq5GxoFl?=
 =?us-ascii?Q?BWr5M9lDeoIXVyXpEEPZAwwLlMfUUQZbQCTvOTBz09Jl1XooZSTzShvG+vO6?=
 =?us-ascii?Q?vLcVf90ZAFSYuZX3q4q5QlhGUzLUPI2X8v7c8wOAom+HtLO8SnbtFMbMCTJp?=
 =?us-ascii?Q?fQH4N93aKQ8ODLYCYIdSI4Nu7TsEpZWzF6kc9tJHFa8x3kLADy24SzLPRWjM?=
 =?us-ascii?Q?Cd4pePCDnDvMFmq5Kz5LyPvZ6NpWIi/CmMQHeCmGi46yrVwSyDx9I9psgNjY?=
 =?us-ascii?Q?VqKVqAWEsmQnGE4l77VHsX5bh0BNTzBksqimhRvHOtqmj3ImXHWUbPCGB8HH?=
 =?us-ascii?Q?crHCoGPqw790Et+t0hXUcPUMtY+qaNK9Iii992FVcyf6fypqoaxlhpOQyziE?=
 =?us-ascii?Q?C1xowDyiVwroWGZnGvup0d3OKvA3x/9ToX6IIe/W/1em3QtpQBEVXGYs0LyP?=
 =?us-ascii?Q?FQ+08QmbELYd7GRDpvOeGnvidBmDAHyuBeTeodLFelTCMWFlljeGgFotDn/Z?=
 =?us-ascii?Q?po+9D5mHgVojwgKZGpn5xD7g/eoFyv8o+Va6wz+b8AzPMq+I/0pOoTtBtX2M?=
 =?us-ascii?Q?lz89PFSmKJL8Se6dBl1UAFai2pBPgX3InQ2aqfoOexfAhD0e8vY+29zvPQG4?=
 =?us-ascii?Q?U9KJhy7duWozGzEWcx87fmPYoislj7eBNN7ORDHAbhmLYokDai54AGEHyW7T?=
 =?us-ascii?Q?hiXU7l3HQX1WTwPaC/GH2Bwb80GF3mDR1kr9NFxjSSH2YwqwIJUE39Sc71AH?=
 =?us-ascii?Q?3KaMU3fv4LCrYZOQ3gp4v6wzlNG1WEEtbUDzJRUvZ99cjGeiaVDzwah/+jjz?=
 =?us-ascii?Q?ir85mT2q1R2cyaYC8FZ21NAY7KLbdyUcbdRrUWnwhZ4BwOxvU7wk0g296hFf?=
 =?us-ascii?Q?NOlsUwzz/p/TgP35U+ZeqadQUjLJZQfydFaTBEnAuXNyb21jBHCTWW+05kAa?=
 =?us-ascii?Q?jN8Q/hRic3MSVjX9WT2cRPYxSLKJ3kIqhqkoycOfw4wpfELOymBznMvKwUhm?=
 =?us-ascii?Q?RrFETznkVIYK8L86FZ3ONDUGK2wTV7ny8Fa3sOalgF/jK3zGdJqUeID06mnE?=
 =?us-ascii?Q?gZDiuv3YNTl2GjIbELL6Ty6Bnf46SrWaBWN/MPdX9l/KOXBVjJEXon2khMn6?=
 =?us-ascii?Q?3TYcpVqgfnxRtfQ5C01kiuL8T1ju7XHLbBfZEjTpi7r0en97Nmdz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3666a8e-668b-4615-8757-08df4c98e0db
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:12:40.3324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0C913sxgklyD3fXpUNJpGlfgvpr0ZWEf3Jv4arl8+Ybg/EWBylfwqmCK3CQHYLgA4vn3eraT5qioaYQ6yr1GSagMmOV3gbT+Ap9CUps5qcJmxjA7mxp5V7kv7x8bLeA7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9737

On Fri, Nov 27, 2026 at 05:05:55PM +0200, Daniel Baluta wrote:
> On 11/27/26 15:56, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] arm64: dts: imx8qm-mek: missing Fixes trailer for fec1 pad
> >   compensation fix
> > --
>
> Frank should we really add a fixes tag to this? fec1 works today because
> we get a working pad configuration from uboot and it was never a problem.
>
> This patch only makes the configuration explicit and aligns it with fec2.

Needn't fix tag for this case.

Frank

>
> >
> > commit 16a1be06255fa85636ee660e513ea61881c625f2
> > Author: Fugang Duan <fugang.duan@nxp.com>
> >
> >> arm64: dts: imx8qm-mek: configure ENET0 pad compensation for fec1
> >>
> >> The i.MX8QM ENET0 pads used by fec1 support 1.8V or 3.3V operation,
> >> and their compensation control pad (COMP_CTL_GPIO_1V8_3V3_ENET_ENETB)
> >> must match the I/O supply. For 1.8V or 3.3V the datasheet requires
> >> PSW_OVR = 0 and COMP = 0b000.
> >>
> >> The fec1 pinctrl group never configures this pad, so its state depends
> >> on the boot firmware. fec2 already sets the equivalent ENETA pad to
> >> 0x000014a0, which programs COMP = 0b000 with no override bits set.
> >>
> >> On the MEK, the ENET0 pads are supplied from VCC_ENET0_1V8, so use the
> >> same value for fec1 to configure the pad group explicitly.
> >>
> >> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> >> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > [Severity: Low]
> > This fixes a missing pad configuration in pinctrl_fec1.  Should this
> > include:
> >
> >   Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
> >
>
>
