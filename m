Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA53ABD8C;
	Mon,  6 Jul 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354267; cv=fail; b=Xbl2jq4srLRT5LdMxNvJoU7nYAFS5kzOHnDzM9jg+Zjo8Db8ON+KeNRZk9d99k9gqSHjp77dA4kFh/wjTsJuoOAHDiyjf++xtImsxZXfIbFJReOkePO6oMpI3XxlWFmI1V3Q+zpzTDydsIFc6dIPLmxG9YR7oWh4L/kClXoXW6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354267; c=relaxed/simple;
	bh=ffhrStA65xB5BJcLhVDlMkE9SlRwgBLOHmwJ+oY9l5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E7kkObH0fe6BdkkHlSlNHFZCMMkZiu7XL2I8swgXTH4UdWGyU9P+cyuG7XJ165km7bIJgtU2YSAfOM9AUjR/PbszZco8F4DkG8S4Vt8ImubIpu3tZdipx6wIMRuMasxXjmvuzN4r5wXCW+QQyhh3GF1D7kzCZrN46A/NLkSPEkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=co5c9lOl reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="co5c9lOl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfkhGAAUa+AfL4kH1ROVSpTahuEVUpPaO/pSJaXhtblB9WcJjIxbNs3X20Q/3LnK+BH0ifClDH+XUkJ2UbzOmWlhqFe3Kj3t9kO0TdwcPVhlMyKt+gqKp0iWk8+ktT5P/KqfiV9s6SeiBlYfF4u0DKjtOOOyJYLmdA3BdmY6mgGeS48MW4IUxQWe2cIyNqGEU42vZpKGZezUGio33E6iaaxgPceXvhhLxYWyMqcVyjwpmHqZZlW0bWp22wpxtZgYtcdiyDQeKMkdMcunHwvg0P2VP6vX3GQWT+M4kdaaltafvlRdqG9yo5qbydTL7+reeV8N3zJ45cG+M+5LaJUXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaxbOvQd+U0sFUApSWHiatjrBNlLOhQfBX/EwL17Iag=;
 b=oowM0dHnx1cZQEmYCWOMJ4+fFCmG9O8+NKvRN+JDeo5Q1H5kC7DYjhKAxtb04HSxOiepRYLikvNVNopOVaqrhKJxeshzptlu3nSvgLV+Lvx8zq9dY43cdIWcL1FT0c6tEZnVZS1iLOCqH9yjn6TJ2X6U7PvHAFObimwxOZPHPDuHySxMQERhfPLRiXUJr3FEJO00W2wPcqHs5mpQKAN5Vd41gkLySKxOS1b7yvjU2bRbOhzG8dLfv2T6bFkISXVe2Bm5nbuwh38K5lCS0bFYzq9D2G00zd/BNhfRRBufhZ8Do5VDV9rZ4yUz7DxCrkvyYVFKpaWGal/cPFwvo7yo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaxbOvQd+U0sFUApSWHiatjrBNlLOhQfBX/EwL17Iag=;
 b=co5c9lOlWE7luOqrBvHFF/1crfakyJvTKrNM9LBEGOsLcl8cdkhermKBBxUR21bnDua99ZnzioT9QpWNKYlShvLrqhj17JmEwEU4siE8GkcocIa8kZ3yMPVqWtHjq9xz0mwaW1iqBc6QiUtxbPX/ql9vYpIKmFeSVPXegtV1OUakPp9wEdCYxCqcx1dzEiAArQT3qQ8ClmvHJ5nFOM+w2mnVAsB47ZzhnWWm1eNcOg+LY80k95BjWemg0WPKxyLCLAfG+K0kPii0gVDRxV4UyBLz9AVILhsodiG4Lp+7mOgtZUT05+G1BoBaCnN7pNY32vDjftunBKD71z4/cPcaHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 16:10:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 16:10:58 +0000
Date: Mon, 6 Jul 2026 12:10:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <akvTizjmx2dMSYBi@lizhi-Precision-Tower-5810>
References: <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
 <15795907.O9o76ZdvQC@steina-w>
 <akUsE6A6lX0mgM5g@SMW015318>
 <7985027.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7985027.31r3eYUQgx@steina-w>
