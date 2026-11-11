Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.83.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794416251;
	b=LBao/kQe361P3RMO+XswoOz9oZfvi5A4/DEG7KyDrp8RfCBZrzaDe/4vZFoEDCe9z4fH
	 gZXe4HJkThWhqGNKlA0UVk1INO+hO+SIsuDZXEfX3rcWJOfz+syiYyf6Vsb1I8E+sWQRm
	 V2hNdvZvW1sMjzvQlmV0QGWm/7AU5DMXc1+F9NbKPR2FoYyU+o1rw87l0y25db5g1ooPD
	 2DzwxWHenoEGotJ+vWFVprse7i1gVSfNflGKzpZC9BtvE2UoXNGc+eSobINSWjYGidfBh
	 N3DtSFdntXOrmbjcy+bqH7qKqJrFm4v4oA1SLoduHSTrzNTdZkuBNMGCQpduyrNCwNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=brqOS/clTRitEpyALuwHeBHhjhhnTDcxoDTJiX48ClE=;
	b=nF2msgBNsfvgCOO9NA2NF1F2+Nm++NF/Soz95mWUdSKKC1B4VbedAsqM6Ooer5ecVW3o
	 U/u0fo4wU9Ql9SSNb0Cf+HgQp18Nc9CucYfuuAsIwMupsQTRczqlqwLzxc8C8FsrGH9Qj
	 rf8+d2YxyODrt9IZL+jNlni/er/HRpM3jkN1/OLKMseRf1z8gnZ0VTVfmkb0OLAprsdzR
	 FindHRn+OwpdjhryfbjpDVOkVSCOMbBosmyi2QnLGNqXdgwJzCUN841Bj8M8fScCPrUOy
	 rXFlU5WNgnRsf/8Z3PyjIXLtSBe0NNktqQn5/eB+jQH0L0QaKqlUjvkKkRMcRZ/eQtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OKKjeSHm;
	arc=fail smtp.remote-ip=52.101.83.1
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DB606A33A
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 16:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2DB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OKKjeSHm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vo0F80vKMMATz1eiyM9jee8oDlZGDPDr6WCJyT1QVd+/9Z0Se9dHwAwz6GDo/ru1v6JLno9XAIUQflgKzTbM2cWKIiZ4KFSqitSYJAoQ18zD4FZjd9K927H23SZkMpZbWxgoBiZPbh3Ha+STv6WZGjNQvNfQNDtx4uZRhwpe5Ji9woUMwUAHqPFCEfdM7+Tjk3IYjhmgDmND6JOlt/wQOazRcZ7KLemFrOaTLVQJO5w4HumqXpnw65zxmZA+A+o4udVVVWahcl4C25CaiZUmK2nBUFXzMR3LbvMDF2QC82Opvo1YlrcKw+oQk4XhHIL5Kt1ExevJZ3KIxhjdWGJyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4d49uP51xBBPD9rIIv22pxzKMc3fUsL4oL6P0N4gZM=;
 b=O1z+UjT9JcmSVdLvWxYLtDx3cTtok3Mjpav84LJNigZlhjkp9s04yl32i/DmyRCDoe1XTUrflsPEHbhw30w6O+7xZPcehYLOxE5W8RvmKj+Akvhym34EbkaNUyU9M/OWhMBdvqGYIyBG2YGRNf63R+if4T/c8yXrQu7CLG+qpfy5eRSWtuqTZs/fkcKMghubZksbr0t3TCB5DuvNJqbv4dSLuGNdghh0KI2qfOJ8PBaV2ec3630iik0l2lFXWhy/mqR4fYOAtiDxPtv96Ow9wKNBUaRlCf6NGPo0DkVN1RlPyjckrD4i8nYQwhhZiGkfCr//XHTdQ+ekW9oHQe5P8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4d49uP51xBBPD9rIIv22pxzKMc3fUsL4oL6P0N4gZM=;
 b=OKKjeSHmA2ZpbsOcD9YqyM9TXg4rKk6raL+gGz5ovv66pkmG3mK56pCBuNSQIxrQta6YP9g8hPx1LYVIvlPalrZ0j9kcrC711NiVYYOsE2VtDK4u2yqgKDuD21u8V9q2JMq0r24yey5NPzJuJ9l5YTVm19gammFMgoi2PRjLtT6UWReuc5Yd+yxRnmC7gfZP6/49mFzunS1ELG6DJyDdoIB2Rri4uDRZQseT1A1RmD/i+OrDmNpiQFy8bPEF4WljOivgvECxpLND7X/w+HBkoSwK/znkzDcwRO1xbSp2ayS8MO+rpy+DQ8i2NdjX2eWh4QPo8PjszKv4PgGG0CP4Qw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by WA4PR04MB222900.eurprd04.prod.outlook.com (2603:10a6:1d0:3a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:57:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 16:57:27 +0000
Date: Wed, 11 Nov 2026 11:57:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 6/9] i3c: mipi-i3c-hci: Add support for the AST2700
 I3C controller
