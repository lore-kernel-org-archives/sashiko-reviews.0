Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E82DF126;
	Thu, 27 Aug 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846089; cv=fail; b=ixEtWUEHUewnwQX9rN9tIBJCkG9xICPpHenWG9g5BQ5/VeNETe/TqZo5pdica0sKd4N4hDjv6CGAjmDkFw9dXxenfuBZwx26srynKm8kRA9tYlY/vaaLka7J3XGjUN0dnwBmRt+/sIBr3uVrFBFzlwvvqOrLTfMwgmoPuo71WZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846089; c=relaxed/simple;
	bh=UbstB8AtPeEQduBtP1K4ImuEVtVacE/P2CpESkXtDbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j78Ys6ae4Pd1P31yWD52CkhqVTMBwhcW1q5hBVsiwwyHmxUMboP5ZpMSAI5SOyZ3KgVfn9l4qsDHwJmLL0VKi6HLRR7KXrEJ3025IARHZ1cjDO9TYbzflgDbrWU3fCmNj+3tjbZKOV7oMotRQeP08MN/72shXBhZ9NiPCQL2qDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lbvx32wh reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lbvx32wh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMwQotmSWAwZAZiHXZQwsM7MEWuktjXUK87hYbFnuwqPJ1UFViAvAaj7q+pUb9TM+oVdrH1LO8mv0FgrAtUGcDShfNSFyY46Lnp5hHQDLkoQGIkcFKK55Kr6lifVuu+P9t2exsJlueCAweMWOUjxPcUdqQXUMHsDQXk51IssjKB3kLQwMEgRminqVQFuucQmVIGdrWOxS791Jd0ZyLyG/OAij1ah7HOlyOzoJdwbLEfs533KybUfEaGV5gk8jfYnSLjmhLRCjysM/kcn1+X30+u3YuCVZvFQUK6gxHM8t7mO8Wh70jAiTtTmpS8QlwaA8lr/6tX+ZBRoB2c0sDyw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t54iGCttFWbhDNNwyj61i1OnqmlzWGpOly6xghMNE7k=;
 b=ypQeY4XjUWuqsKH+fnm3jmOHxtD2vOqFy/H3TyZcqrRS9vRduEXfkAaC5dJyKWbefr6b80ROFtznfMz+a1v/J5sXeaAA2yHaWMHDDVBZ3uVZ45uBIy6httoqcNIy9Mu4ACeKzk5l/GWtQIZ7Cv6tY4wllzxkOHzxnJCs3n3+M/P+Dge0iQyXmtUaJvgRnwR0kqQBU+s7sl2FDRSxkd0BhOpUrzb3SXCUg+ie39rDjIKFSIY2l/aQl4tLq11O66ikfB410TS3JAgHJmThr/9UJ/saKt9qfB/nWA1z34YxtPymtWtOj7du0Q79etuDqWvu8+qpLdZLIglv55xTaapJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t54iGCttFWbhDNNwyj61i1OnqmlzWGpOly6xghMNE7k=;
 b=lbvx32whDT7FOTX0WJqjQ7LteN2b4Dr5TUhY3ly38xXFhZpShuP/bXMWpLGVHf+DdfmFe1+geRXqJ1NnlHszovbrI3q5GjOdbp5Gx4Bw06q2IaTckC/JIhRYdYOoRM5NWvCELO7W4kDZz8ncSOcesOKTZUdl9FbQS6+VFHVnOQ56zNxfUFDzNd4N6xLeDlfpmFqbrJCbIUru5+A1NE37ZB/UIO2UdA/DteQIFkYIBaRzaK3pVu4tVMyPN2LQ+7b2Zaw3k+Vn6szAfMh7Dw7BMzw7wVlvCvTTQruW9D6R1L8gPB9sDj2MylCvh3tEwscg8VMvhemQbcO8njCw7UMoTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR02MB8173.eurprd04.prod.outlook.com (2603:10a6:102:23f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 15:54:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:54:42 +0000
Date: Thu, 27 Aug 2026 10:54:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
Message-ID: <apBdulE2q97HWScJ@SMW015318>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
 <20260827150657.1657-3-laurentiumihalcea111@gmail.com>
 <20260827151549.8815F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827151549.8815F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:806:d3::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR02MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: beb004c3-e8ae-46d6-160f-08df04538248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XXeu3S5qSGekznMx4qNmj6CB4twHjGvCaXxHBd+npVcQU/TCZvxucOibQU8SGjftomKxteMBQ6NKYvq+btBj/mJJBPDE+TYnaGwXk6bwFCmR/NIGOLxactCrhKwURQz1D4/kwx/cphpPNdoPNE3Uf2v0K1obFcqw6ESETZJMMMds1YEOohTrg3e9p0cUkYI9kXBu1A/oWwVO4HoeeeyYH1tcnqOp2aAaW4omoF4QcEnh9AEfXMKHDS/I7M+y4fbpLEd7k/ACl9ckbSI+b6GyOaljDsmahp0Q1j3sN28D7aI91VPMXsbQgBvD1wGHHyEcE4+Ny/p6sA3H5wM+YRCNljlpMXLDZNgUrnDrWIEPskcgiUZBl1ZhotYpFbyatcRFSNtge3g6Pbq4ORt4qCwNhp2ZgflSyS0Mrb5rQ2EENacpa1BO5yD+2/wfbZ+pFm0qQPf+BiDM8lFrbUI32sLgKePO9kVt5IdZmp5awFo+V0BHYpf+MURiVntKNMw9XcVb0yalRhZLyS+bkbyyxRSuLg6sZuCnK2dDeMivbHQF7n43b+kGXf0gNpfqHFTjf8st/2GM3YBiCru8ZUXxSqf5jUYYXkUGy2Lb7Fu4Cpq0A1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Jfuus0IQOjeqpmlMp7+rmNHzAfnK6kOgUmyBWlKvfpTiZVu08CA178Yexs?=
 =?iso-8859-1?Q?D0H+7fcoXjHTHve9FV3aovADNw2buJ1UIIQWzaT1r6DiMaSqtWODM1SMwh?=
 =?iso-8859-1?Q?sZyL6cJS7i/3NEBoesd14435zxE0LKWDFj5UBrk6L0Ndkb2tVltHZzGDnx?=
 =?iso-8859-1?Q?eoQZES5jc3cx5HIB3UHKV1BloW3KGjaKL9B6QYVZ6po4wd+/I+mvfuc8iw?=
 =?iso-8859-1?Q?Q7BkUdr1zgaOgrKBUyreSdWKtX1LNXA2TO6OOfawYfa2LWj1BuWNNVsr1Q?=
 =?iso-8859-1?Q?qMUcaT7yQdQA3KlVxaj3t98nkkpOWajQfg8awkr1ji1HfHTnl+la2FXCHL?=
 =?iso-8859-1?Q?x+4fc2MLZIEq/uFSBXbxoPJjSmNMRkaBKfle+fyBphOj5hMoo30IYlmJ8u?=
 =?iso-8859-1?Q?mBxAiKWJjR/pY8xrXnft7BNGVNQtYVD5MnRLkpvNmMKqsjm6K3uKRbfKWC?=
 =?iso-8859-1?Q?IQMw6gg3T7z50t19Vlceu9yodZBGaYY13sWiSBcFIB2JYDeLnKPN/7Wvzw?=
 =?iso-8859-1?Q?Rk3CYijpV+D1IR9zHxSKi2uPrxhDz2otx4SdSvngi91rjqJkj+BA/33okx?=
 =?iso-8859-1?Q?DIeHCHS5ZIq3UjNDxZQ0DpMTAJvAFyWrV5fPPJrLHPlKxFssKxwjUMkIXa?=
 =?iso-8859-1?Q?1zZk7jyrXdKe2quPiyju8DB+1WjYHDN+KDBFvKRwthzS9QzRMpfqXzpAAP?=
 =?iso-8859-1?Q?fF8Juj57zB9faKU9b0FxL7jCwgankkpRbKwuFaBkrJ3N3g8I6F3DNbfPy1?=
 =?iso-8859-1?Q?f+uuoepVL8vXIviVriITvZvt/4qAOhnDphTHUZzU7B5uJ2EQ3rKBhn5+B0?=
 =?iso-8859-1?Q?Z7mzO1ZJiomIix44V6k8+L43Zm6Opl7YXVLjhQbyS2sxKlz8DSOqdFAUiD?=
 =?iso-8859-1?Q?8AUFax1Rsxp25Y9ExMRSVGS0n2xuVkiFwR2f3+CM4Gs+PVOfuEZkHmNqf7?=
 =?iso-8859-1?Q?ohxl4UZw6+5OgN3Gv6YPH8xA8nLBqHQuhQILLTiKTwSp51PkZjQ8jYNHFO?=
 =?iso-8859-1?Q?BKwlS0ESGl06/i7+WKULJH3GN5DuvY5JulVYRBHfzo6ymFMrq5LI+tPcn1?=
 =?iso-8859-1?Q?axp0Cf1Y4BS+sUT67QJaNKZEssYjYkJCmZD925te17qGB7ABdyCYJ6b6P4?=
 =?iso-8859-1?Q?mcX/sauauaj+K0Hcqt5Sa/r6gAwQ3a1dKSD/MT1BzlhaqyCGN8GkNPwfHN?=
 =?iso-8859-1?Q?ylOQetc2hKYfTQ9rFU0vxL09C/q774mQsDCsMsOjbDG7VV59/qgi/xfHO3?=
 =?iso-8859-1?Q?U+CtZ6jXxqiz1MJLd2LkXEKQS7h6po0eLuaSGJJnHX9JrFJ0c6FqyMxsUT?=
 =?iso-8859-1?Q?F3tsWiREzJHCR+Z5l5RacEpjqv46LlCcmc7ui4yyd7ePHXIVwo/xSEBTEw?=
 =?iso-8859-1?Q?sZQeJgBijMNDvti07DmUsTDQouhvawAIiqIyw9BKqw+Xwc29xTO0vEHzMe?=
 =?iso-8859-1?Q?A5RyT56O1CaLlZ+J9LmyutGkjoTdzBN1coj6qgwsf7rDhTliiMhPtd6YNs?=
 =?iso-8859-1?Q?iXCxQNB22UyFWHCjdvN9c139giaOfZ5KN5a/d1ZP/Lnl2HNGneXZ4KJKQq?=
 =?iso-8859-1?Q?1sjDP105+rxXkC1htZA1CoryzAhBuKbkQfpmmhuJg/vBUXX8CN3SysT6FV?=
 =?iso-8859-1?Q?/fikmdlg2rXUgLR8JByevHYPBwygkT2pX6yNv7JTwrdxSfVBjQ2giwk101?=
 =?iso-8859-1?Q?GCeA6dkp8SQNYgF679J/JQIEGoaWjXXW3FReSBE1rk4eJTHviWpVnVVHG3?=
 =?iso-8859-1?Q?HCtx7tPr8tGMw8zgHmUA5heKJZuTl+uo9fSQBIk8rrLKlOjElYwfk9cGfB?=
 =?iso-8859-1?Q?EXK51CPMdWgMhpb0FzUlNloZ986KA6ERWTyPU43dJx8io+3WHEMN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb004c3-e8ae-46d6-160f-08df04538248
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:54:42.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aymJYV9Sm5hI/mT1sXKCXCS4Fy4T9JKEquNIUwG1/MNGgerdPjjIqWYKDE4IL4xI5IAH0F4Ux0rFqXQWsEDtQoKvJYZ6jSwY0ewo4GpSS/z6MMaGXnJaMMepx/Uby10a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8173

On Thu, Aug 27, 2026 at 03:15:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing USB configuration despite commit message claims.
> - [Low] Usage of deprecated 'gpio' property in fixed-regulator
> --
>
> commit 5ca41dda85cf11b2d0c2fcf857ba3ebeca18e3d8
> Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> arm64: dts: freescale: add MR-NAVQ95 basic board support
>
> Add basic support for NXP's MR-NAVQ95 board. This includes features like 64GB
> eMMC, up to 16GB LPDDR5, USB and RJ45 ports.
>
> >     * based on i.MX95 19x19 SoC
> >     * 64GB eMMC
> >     * up to 16GB of LPDDR5 memory
> >     * 1 x USB 2.0 TypeC
> >     * 1 x USB 3.0 TypeC
> >     * 1 x RJ45 port with RTL8211 PHY
>
> [Severity: Medium]
> The commit message explicitly lists '1 x USB 2.0 TypeC' and '1 x USB 3.0
> TypeC' as hardware features of the board, but the device tree does not appear
> to enable any USB controllers (like &usb2, &usb3) or define Type-C connectors.
>
> Are these nodes missing from the device tree, or should the commit message be
> updated to reflect the current level of implementation?
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> > new file mode 100644
> > index 0000000000000..7458e77dc2ae5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
> [ ... ]
> > +	reg_usdhc2_vmmc: regulator-usdhc2 {
> > +		compatible = "regulator-fixed";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> > +		regulator-name = "VDD_SD2_3V3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Could this use the plural "gpios" property instead? While the singular "gpio"
> is still parsed by the gpiolib fallback logic, it is deprecated for new
> devicetree submissions.

Yes, now prefer "s" version. please fix it.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260827150657.1657-1-laurentiumihalcea111@gmail.com?part=2