X-ClientProxiedBy: SA1PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4824e6e0-937c-45e1-075f-08dedb792a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BpCcWSqg8xUpr2ClhU9rVXz3w7mIbgqFm7SnqX9bdHJWSxI+8Ybybg3tMJcgTTiPPo4uVK0FS2I0lGOHF6EQ3Iwjx78lnR5QPjd9Wity7luE8pi212uByvTS8OY2OeagT+7S8wOQNqJpI/d1CEz77zLJa7bZbXzWRKSdSdL9VmlyzHN4txe7GSAGxB9UbPPG69yDQi7pTTq/aMbuKbrdc1s8zvZhx1EXIJ0q1kMmipQFhv4zFSSJc8v8CAN5IFKzc574UDI6/GB0cPC0YTfE+Eza8F+uszlteMIRJ5C1XjcgJbk59rdul6NG+kmct5zByxje9trPnsrs8QLdoT6B9niQ8oanqxXZ4NAv8yxUPD+vTFu0F4Gn7krJG5NGqAMNSuAyV+X4vPjX5XYyjaJ5/qtUtja3h+W9YjPYTjmZigmuuWc5yih6dhBcbv4D1zAzxOXonnIGqw5hslg5IU3t5mJCIj5tyBNOb7DF4m1MRkSV0zduW5dTNyz7hZQlAi50sLLMD0tzLlaTE5IJVso1sd0c3Qr4ncZaYbiz901uA5DEPZtKjhibKF+Ok7PbeV3/Bu0G3ezyxLFX/G4U3mfCnH+5h+O7b5SpDgyUwzv3ZPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8MnFKQvGXFjaV3Pv0zY4S+b8BucE63mjTbiW5VDP18Palco75h3d+cruTw?=
 =?iso-8859-1?Q?EV0Ci6IAqpAZY22xfN2zlQbjdp60K97Dx8UkfRcx2tr3GzHnPC69QV6YI+?=
 =?iso-8859-1?Q?PmvlSSGvTspo7Cw6YJM2OZQHELCHEJvga6ZgwR6Vd/salBnjaj4IXu8TJ5?=
 =?iso-8859-1?Q?x8BCE1Lh5kq+uyfy+kxcMTl5JefEQY+fYofAYxffcjQ/Lc63Nczy6A/mty?=
 =?iso-8859-1?Q?xjJKsqqx72+ZZnnY5inQm/Cs9QIok8oxAcNP26ar/ce2WdRpafy7ELo/V2?=
 =?iso-8859-1?Q?B1cQkZmI8RgEASRgpOoHh+C8TB7tjuYAp3EMMVBJVeGyEFV6pJXJpeT3l+?=
 =?iso-8859-1?Q?wcNZmqPp2gm4o6QJNp2y0nwRxmHwnd1FwgI2cNKDdiB0YWvNCZMSMCJcTD?=
 =?iso-8859-1?Q?jjr+i21ZZFopAmH4/gYzyGNeN24DxrPSsKYK0nQFH6bvybuWPdCXDBJmXH?=
 =?iso-8859-1?Q?zHfrodWCkwY9cn4d6Ic4ZpFRVTq7SL+OQjljZN29qEwl8u8qnRrkzdqtji?=
 =?iso-8859-1?Q?fI9r2FboFlep9BOsfU0AESkpd1sSjG27B8lO/mMxNgq8Cg3I+f8fZPiQot?=
 =?iso-8859-1?Q?hfD3RSGg1oODhA6Han+jSXJlefRQgQrze8YjGV+S4d4g+IRiz1VfkaQZ/T?=
 =?iso-8859-1?Q?e50Lcyn9pu2+nWaAcAABEKj6/JheZyJEyoZooqL0fnaAZqH18z7G+v2pcn?=
 =?iso-8859-1?Q?oMx4EfkwR2Of9fNdFf0mh6zfQJqN+V3oAle5sPBOLXUoXr14EINWSw2q2j?=
 =?iso-8859-1?Q?7ZFEObF50HsGIRZWj5cmHG4caA3kDrqBUKynmQTZg/6+Iu+TQ2qE0DlRNX?=
 =?iso-8859-1?Q?NmNzAKNzNnktp0r+lD+5YPoZ+cD8he2Otv+f9z1sXmHaffsT8eiV5TOKG3?=
 =?iso-8859-1?Q?kkTU4xx7SaZJ4tlatWvPN7Rr7RqeefbsdGJFw6uKfOH2qJgV+iqY+B/i44?=
 =?iso-8859-1?Q?20eKXSWI8iQsYA2OWC0BS6TOXr3PyETf32TPL5NsjWUjOsFoCRmQRoqDPP?=
 =?iso-8859-1?Q?W2uQFcWUw7dkBR2kJGpkm58JGNH7hJKoBPTlnAPu+H26dG9HtRkI39XVM5?=
 =?iso-8859-1?Q?8OA7ivl23l05lCkswIYP5iBL4LGU3YkJpMN4QphWREsZmHSR/SjjuDO7zm?=
 =?iso-8859-1?Q?wJUDY7CAONIqx8Fb64wdGPRb4V3IVFMwZRxErt/sqHlqO7r83qxP/RA4wh?=
 =?iso-8859-1?Q?PcWwQXu8+nhqWKgC12zc/ReQSby0Vu3nlICTqLb5m2ywJH/5F8VjhKJ6G9?=
 =?iso-8859-1?Q?ayzCgPK8NAp+eFPwBc0/uLuPVx2JazXYwO0r4WZxpmK7IKvKmbNym7TsNK?=
 =?iso-8859-1?Q?u88y2vAf9whw/rox2tpd+UnpzdHC3KSrmRxCjmktCigyxvOhTLbxTM4GZ6?=
 =?iso-8859-1?Q?XnwIwmTU5lGHZj+a53sn7sUaLA7twmjWFXaEznrh8q/W1tJuNtjTWp4EvF?=
 =?iso-8859-1?Q?gxONiYvWf9wXO1UwjcAGmYYczVr9lOv0zrV+Ln+nJrmBaSo62NKt4bCoyg?=
 =?iso-8859-1?Q?DxOla5oVC9OtdvyC47OiC6nYLw3FCPNRIV0bSGkOhvBgER5voNO9DJ7Zji?=
 =?iso-8859-1?Q?BDlTaVc0499edZpKX9FNpNwqAsb8wRtsRepQapSSi1j6i//Xh6KhA98e75?=
 =?iso-8859-1?Q?IyZBpS12ik1DdhBJf/xX8q90PfnuMKHY/Mcf/Iz4IlnnjY3VqmrzxlbkFe?=
 =?iso-8859-1?Q?2wv0m6etByOcOJYiKzFril81K6WZWqYMnXEMsQi9F6f1KlEd0sJ22Ud73j?=
 =?iso-8859-1?Q?zkikbegxVk+6cMR1on/0TTNY2Ezstbe4nJWfiSOgfCm+0Q4Zz/m1xtcoFG?=
 =?iso-8859-1?Q?bsveIdQ6cL12hxJa2l8rLdT6Ru6i/d2tJEVaLv2YUkt4xhp4GvUg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4824e6e0-937c-45e1-075f-08dedb792a17
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:10:58.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0y2MDGi+Dn+jXckLoPyrBI9rePp8GKeyIICxcAJ2c0W2nwXbsWEmbbFuTdef0nEomdYGCJv1TaYNkzRTuHhJyV/UisLpLlmnDlkHMjIWRzvw+qAyBRG1dUffev2IjRlA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