Message-ID: <avSecMkz0yAeMQLs@lizhi-Precision-Tower-5810>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-6-4d8fff5c5196@aspeedtech.com>
 <sashiko-outbox-208274@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-208274@kernel.org>
X-ClientProxiedBy: DS7PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|WA4PR04MB222900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfc457f-36ea-459e-f941-08df4014dda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|261026121527099003|11063799006|4143699003|261022105027099003|56012099006|261022075727099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RFIl0u0GWo+CBBcVlsv4C0PDfi08ySqDHfKilwvAlSl1gZUU4HLib/x2a7Lo2TgvWaso2+ldIygJxCsJypKDYdcFiEOeXGOpgo8QrsVkQDznOFJuRR1f7BUdS1R8bHPE9BXC+kLzoaaD07v7gyF4/0H3eJMOLHgSTpfq+vQ7TkWK79S7diIrBSO2TAmXoaTDqDOqtijQWd0ANMx0OpSdjPB/0ORl0pBt05CSPDsIKCpw1dRws4LGAPVfKxfMycBxCST5i/iA1ubmVwm+DlEuffTxAxsXQBQcaDRmzRxflJNX/uOVVz17rak8/uWfE7uopQY4BrXNBHN5fGN2/U1K4rmGWzFuBaQ7hTSp6LNbsEUE0foVBezbqGSd0JU1Zg8TdCyQwUaVIf5EE01sjnrxg6llwwjbuUmITbkDKFkHgfwJVYly9CVhDsnGUKFFYLWPAx/8e2O0E82LZ4rXVax8eX80RNz56Ka5OtxEhkrhZk+d+xYpss4iB/YFTy4WEhBwN0dGkiSIQlILmG6JLQ681gGkBl3Or0H2n8wp4Vux1QJwZlQFJ/319up9qWotts5sp6E2BvlWpxVHqMEf5fmK0INH0Cpu+SdjINSUH3FN/5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(261026121527099003)(11063799006)(4143699003)(261022105027099003)(56012099006)(261022075727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?KYQQ6526v4hYvuy4Y1zXYJUdtNgckOPAj364RCunaLuHzkaiujQtzEcr3n?=
 =?iso-8859-1?Q?dGI/pqHRp//GmuG6RdkzIOFLYNX1Wt7yFnzIxnAjxq+J1woJQ2rCCSXbNC?=
 =?iso-8859-1?Q?A2gzK4EfOtKfDtkpjMNETUTthuJ3G1Dam8CxBiVjpS7QZvc90Zw+yJkGrD?=
 =?iso-8859-1?Q?9xTa8HItdnSNSCkNbWV0l/CZoGv//ZOJvEOv6g5R3nqdX2mfNKW0yKk2iN?=
 =?iso-8859-1?Q?INhUKKbvuT5qLJ0Htvj7ybqwtPrBVUhlYUymdZFPnK+anLSaRitLPwZPVf?=
 =?iso-8859-1?Q?yODiaVroF5Ld2k5GZhvPmCIlLo1+IPv9mwU7hg+eOjWToUyjptkztrS17M?=
 =?iso-8859-1?Q?bMPWm7gVA4hyleRhjK/AVGEcWPrEG7vyt3rYwO+mqPnAaFgeLGx8DonAnM?=
 =?iso-8859-1?Q?N1zbaWT1MuIvMO66sdS8ZJEmkn84iFNYl068kP1hhwFwWeKbZmnb8XucVR?=
 =?iso-8859-1?Q?IKEPLCEyrT7YT43ozW78lr6us2Wro7yi1lHgH1E8nJNkGbzuRHhtgKcfTY?=
 =?iso-8859-1?Q?MFfL6e8lO4sCv4Fycbn7JGKTuxFveJuGECI67ba1FZUQKDQDX92Ug/oVfI?=
 =?iso-8859-1?Q?e74xojseM5YSt6AtzAzec3DXj25V7hKX7HKtWWZBwNUnjo9cjOZPcfjzJI?=
 =?iso-8859-1?Q?TgCM6iTDu3ArnnS+OylU25zNrenjyzaKe/tV3Z5AYJYshWyJJkbjh3YySp?=
 =?iso-8859-1?Q?+KVvVmXNcseLS3bHu/4Vixa9ew6cshbZ8nQ0RT0u8Na3DnrDV3adA/DD7n?=
 =?iso-8859-1?Q?pQOMD9nleHZYhsssfNbb7Fva1tgK8aOdvYIfM4zuRgkpeMCUuVbWgMIkOV?=
 =?iso-8859-1?Q?Q6OH/WzXA/EswhPnTF5hootpE0bhk2Y0+0DbyOl5bsMOxbKbhsZrOP3LSx?=
 =?iso-8859-1?Q?rSLhFsVMwvmQfllTsdEMMDAn6LIXVWP9IE6oyrK7wiNmr4XOI7EK0BYYWp?=
 =?iso-8859-1?Q?VJ03yTsrg5wmoR4siDyjHFobHZIkA35n/giwF+LagzLUbepuPb7oeu28iX?=
 =?iso-8859-1?Q?X6I5HG5G5Z/zxcuMSZ29B3rP7wb2bEgei40nSwOwe1PbixrTxpHlNm4JPd?=
 =?iso-8859-1?Q?zxovMGstsw7zwjtrZILhM/ZKssM65FDtwb7e2wqJHXC8OHP8xt1nvohZJH?=
 =?iso-8859-1?Q?KIb+cLY9cpK9Tgojq8NqNMfx0LnMiOQPJa2C5gHlBiMSKMR296aIIbCiwy?=
 =?iso-8859-1?Q?m/jOgcp1pZJ4XRilK98TrdrObn1/JyynRYAX9ZytZzPIo3IWRscxOQ13su?=
 =?iso-8859-1?Q?D+pUSO8jqLBHZOAUB5iBqZxieMwkF79kihsRTZ0QFUB3Lwe9R4bQIctSOt?=
 =?iso-8859-1?Q?QSOV1oHJ9kWH9872fkAFtvFDU1dTj+cZoCpBj2DrjbwCduaisTRyK9IPJR?=
 =?iso-8859-1?Q?2KzjT93nH8NVirO/7ckdb9Qj7yO9ONOvcF4JkjMoH7BqXub2degU5Jc0Zn?=
 =?iso-8859-1?Q?O+UEAPXSR+MO9w87iUbQeC7WHlIKNAHVciUSL7c1yqmz8oH7APthYufrF5?=
 =?iso-8859-1?Q?zE9kogACZxzLaCnRllll3U0wGxts/bxd3Shx3DflGjRzEnJi+j2YVZrUc/?=
 =?iso-8859-1?Q?tgpLRHx79Fl1iLKjrDuSQdwfTeuwf5hkZGh+4fCbtFZSBDpM3sTnH7mi8B?=
 =?iso-8859-1?Q?FDc00WvTyxkKt/za8iNJi/Pp83+gMGy2RS0up2pFJ6WorrTkI8M+XW16iS?=
 =?iso-8859-1?Q?yiLo6uYL4lsEvVXZ2DPoXdjNkhUuBZzsciBovEUi7o3a4lvHoerVHBItzS?=
 =?iso-8859-1?Q?Nu7v5LTktThi3tJSxUiHBeoKLJaXHAp90/I7x3SuZXZWANnzZ42yBU1H64?=
 =?iso-8859-1?Q?zmvpxtU3QDPfL1QA6Iadc2ymkSi84+4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfc457f-36ea-459e-f941-08df4014dda0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:57:27.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ/8waOxscHWShYDWZaUyWKHnbjTHgZ6ksN+zQVOkUtHAceqLgtCHroXKs9TzxwBvqASYCPtA5Za1cov67PuEwQjH7ztEgqXGWahIi/B4Q+mQ/T+fcMTcAR8ZSWjPbUv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB222900

On Wed, Nov 11, 2026 at 04:22:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] i3c: mipi-i3c-hci: NULL deref and missing offset check in
>   hci_extcap_vendor_ASPEED()
> - [Medium] i3c: mipi-i3c-hci: ACK_L programmed with hcnt instead of lcnt
>   in aspeed_i3c_phy_init()
> --
>
> commit adcbd5aae214cefb55e76d2928d998852108ffaf
> Author: Billy Tsai <billy_tsai@aspeedtech.com>
>
> i3c: mipi-i3c-hci: Add support for the AST2700 I3C controller
>
> This commit adds vendor capability parsing, resource management, interrupt
> summary handling, PHY timing setup, and DAA index configuration for the
> ASPEED AST2700 I3C controller.
>
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.c b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
> > new file mode 100644
> > index 0000000000000..3aa910e786f8e
> > --- /dev/null
> > +++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
> > @@ -0,0 +1,351 @@
>
> [ ... ]
>
> > +int hci_extcap_vendor_ASPEED(struct i3c_hci *hci, void __iomem *base)
> > +{
> > +	struct aspeed_i3c_vendor_data *vd = to_aspeed_vendor_data(hci);
> > +
> > +	vd->inhouse_regs = hci->base_regs + readl(base + 0x04);
> > +	vd->phy_regs = hci->base_regs + readl(base + 0x08);
> > +
> > +	return 0;
> > +}
> > +
> > +bool aspeed_i3c_vendor_cap_found(struct i3c_hci *hci)
> > +{
> > +	struct aspeed_i3c_vendor_data *vd = to_aspeed_vendor_data(hci);
> > +
> > +	return vd->inhouse_regs && vd->phy_regs;
> > +}
>
> [Severity: Medium]
> Can hci_extcap_vendor_ASPEED() dereference a NULL vd pointer or populate
> non-NULL register pointers from zero offsets?
>
> EXT_CAP_VENDOR(ASPEED, 0xc0, 0x08) is registered unconditionally in
> vendor_ext_caps[], whereas hci->vendor_data is only allocated in
> i3c_hci_probe() when HCI_QUIRK_VENDOR_RESOURCES is set.  If an ASPEED
> controller is bound without HCI_QUIRK_VENDOR_RESOURCES (for example via the
> generic "mipi-i3c-hci" compatible), i3c_hci_parse_ext_caps() calls
> hci_extcap_vendor_ASPEED() with hci->vendor_data == NULL and crashes.
> Similarly, the other four vendor quirks (HCI_QUIRK_VENDOR_BUS_SETUP,
> HCI_QUIRK_BOARD_PHY_TIMINGS, HCI_QUIRK_VENDOR_INTR_SUMMARY, and
> HCI_QUIRK_VENDOR_DAA_INDEX) dereference hci->vendor_data without checking
> that HCI_QUIRK_VENDOR_RESOURCES allocated it or verified
> aspeed_i3c_vendor_cap_found().

