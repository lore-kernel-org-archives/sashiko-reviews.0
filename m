Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2AA47798C
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487642; cv=fail; b=FknESfpmAo/xAxiFPij/QBwzbWD+FGYKNektgJV9f/m9myiefSb7axS9QSuR5mB9L3oGXLvAlnIZe0p6whvPA1fUCxBBDtY/X6Y3oYsOrQna316SuHv0BK72WpvM4D+edi3uni/cPLsUsH12QiaYHRLiYH7cQL/Gtyp9kNyWNWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487642; c=relaxed/simple;
	bh=nsayEAw9EyjUNYrQ0fYytxbzcfEYpNA3tsog4qV1H+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pIFBYmbmsw6+eFvzxK8+QdGBomfLiOBKfDxRHdrp9LXp35HAJKNXpfFt2AgD+LKiFEmRyKd4HI5AhFPcYEcUnHCB0cg5xag6SoFEtFknbnYO/gwvbGLXzVKmecv1XqwfmXn5znHhMsndYrGYCE8N7wNfmU4tMOIA94uTp3H8L9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iSnEeuTT; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iSnEeuTT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ywa8Ai3NqPPzh68R1wPZrTX05L9KYt+IFxulizfGKfnqVgNF8l4PLK9uag9H0nCXU0ZTA29+QNBRoqu534eIiRTgwTsSrzMdwqiFp5JXvYPEwAEIOhb4X88ucCXoqDxRpwW9jL+VITJmk/2+DS1JbDssnqKKQhP/m7CQj1K/imsV235T1wp/rU16Wn0t5ETO38eE77QNMVSm73zbWfyP/r5WS3KdIKWLmZSdiHVkRGSjG11VVavMmIwzxCPTmoW4JzYGiAKCQsaNqjiHEy5BlOPBDdTh1j6WHneOhQATMc2AqTsQ/DRhOWL0SFoS/5/rWypzht3qO9PEqqKyLCo4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LLqRVhNWdO53pqOQzC0RX5V7NZyoK/3Sll8+Gu5YEI=;
 b=OpOajW5AneTSz6FlJ0fdOJxOpIetnU+51VH31epe8MSUkE7YIzPw6tymKpKYKk0i6r25sFAzDIOwucOY010WyrZ5eBPtzjjXBHOMZ4aV0lGrDawiNyaI6PIa/lv0bI6Iy6ks7yQKiQJCm2wllv03GzCikN5f4/luWAzkdlbjtwaDPzXJLA4O38lMTXCYrgha4z3JS3jcvasPZ0VKYU2VJ2FznPSctmSDH39rCYROZKBmeqCem+AkozPEr43G2sQeLaJspim6rr1SydAveszrHyq0JL7X3mjEX9Bl7V1d/qqgTxjl+aw/7u1ON6JHe1DNotF64q1YrjWYcuC5WMjZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LLqRVhNWdO53pqOQzC0RX5V7NZyoK/3Sll8+Gu5YEI=;
 b=iSnEeuTTxWKHVdtpCfSeMVZYpnEzMe+wNXMr21EiRSyRBDAso+l/bl2+4y7Az4kH8CRtsCHk9LZKZXsUQFmsZqWYnPIpY6ARX+caTAmVh5vasJgR9J5oIo18HwFjv5U+bIqU9cBRH89sGWfMndbcqVeHwtoKs88IWQZ+mV2HP/Qdspq3ad9n51TFs0nO+BtAABJZAt7HfMwiRVwNlfEqhdhjiHcpwst5wEe2EVzmDq33f64fjorFOl+sOfmPBSTG9RhzZKxG/jcunL5T5DZlNW7j4uOGq9pu/Ir1cOGIJJ/nqQZ/dirirxZ8Tpgs9lZsoleGpuezNdCudvpU6fCr+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 3 Jun 2026
 11:53:57 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:53:57 +0000
