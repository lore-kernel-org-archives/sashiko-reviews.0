Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A917A2EA;
	Thu, 11 Jun 2026 01:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143142; cv=fail; b=B9/Whvqq8NQCLtZOCkKqFbvxVw6mqGiGf+K8CwsO2i3FkPFwA2PHDjARg4uqzcwhTekmngegUQAwY82cONnMhlS0DKAEaBzYdJUMvxeXj3geAb3EzxYfLPN0YAmyXdi9NSJGKlv9VGoUiY2g5L4SwAJyTMk1bGtPSsbyYCkDwsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143142; c=relaxed/simple;
	bh=ICFIf7GK3GaJ8WBC2iSs0Nj5//0D//t8WYs4Qom2UmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oisaOjIh4YjgaSik0/52GrZdIDXD3fwBy5JuVlH6jRlfQhzzG0seBg5uh8Y0ct+DSIwDcc/kOSR0gRNHVN8PE8iJ0ZrYFpA/GiLDBUSk0t3sAJp9RyrHxhWtAVz6x6NGiHe2jOi5X2HiINndv0172tgo2Ogbgg5iVG2QaTnoh7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iRaTKV+B reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iRaTKV+B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3wNZxpxgsh7dJ6PC2g6yK8mi2wnMVx8VGbDjNarYFMcJP1Ieq4IWrvfDIotAn47dMiLvrrG7il2Fqe5a3PVF6rRzNIbSRpO+1a6tuyagUJkWSwFJGSPsG2+lW72CXpINf0b+oOBEeNh+tja8CCDhJxy0yt2+SIeKTBJ2aI41uVl2jcB04gItwOzc3JlbwBIaW8aCv8MclwbKXwEYPognhA7U084Ghc+CDSSKCSV5KB/qtpSJww0H61CQ2Exws/OqFZzqEQU5tqvDw8mgc0YTCx913jEhL2ONmFZWrFeqW7v3E2qIa1lwvw7505AQDu0hdb8iwbBeB6unjpk3yMyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJpcYCTmKM0FLRSMw0a6WThVzQObEqUImx6x7F2UywA=;
 b=d+rEzG9LtxEd6VcMVxF7LXW8rP/qEZTxRQ1b2TAzDNoZIDwPv9LefP1HWlCqPbDcIFQwqhz8weFMswMpxI/sRJO6TNlYgtJ42j+bVRZ+BLvfRTaEdNoQ2ADveD8H5SCicN6CsgvRvDmKSeU6DDcOgEbTEwGC/Nm+S0/V2NvHjgOqQsYB602SzMzBM4LNrYRlnIp7fBSlGqiGfpXM/rMYLYBLYkD1bC1fmvmj6zCDqfE851QuxUsMo7oFTUQmxEm9HRpGMWOINbkjqQsKJvNiE37O9XDYsMm67H4FxjTrcBVL3wToHmuc5egCViypk8u5DHGCNlHLVd45bCa6zaFEhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJpcYCTmKM0FLRSMw0a6WThVzQObEqUImx6x7F2UywA=;
 b=iRaTKV+BySTwlk8xVNSi1oTerKZjOKGtxzbXxe50dvRPYC61PAErtatlKUc7aHEG3Y8xiMwKg67Dnle+u0xpZXKglxs1Rb9/Lx/B8HuRiRd2PgqXJbi03cGUL/FiDiy9GIB+k2244YAPoeiJke1hYNRHnF41JzaNdFy2IYAVVYhEmBQFdAw9lpBThtDfAGTGqj/3CKWuyXWRqFe0KCrSTk2UGeC9hGCSqkghgxR7BFRdcaDJwrOcI86VCV2K73S5of/+0eGPdJ6jT4ba+vc5vqE+z6NT/CONX4Ri+emLTj97XDUJm2Qw5ODR2vvQoakecoN3aBgt7aYmAiBonZdv2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10135.eurprd04.prod.outlook.com (2603:10a6:150:1c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 01:58:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 01:58:38 +0000
Date: Thu, 11 Jun 2026 10:01:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v4 1/2] pmdomain: imx: Fix i.MX8MP power notifier
Message-ID: <aioXDdYIRrF+9zSZ@shlinux89>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-1-ea58ce929c84@nxp.com>
 <20260610133615.1B8211F00893@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610133615.1B8211F00893@smtp.kernel.org>