Please check this one

Frank

>
> In addition, unlike the section parsers in i3c_hci_init() that check
> "offset ? hci->base_regs + offset : NULL", hci_extcap_vendor_ASPEED() adds
> readl(base + 0x04) and readl(base + 0x08) directly to hci->base_regs.  A
> zero offset in either register yields hci->base_regs rather than NULL, so
> aspeed_i3c_vendor_cap_found() returns true and later vendor or PHY writes
> overwrite the core HCI registers at hci->base_regs.
>
> [ ... ]
>
> > +	hcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_SCL_H_NS, period_ns);
> > +	lcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_SCL_L_NS, period_ns);
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL1,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL1_SCL_H, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_PHY_I2C_FM_CTRL1_SCL_L, lcnt));
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL2,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_H, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_L, hcnt));
> > +
> > +	hcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_HD_DAT_NS, period_ns);
> > +	lcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FM_AHD_DAT_NS, period_ns);
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FM_CTRL3,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL3_HD_DAT, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FM_CTRL3_AHD_DAT, lcnt));
> > +
> > +	hcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_CAS_NS, period_ns);
> > +	lcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SU_STO_NS, period_ns);
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL0,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL0_CAS, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL0_SU_STO, lcnt));
> > +
> > +	hcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SCL_H_NS, period_ns);
> > +	lcnt = aspeed_i3c_ns_to_cnt(ASPEED_I3C_PHY_I2C_FMP_SCL_L_NS, period_ns);
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL1,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL1_SCL_H, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL1_SCL_L, lcnt));
> > +	aspeed_i3c_phy_write(hci, ASPEED_I3C_PHY_I2C_FMP_CTRL2,
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_H, hcnt) |
> > +			     FIELD_PREP(ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_L, hcnt));
>
> [Severity: Medium]
> Should ASPEED_I3C_PHY_I2C_FM_CTRL2_ACK_L and
> ASPEED_I3C_PHY_I2C_FMP_CTRL2_ACK_L be programmed with lcnt instead of hcnt,
> matching ASPEED_I3C_PHY_I3C_OD_CTRL2_ACK_L further down?  Passing hcnt sets
> the I2C ACK SCL low period to 1130 ns in Fast Mode (below the 1300 ns I2C
> minimum tLOW) and 380 ns in Fast Mode Plus (below the 500 ns minimum).
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com?part=6