Date: Wed, 3 Jun 2026 14:53:54 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	robh@kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v2 phy-next 14/15] phy: lynx-10g: new driver
Message-ID: <20260603115354.l356gejs6ysqf4s2@skbuf>
References: <20260529171509.1163787-15-vladimir.oltean@nxp.com>
 <20260529182118.007AC1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529182118.007AC1F00893@smtp.kernel.org>
X-ClientProxiedBy: BE1P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce5c54b-c112-4bf8-10b4-08dec166cb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|10070799003|3023799007|56012099006|22082099003|6133799003|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	GQFOE6P/jGXQi/1U3DC8o4KuHg0D4cKfaIZSQsbddMCKxamhz9vt03NyNEfIX3BeOrnBXLyga1AoVU4taow50qXs9YIC4npdq6Lp30SNTcxIh0nkJNOb/sCzYnzdpLSC0bAyu8Uya5KKCYiBVT1bRIrMgRHC+7pZdz+cKnLwqvMDKCK9Lx7+olmXl3cjnWhhhgNezwhA2Nz+XBby2JuXjwQ05WDuPyT/+zcWJQAH11EBfbrlVf9ii0p25QXs8lts94+8az94Mv2pH7fCo1tRE1SelRd9evh0ktn+CKNGijbemsngdso7G+45vU5Uqtu7PE+hNDrYWkgHL3tK/UxWNYzmcFn2gTNDnvzu1pK+Z96lt8TjnYEpxPsucU7WY8wbqxW38CU4pCvQnc6v/ngcL2Qh8H8NlPsmIOp55JLiUZY03idsD8DjpXUYhFSRK+t2Z8o4iUl/7RwX2Jp2lWzvq5wTn5RcLld0ZvXS0xdonnVBpvzZ4zXIZdt5pY/5GBgsY9CzNtWAAAS9hVDPW0VVed31+ZsW0M0k9WCxQEAY+XIm8Qk064NmucKgHiIOIy9lSmi+lIad1dSj6J+Lfq4ThHy9yqSXwjRTUGqstGyYXQjU8OH6VeY+yAK/W5YE/dcozypUGy+iR3fffLf+IalTX0IcASIAOn9EvsGdKLzeVWb8rLxrrspGVcj8dKKhg7Km
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(10070799003)(3023799007)(56012099006)(22082099003)(6133799003)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yhLpkSwFt3LdXX9t+67SLHe2KEVLxxfWlSSPswtZUl/yzds4FMeFivTVmENM?=
 =?us-ascii?Q?hcQ7JuLQXiKq4pEr3x5qOgwbsHCYhqXXo8808XPReyB9J4jdLEV5xSBbk+G8?=
 =?us-ascii?Q?yXSt21Od5RrNLd61gYmniU5qxq8zfblPWyZrQ11BNxMEcj5LmVUIGJHkqJVi?=
 =?us-ascii?Q?UQnE8fWtohSdW6fgw760JoCFETB7RoTa8rx3qH1m+k03iaTudVmTfJi7xhQ0?=
 =?us-ascii?Q?/E94RbvsikqWlcvVbhfgpSxTOBQnVGpGsKYZDw+rfRtJ18swVt6nyogvj7Me?=
 =?us-ascii?Q?CdM2OZ0BYBfl3DG0pwe0GnqJgmW6XN8s6H676axD8P3hr6HZeBX29U8OFXOQ?=
 =?us-ascii?Q?NohFdaeeLvhiFEDCgM4aKI9lBg+8dlf1LsCaGcjrGsGpOh4BtFwJ8JmFgbnV?=
 =?us-ascii?Q?Qd1aAqu1+r+MSorC2jgUINN4m+oetk4UHGlHsqXDCSs7VGGg3g6KbZIwy8pl?=
 =?us-ascii?Q?8IXlUH2fkVqmrroaU6m3Ur7ppIOUJx4gqFJ6wCp+/xIGPiiing57HyJeJTDS?=
 =?us-ascii?Q?KQaj4kNJ/QJxtv9ogw4hSSmjF7LndjvRHEiCb1oAfH+Th69aFR98O1rlWtit?=
 =?us-ascii?Q?9RS8arGrkq0n01DwKBDEO6n6sP68MxB1v+Jf8prO2OwWN3L2wksmiTLx3rQZ?=
 =?us-ascii?Q?sUSwxSaPFKZGQHAEHyMb3zCl4jgIW0/0/YuwM6PxHk1YnYh93B24Cd9UESGX?=
 =?us-ascii?Q?ia0hU+iZb/XGoc8iFdiQAHQsIrrsYYev1kRJC92o5m1LChqiI399GUYros+P?=
 =?us-ascii?Q?4OmxhUQPUHdU+ancIyUd9t9OwNyGRaqMy5rWfMaMz41rmGs2Emb/O+YZdlLv?=
 =?us-ascii?Q?SQpj//hwiAVahYfmUv88d6nTzxgFkGQti1RPs6ocpDXVzODPVajQU1jfqI0B?=
 =?us-ascii?Q?O92Lu+LgrxtPxj0Pdg36x0JbGPzxbtPqLLpFiCEPT8u78wLqiFGcRR1LPgWh?=
 =?us-ascii?Q?CZF5cCQADvcPgNUS3fzg/eI89ikwaCylL0MllT2bhbAgKSwA3ULdYbuApAkQ?=
 =?us-ascii?Q?8ie5f1CsXy7Zc90pwDCsg7jFKMENxB8bo1bRIN2sYGzridw+6VYB2vzUkP6L?=
 =?us-ascii?Q?w7zbaydJpCP0VOdLjXPNFMDlXU/V8r9BTCJav+kdjY6Jn2A912wSv0eFyPRT?=
 =?us-ascii?Q?aqeJg6mGnYU+i8LNelx7PHjWkVeSls3TQPEGrVE9iyY/4TaLMAaM8iK34ADu?=
 =?us-ascii?Q?uRzp9ZHO8AuzdTnchtfDSsgLEblOMBxvsKbtRg9JgOSUNSU5MSuGKaZJ5x8o?=
 =?us-ascii?Q?ad8y1n7QPAmrZxtZ4X6Aab2iCO2r8iRnG27SVgvhsRL97QIWMSqphSqye8Sb?=
 =?us-ascii?Q?6CSW2nq3C5NEVI1n6gyHNlLr1UPY7PHn4hgPUXKkpvAoo0uyiU5VAgfZWNC1?=
 =?us-ascii?Q?uJBAhJ5sg0XYLUaEaCGzw6Y5ALJZyk4gyIODOoHnlsa3y2M+/x1DM1Vlzq6L?=
 =?us-ascii?Q?N8E6c1lCvid7BIeyPZiCalTb98Fv+SbGmLXecggChvRL6r7G2hCWEqgIy39g?=
 =?us-ascii?Q?SymARavFvc4/IuIQo/WbPWDM1CmXGzKJrywGjhcfH0dFAInBNEBCKyZF1I8c?=
 =?us-ascii?Q?kkQzpG8diu5wcgXffoREUQrRiAtobbfNr1cGgqvxFhRtRnd+en+2rd4QGg5Z?=
 =?us-ascii?Q?114uiyKv4322tLcCkIlYptlg5xXp1LGYvRCQCn9JWeS6uOUn4lEHpqM7pmfA?=
 =?us-ascii?Q?9x8IOLRZ8imPTUxd5u+Ae8TpVhSKXxnMjrlR1jlwEjZgHhe6sQiuY2vAInJp?=
 =?us-ascii?Q?MV5iDtBxOlLwsE+4FSGykToAG98Q5caerXeIQXoc/O1H5+KGmNr4fc22LEW/?=