X-ClientProxiedBy: SI3PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10135:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1d3ad8-5b24-4ac1-b2e6-08dec75cf45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fhlfPrUL08UyWTQRA3Mv1+odIstZGw+bA7lgnovWUf9zPzAqB/gamB97h3hNCUdyAW83H+Edb80Py8Zg6LCGZQLYZrqRwKLZ1XHulX5S4Ib8TJKxVL8XLVryBu7DMk8/y0EblAbtbhEvK7kLuuc2VExEBvQjOdj/TL6gD74fJ0+ZoDitkV984CLoZYqlI1/xS4iWzZLbWPITs7IlP5SPD63n1UHRqDLBLS08VMqJFbTZxt6bTBTWJcTAtYcGLTBYbfZPvrajoIVlK5MM5cM7gVGBblcHcag0ltH56E0br+M4Kn0OiuNrzasvqSxpEtqhoFqtW5+xkMbMeAZHHuyelBymAM2ZDsyZBuzLBMGMffwmW7STu6qkP8hsWAJ888jrkgR5fRNRDD62U0ha+FF7SqZbOxSRyt/XOPGweCEdQ5Qeh78OLdpjIm9QdjfFMHSozZaBzAzUwXZUILICvVtrYiTdUNzoOGFvUD9JHDNA3uybpUj2rRV1DlBdeJqCH79uS8Btba3SNZ9btt2NJaensZHYZakNI2tYyBV2aWGm+11pkj71r+2ZA8WE/4iEbT83SZjuW5O4FgHu2fCNpiF9qAbBJnMu6Ji52zEBK9AtU2KPcsZCwoilX4CeiL3qJJdDncyWAD4wQ4IsEXMF+MMlqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7sPQDKVYJcD/9CcmSxjTsB54YDoQHJUSFOnMiyUUKGC2DSoz0ZzGJBqAMf?=
 =?iso-8859-1?Q?BH64pnfeTqTj6+h1atLri53zo3WgQihqiPCCKI7tukPKgn6hw2tf4hnNNY?=
 =?iso-8859-1?Q?qTXiby+T91eVtCc8DhC/w85UVGaPg8OziBGhzPypgYSJ6d3uXa1jtLhGOZ?=
 =?iso-8859-1?Q?adlXTgdLTjOUfYoXyVW9droV6EEYs+tfakKxTfV9nWj+Bzd8UqMg7J9PqE?=
 =?iso-8859-1?Q?esRpItcBXGHoaXB/3VgAwMRLU5H12jwwhqKYPGELOmUG3iQ3KzKtpkKc+R?=
 =?iso-8859-1?Q?DhWDjMmhIsHvhNHTGbnr8KgZ0fG5YBIJ4p7tkCU/QoXFGDtrzzWa4cvy8z?=
 =?iso-8859-1?Q?JGGf/FxL9hE95IbQGDQBEhCzKsUtKlxhJSJLSpfe+5k5pWV5kpBo3bzTRK?=
 =?iso-8859-1?Q?YUIr+Ilqrh82z+cOUI8v2K5J563T71tbh77MzMP/XptpBCFB0MlzfcK3JM?=
 =?iso-8859-1?Q?iooAX/Tm8DU7OZDv0K1yXKgD+ur+X13nHbAMRiWgUnbNv9uQWvSW83ZTDZ?=
 =?iso-8859-1?Q?mAVKTCNzt/aE9Ldgz/j8jQ9GqwgjH0CWL5cTur70f1gbcN+cx9zGutoqg1?=
 =?iso-8859-1?Q?ECGL47sRUBclKtXwgqaKkZCCb1EqqmqEI+lsrWbI1xNLGMCFDCKDNckhNg?=
 =?iso-8859-1?Q?pxuk9LiZCtz1FvixDfLYNiGj5ySqDz824C+js/rHKnIqCL46hrUxHJSaic?=
 =?iso-8859-1?Q?Qws+pyLOfa18IwGDKZID6diYZwINu7t9Z10zRdTXIY5v8ZmZKe32gLsT7c?=
 =?iso-8859-1?Q?mHJyJk1orAmMYgDs28lRkK2ZO+XOXOCS7ETiSC/ESPnbeuL+HIzrZjtBbr?=
 =?iso-8859-1?Q?IdJUmhjeKRwXtunEGQUV0mPSpsfh/9NuhnVREucb5mdxnBcy/BSPT07O3o?=
 =?iso-8859-1?Q?Fr4sWO6rZpp7faSB2knPOywM84fmgFNb22SpBCz68sCtkuzpyeHsS7v0R2?=
 =?iso-8859-1?Q?r9/tww48i0lUm8I7CjMJEla1bf4EMho104mcjIjnSFjrTQGSHpvuyodHG5?=
 =?iso-8859-1?Q?8HWJOHptLinErd1WTV+6GP4i4LgBjFt/VkdgIYHHPpcFlg/WXZBpduWayH?=
 =?iso-8859-1?Q?Sr6bglCeMEMzw4OIiWoo/xbDVtzi7dok2jZkEUu3wm+qXq21DQ6kNsw7Ny?=
 =?iso-8859-1?Q?ej5ICzMo8LButo2Upb63fTELluyXNvcKqkCEZizoKhfL6uuFsFKC78/SHs?=
 =?iso-8859-1?Q?tXXhqhjS8Qt7OrqSlS9kyziG2fDAeYXaBDh+xGXTGzkxNHLNUXAQmQcuW2?=
 =?iso-8859-1?Q?CsC0k/30zOeTNuJQZtBlOqnnYRNxvaD831J0rdQZNkx62j5cFaoR6WsQeC?=
 =?iso-8859-1?Q?CaeejQ7BD/IkCgM21j7QO8yApxxiv536PemNzvbWXGUPT01SfTPrra5L8x?=
 =?iso-8859-1?Q?dnCkxsVIxSIGXm5Ejjr5KdsSb3PZusgwHnYZXLgW5vxL+G/mzrpb53//ED?=
 =?iso-8859-1?Q?5T48OKvlo5DPlXF0t6Qh/vx6UjDnHTTfnJacfTNc4kyHAKvf7RBpF46CgH?=
 =?iso-8859-1?Q?RaEAHdaHW57TY4Abx9JnsXy1tdOUozkmVuTQYYZnWki63ZXkk9uAkvtvqO?=
 =?iso-8859-1?Q?eXsnS5dnC5K42LEpRlwPV8qUK4M53gRd8W1XfhoyN+UD0FtsmppgXKjpPa?=
 =?iso-8859-1?Q?M7CGpeBkhwo87LgVKdkYH/eWAil7YhDoxXbVi+BfWLFxFxW4wdZeoI5b2L?=
 =?iso-8859-1?Q?VHYjfMIYSYdySXxcfOcglVWPFW1tvW6Yk0xSGG/rW2J5DlEz4XbY/cL6GC?=
 =?iso-8859-1?Q?8hL6gpLI16W0f/bRJWFcJJd6FxXoSwqsoMMRRifM9sybWUhsRnJgcbWAli?=
 =?iso-8859-1?Q?aLjTzS4DNN6AhwvoWcTyfKOcv8kRtWgInKifsVMPbpipd4mNBaYg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1d3ad8-5b24-4ac1-b2e6-08dec75cf45b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:58:38.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MGp81Af3IB4UcLIW21pnmdj+hycXxZfvfxvk87nVOLJeuKXKJHSKC8qKf4zQ5bUCA9QgKNOZKpbXSTjL/oDFcnthTatyqRcmIGx++D55bJH3t2T3sKhiiIcvmhZ9Khq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10135