On Wed, Jul 01, 2026 at 05:37:33PM +0200, Alexander Stein wrote:
> Hi, Frank,
>
> Am Mittwoch, 1. Juli 2026, 17:02:43 CEST schrieb Frank Li:
> > On Wed, Jul 01, 2026 at 10:50:11AM +0200, Alexander Stein wrote:
> > > Hi,
> > >
> > > here some comments about the findings.
> > >
> > > Am Mittwoch, 1. Juli 2026, 10:45:22 CEST schrieb sashiko-bot@kernel.org:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > - [High] Hardware components (PWM fan and 10G SFP) remain permanently unpowered due to disabled regulators
> > > > - [Low] Dead code: Unreferenced `pinctrl_ethphy0` node
> > > > --
> > > >
> > > > commit f54617810555494fd6b435aa3ac070a14b264e01
> > > > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > > >
> > > > arm64: dts: add tqma9596la-mba95xxca
> > > >
> > > > This adds support for TQMa95xxLA modules, designed to be soldered
> > > > on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> > > > design. Enable the external accessible PCIe controllers as host, add
> > > > clocking and reset GPIO.
> > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > > > new file mode 100644
> > > > > index 0000000000000..e90f37bbdcd80
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > >
> > ...
> > > >
> > > > > +	pinctrl_ethphy0: ethphy0grp {
> > > > > +		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT9		0x1100>;
> > > > > +	};
> > > >
> > > > [Severity: Low]
> > > > Is this pinctrl group missing a reference?
> > > >
> > > > It defines pin configuration for the ethphy0 IRQ pin, but doesn't seem to be
> > > > referenced by the ethphy0 node (e.g., via pinctrl-0) or any other node.
> > >
> > > This pad is connected to gpio1 which is under control of the system manager,
> > > so Cortex-A55 (Linux) has no access to it.
> >
> > If not one refer it, it will never be set to GPIO at all.
>
> At on Linux side. But this pad is owned by System manager (SM) and will be
> set and used there exclusively.

But leave ethphy0grp here, if no reference to pinctrl_ethphy0, nothing
happen at all.  It will be the same as without it at all.

Frank

>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