X-MS-Exchange-AntiSpam-MessageData-1: o5goLjUfQ0rZBd8DdNYtXc6Gba9HeypUJr4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce5c54b-c112-4bf8-10b4-08dec166cb5c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:53:57.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+h0Gxex97KFh5Q1l0GkRgPQ/FAjDKSHAzxrib/Yf3EHxbB8g/sQ9LTphgD2mu/2tIbdoIftwtiRbv6zGFMqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667

On Fri, May 29, 2026 at 06:21:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Incorrect restoration of the PCCR mux configuration because `0` is treated as uninitialized.
> - [High] Potential timing violation when bringing lanes out of reset and power down simultaneously.
> 
> Pre-existing issues:
> - [High] lynx_xlate can return a NULL pointer for unprobed PHY lanes, leading to a NULL pointer dereference in the PHY core framework.
> --
> 
> commit 851e6824db7b03958722b9808f3549609168de99
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-10g: new driver
>     
> Introduce a driver for the networking lanes of the 10G Lynx SerDes
> block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
> SoCs.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> > index 0000000000000..9b04d6a4b825a
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> [ ... ]
> > +static int lynx_10g_lane_enable_pcvt(struct lynx_lane *lane,
> > +				     enum lynx_lane_mode mode)
> > +{
> > +	struct lynx_priv *priv = lane->priv;
> > +	u32 val;
> > +	int err;
> > +
> > +	spin_lock(&priv->pcc_lock);
> [ ... ]
> > +	if (lane->default_pccr[mode]) {
> [Severity: High]
> Can this condition incorrectly fall through to hardcoded defaults if a valid
> mux configuration of 0 is backed up?
> 
> Since default_pccr is zero-initialized by devm_kcalloc(), a backed-up value
> of 0 evaluates to false. This skips the restoration and allows the driver to
> apply hardcoded defaults later, which could permanently reroute the hardware
> lanes and break the network interface.

No it cannot. default_pccr[mode] == 0 is not a valid mux configuration,
it universally means the protocol converter is disabled.

> > +		err = lynx_pccr_write(lane, mode, lane->default_pccr[mode]);
> > +		goto out;
> > +	}
> > +
> > +	val = 0;
> [ ... ]
> > +static int lynx_10g_power_on(struct phy *phy)
> > +{
> > +	struct lynx_lane *lane = phy_get_drvdata(phy);
> > +
> > +	if (lane->powered_up)
> > +		return 0;
> > +
> > +	/* The RM says to wait for at least 120ns between per lane setting have
> > +	 * been changed and the lane being taken out of reset
> > +	 */
> > +	usleep_range(1, 2);
> > +
> > +	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_OFF | LNaGCR0_TRST_OFF,
> > +		      LNaGCR0_RRST | LNaGCR0_TRST |
> > +		      LNaGCR0_RX_PD | LNaGCR0_TX_PD);
> [Severity: High]
> Does this code violate typical PHY hardware sequencing by clearing both the
> power-down bits and digital reset bits simultaneously?
> 
> Releasing the digital reset at the same time as activating the analog
> components doesn't leave time for the analog circuitry to stabilize. The
> prior usleep_range() occurs before power-up is initiated, which might not
> prevent hardware lockups or unreliable behavior on link up.

This is actually a great comment. Re-reading the hardware documentation,
the power up sequence is indeed messed up. Will fix for v3.

> > +
> > +	lane->powered_up = true;
> > +
> > +	return 0;
> > +}
> [ ... ]
> > +static int lynx_10g_probe(struct platform_device *pdev)
> > +{
> > +	return lynx_probe(pdev, of_device_get_match_data(&pdev->dev),
> > +			  &lynx_10g_ops);
> > +}
> [Severity: High]
> This is a pre-existing issue, but does the core PHY framework crash if
> lynx_xlate() returns a NULL pointer for an unprobed PHY lane?
> 
> If a PHY lane is requested via device tree but the driver did not probe it,
> priv->lane[idx].phy will be NULL. If lynx_xlate() returns this NULL pointer,
> the core PHY framework interprets it as a successful retrieval of an optional
> PHY and might attempt to dereference it. Would it be safer to explicitly
> return ERR_PTR(-ENODEV) in lynx_xlate() when the phy pointer is NULL?

Will fix in v3.