On Wed, Jun 10, 2026 at 01:36:14PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] The `imx8mp_vpu_power_notifier` fails to ungate the NoC clock (bit 3) and omits `GENPD_NOTIFY_PRE_OFF` handling, which contradicts the commit message and breaks the ADB handshake logic during power transitions.
>--
>
>commit b6702343f03cbdda69190bd48f95c1b0b1fe3617
>Author: Peng Fan <peng.fan@nxp.com>
>
>pmdomain: imx: Fix i.MX8MP power notifier
>
>Using imx8mm_vpu_power_notifier() for i.MX8MP is wrong, as it ungates
>the VPU clocks to provide the ADB clock, which is necessary on i.MX8MM,
>but on i.MX8MP there is a separate gate (bit 3) for the NoC. So add
>imx8mp_vpu_power_notifier() for i.MX8MP.
>
>> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>> index 19e992d2ee3b8..e13a47eeed75d 100644
>> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>[ ... ]
>> @@ -514,9 +514,34 @@ static const struct imx8m_blk_ctrl_domain_data imx8mp_vpu_blk_ctl_domain_data[]
>>  	},
>>  };
>>  
>> +static int imx8mp_vpu_power_notifier(struct notifier_block *nb,
>> +				     unsigned long action, void *data)
>> +{
>> +	struct imx8m_blk_ctrl *bc = container_of(nb, struct imx8m_blk_ctrl,
>> +						 power_nb);
>> +
>> +	if (action == GENPD_NOTIFY_ON) {
>
>[Severity: High]
>The commit message states there is a separate gate (bit 3) for the NoC on
>i.MX8MP, but does this implementation actually ungate it?
>
>It looks like the NoC clock (bit 3) is never ungated here. Also, there is no
>handling for the GENPD_NOTIFY_PRE_OFF action.

This is expected, keep bit 3 always in hardware default state. No need
to handle GENPD_NOTIFY_PRE_OFF

Regards
Peng

>
>During both power up and power down transitions, the GPC driver waits for an
>ADB handshake. Without explicitly enabling the NoC clock, won't the hardware
>state machine lack the necessary clock to respond to the GPC, potentially
>stalling the handshake and deadlocking the system during domain transitions?
>
>> +		/*
>> +		 * On power up we have no software backchannel to the GPC to
>> +		 * wait for the ADB handshake to happen, so we just delay for a
>> +		 * bit. On power down the GPC driver waits for the handshake.
>> +		 */
>> +
>> +		udelay(5);
>> +
>> +		/* set "fuse" bits to enable the VPUs */
>> +		regmap_set_bits(bc->regmap, 0x8, 0xffffffff);
>> +		regmap_set_bits(bc->regmap, 0xc, 0xffffffff);
>> +		regmap_set_bits(bc->regmap, 0x10, 0xffffffff);
>> +		regmap_set_bits(bc->regmap, 0x14, 0xffffffff);
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com?part=1
