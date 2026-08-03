Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB213BCD14;
	Mon,  3 Aug 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748198; cv=fail; b=SbrjyfK796MLtjuZtIB13hB0IPLc+So/11sWXpMmYSm3l0mw8EmVPHVEkp++RfHo+JF3J6O8e2ofrAoDPP6A0FX1dgiYgeA5+ko8tIsk/VZgAKhp6RbZrKz9+vfj3iNd34f+0Oi4UkZ1H3Lz2SvRf/0OkKOBjKq2L1nF2afjz+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748198; c=relaxed/simple;
	bh=45+sYQZyL7lnlE7z8vVLAPrcTTktRsWyHTRKXBW8mo4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dV/sgDX2SYPD0exijL6jFFr9gD1mYKG7oFsm/QKmZuFUZJVIOngBIVvhkEsXfBZtC4SkxCJ79gipF6Ni6SpZLIwHNntCc3516eIvQqvijTgOICKIjALMXxmPdigwylp+U00kcUJzxkdXalVoLpooZxO5MiIVIeKcM2glcooMoRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SZTEt2zu; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZTEt2zu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAreWVltfuo4ITWuatirWm0GIkKlP8ahHdSTvU1r/fpsFs8TfzqzcqxpyED74VIBLBXrKuv1ROAslmGSbFZNn3dnaKme23jqREy914GmTeqpH4V2ODfCpf7DoedRSxdtfdn3YRNEGCqqGKqh0D0w7fu53DuDe9t14d5vhajFkDyDgewkxBvGMVj735D0pPUSGoCzJ5B2QYJ+NHWec+kvi9lvcjfUzdhXFdnLTvCg3aCBaKiYst03VrBiuOwCVFlyiKVwpMAtgf3+ONm8qqAyLGJ17/5esrS8ylSf3nIH9w5LMDFKd4x0a037yK2q/6dyTvzlmR1mwyHP38gDRs/BIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEP43dHEtKHyuO4X/WwUHV/btYJ1bPBg5VpVSmGMYlc=;
 b=clswbUimKn0KYDEAqB/zoUaPugpWTVSxiLaK7dGqay9fa0I/ri5AlQE2OL9QF5/k1lef5hmgEkunsDJIfXpi7uU6kAEU2gNsP7K/HYeGkyU7C+hXJKlvS1Qc5qHD+jeDGfEy8Rjsa1quAczCR2YXiBKKak2X71TkFn2z9xNXmtEJHjPJF3FFxs9OI4KodgLe3PMNdr1CDBIZZhLOr/hSByMTU3znlEP/3z5iI9A1Ri8zC01xafC2G0eFVU14CO9uR/oDAOHJG8SCxazh89F2Bh6EGcimk6jl9ASEF9Gz9L3alehaUnvillJKwjgZdU7AfZ7HdlD5wyNPcG6Odp151g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEP43dHEtKHyuO4X/WwUHV/btYJ1bPBg5VpVSmGMYlc=;
 b=SZTEt2zuCzawDkVJyalQ3AIgIyF+Mx+2YfAHtdc2+Z6L9bQOScd8JH/UkrFFE5sxJAchDNbUKpYlWTKC6fgkBMVnvaBWIN2HEqIHV7NBCCmj/1nEWQvyjxX63gtA+FAZTmasUj8sDN+wxJVaB81kw8ERt6hRTwWU15pfQuHb8yoHQ7FGACJ+WhLMPtiG1UuC3glRBCoyZK9UWmKYbl+njVhWd1aOFvtBZDSItvFCwec5DCyQEzNsAYuH5s5sY4KqjcP+BMfNYx8MEyT2XxR+5N+XqCoqQV6t4QKEEKDUFAhV+5iL4cCSknA3dK2d1tbtGtXR30FaEZQAGKrApGJuIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by DB9PR04MB8089.eurprd04.prod.outlook.com (2603:10a6:10:247::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:09:52 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 09:09:52 +0000
Message-ID: <391bab14-cedd-47be-8db7-4fc59da8f467@nxp.com>
Date: Mon, 3 Aug 2026 17:09:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v2 1/3] arm64: dts: imx93-11x11-frdm: factor out
 common parts into dtsi
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
 <20260723-imx93w_frdm-v2-1-b108a76b2e40@nxp.com>
 <20260723072206.E92621F000E9@smtp.kernel.org>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <20260723072206.E92621F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|DB9PR04MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 25129d42-9008-4606-6519-08def13efa03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|4133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x1t+T+hC+f4g7BVYlGNgzjo4fLQHk/CXuh/RRdOMb5Fvzw+eMvL5o2FHNpfX9Wgz/3tFMbxtmFrWgsHderldGOUFf65yKL3kDYLkUdjMS9iYRVwfsYtlSWYHWwAkZOUez5q+WPHBI/LhQpIfEoW2EWFXYdDAqvOjgXT71Wrv9aPPib6wdcsUIdVfdyhKmT4l0Qd3o9mMece6y6RtAU+EJ4dFWxwJ/0xOyK/nhcOo0uneHFFZ280i8aW07/hDxVF9xtKD5c7dhhxujN8IVLGBqbifOIlWH6xD5pbuolGLvUlSHGCJYGASLkdeDEMVxJD3RmuBDD6TdVT+3GXBDYqnnRrT5lfUUevbAT9ZclcBlkKAdGuihQuFBGYP6yW4NvJ4oHuU/aDp0ec/GWrgD/Ain9pY7gEnzTw4wtd+q8e13Mcs7is36wGj8uada5xUYM83imZ7BGUVOLbjuztlR8p/3e5dJGYcKQ6QhG8uycN1ic5LL+afNhlQjupOfl6KVSnoVKAvjFNm57dNH8B/r+pDbjGfI41olFLdpbOS/aBOVd9QOOW5N4sQ/vM7UaCtID+QIKNerhiZpjjZ51m3s0r5LsI2NsVFVIsroYxEMGGruyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(4133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTFDUTYrR2ZGZkNHeHV1VkZ2TnFFNlJwL0UvN2czTUw5V09DUnEyQUJLcGwz?=
 =?utf-8?B?Y2U2YVl5NFUzVURKNytYL0NhbGpWS0htUVVucG42QzBRbHMrRFBWcXllWmJC?=
 =?utf-8?B?aGRVcDV1OEViNkZkODdEYmVGT0w0RmRnNVZadXVSWkJjOGtlZlk3K05rd3Vz?=
 =?utf-8?B?ViszNUlOa1ZJaEltSHZMWkJWSXBMRG5tK2JobXBhSU9XeVZQSzVhaUYzd2c4?=
 =?utf-8?B?NWk3YXNUQ1I2Y1haYjFNZG1NU3UzM1JMSXMzR20vZEM3c240L3grT25pQ250?=
 =?utf-8?B?K0xMcXRtMzJSdnBnSDBmSVQ5TTR3cFBlbFFYbG5PcE41dWk3alo2aDh5eFh5?=
 =?utf-8?B?T3JWVFNkQURaTE03RVJjcHBQeDJ1UlFVdUxJT3BWa0FiQjAwRHM3UnRTN0NN?=
 =?utf-8?B?L0I3bTJEeitOWVhYVGowTndQK1VXN0dkUm9KSVdiaFZSaU1YZ1hnWVU0aTdv?=
 =?utf-8?B?WVlSUS9mMldUWDdWMEl0V3A5TVFFcUZxVENienpyM09HbFNrSUJsdTBJVm9I?=
 =?utf-8?B?VGxOSUtyQkFkdGRBbTAyQ2pnMllTeFZiNnJ6cmRzd0RxQXNJc2JDS01JWm5H?=
 =?utf-8?B?ZEhMeklnSVBVUVIyZ2p6azFicDFzeGR2V2FDUU5NdEN6SHBKaHcrWG9HN1N5?=
 =?utf-8?B?aUhDTGhlTG1ZOVNsNHhvbklOd2tpZjk5ZWY5K2o0dkFHek9xbVFQTkZrYmFB?=
 =?utf-8?B?R1B5SnR0OFMzdG85aHJwU2lvZ0lidUwvUUVQK1I0V1RaTGJ0S1RnOWE0bUpX?=
 =?utf-8?B?dE83dFFqYzBUVWlLWlFxay9GMnNsSm1HTGM3K05tMDZZY2hIb1pqY0I5M3V0?=
 =?utf-8?B?RG9uREpkcnQzSFFwRW9Mcnd0c2c1QzdyYnk0N1JQZ0MvTTJ2SHdIN3dCUG8y?=
 =?utf-8?B?ZG1nMm8vTGZHZlRieXEvNFpiMVRsYjhnOG9OZEFucnpyWHVTdGt1SjRVd1hQ?=
 =?utf-8?B?VU4vSkdqKzBYSTZkVDJhbEZjbmFJVEhVcWlaQzVGMmxtVVkveW1NVUtZSFNV?=
 =?utf-8?B?TlRnVTUvbXBBWXZvdHd4T3E4enFDM3UrY1ZIT2oyazBXVkpJUXZqUUorbGVo?=
 =?utf-8?B?Nnh5aFhPWmNpM01vVk9lcnFObmtEOHkxM09lMVorL1pBYVY2SUJNZDdXajFV?=
 =?utf-8?B?YlZzdS9XVUlVSXlpZC8yQjVyWEFsVzZMWENSc0xNb2MzQ0xiQlVSeXM1b0M5?=
 =?utf-8?B?QTIxTVh0N09xQ0dOS2xVdnkvUkwwSkJYbVJVaklNWjh3QjZxUy9mZWRmWkRt?=
 =?utf-8?B?NUNvOVpSMktRaElucDVaR243cDM1RDFwVllCL0lBa1dCNzZxV2dBUGpzTW4v?=
 =?utf-8?B?OUpLOTd6aHlCUlFDb21YZFlYbXlVbnVTUWkzeWNpTmNmc0Z0bzJSaWcyODE2?=
 =?utf-8?B?ekVOc3FvRFBsQ2l3VmNHN3lldFNxUTdOdGpMcWg1VTRoZ1BTb2ZyWGFjUmJE?=
 =?utf-8?B?NSs4WVAxdGl6SHpIbFcxdkplYjN1YWFVMmpmRVpkTCs0SVFHT09TaWV2aUpz?=
 =?utf-8?B?THY5OFZjemF2TGIvSnZvcjhPb0VTcXJ3TE1tSDdzakhkYkhjV1VUenI1eVNr?=
 =?utf-8?B?L0paQitOQnZXQWJXa1hHTXNFWGovb1NHTG1seDJQdWN5YktmalhIMjVmbDdN?=
 =?utf-8?B?akJqdEtjMXRZV2JYVTR5M3pBVjRJSmhqUFZDeE5ZbHY0YXhqTUxyWHBWK3Nx?=
 =?utf-8?B?V0FHVDRQMFdzSzlncDZONTBwSWJpYkQ4YVFBYWIvQTMzWmUxMGQ5U1p6TmYy?=
 =?utf-8?B?MFRGdk1raDA3WjZCUkY1RG9RTHBreFNzcDZxZWVHQkI5eTJveUpnWjk3alMz?=
 =?utf-8?B?Qkx5Q3dQckZ1VnhOd3BrcWFQT25wSVRpVXFISXRHNXZiNnlJS3dpNSs0N2JG?=
 =?utf-8?B?bjBZbE4vUGQ1dlg3cVc0MzNNRWRldXRINThSRk5nUUlLZm5NcEMwV0hQcDNU?=
 =?utf-8?B?cFpVMUxvUS9lOXNaWU1tbUkyNE9MbWd4ZllYM0VEWFh0YkRZV2QrdWlxWjg0?=
 =?utf-8?B?VkJzdWh5S3lIK0QwaXpjNHc4UVFKbWNSZlZMdnJKUkEvNktxMzJKV083c0tL?=
 =?utf-8?B?dlBKakxtVDdFcmlmSHFmeW5WdXRKc2pyRzJJN0o5UHNVZXJ0MmVFVU40K1Ay?=
 =?utf-8?B?cnhUQmxFNG95bytjOHhXU20wWXp3MGtMMFpZUFVCZ05ZcFhFYlU2OFhWNllL?=
 =?utf-8?B?dndpVmxHaXlVWGVYSldpdXZ4blBRZjNBdU9RQ09PVDRSMzZGNFNjL2JJMnFu?=
 =?utf-8?B?NFpudWlpKyt1V01LWkxHdWJOemZhWkhuakZ2Z2FjWjVkejYyRG5ZdFpISlRJ?=
 =?utf-8?B?SUxKUFRoR2JFbUpWUjFiKzZaZ3hGZVFJWnJzZGhCZERxYjdDbXc0UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25129d42-9008-4606-6519-08def13efa03
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:09:52.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40eUkpgtjigJOptCYZN3/HcIL1lCGhxpOTfUUAEJ78SMQXnfrUQyXwMnn71M54onLtaWRz4xmWhs75b0W7/lsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8089

On 7/23/2026 3:22 PM, sashiko-bot@kernel.org wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch contradicts its v2 changelog by moving the board-specific `lpuart5` pin assignments into the common `.dtsi` file instead of the board-specific `.dts`.
> --
> 
> --- Patch [1]: [PATCH v2 1/3] arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi ---
> commit 35cb24d7221e1d0efbc151d7ebfd44422372ffdb
> Author: Joseph Guo <qijian.guo@nxp.com>
> 
> arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
> 
> This commit extracts common hardware definitions from the i.MX93 FRDM board
> into a shared imx93-11x11-frdm-common.dtsi file to allow reuse by the Wireless
> FRDM board. The FRDM-IMX93 board-specific .dts is updated to include the
> common dtsi.
> 
>> ---
>> Changes in v2:
>> - Move board specific lpuart5 pin assignment to board dts.
>> - Move pcal6408 node to board dts
>> ---
>>  ...11x11-frdm.dts => imx93-11x11-frdm-common.dtsi} | 129 +---
>>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 679 +--------------------
>>  2 files changed, 7 insertions(+), 801 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
>> new file mode 100644
>> index 0000000000000..5c8fdd77ec15b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> [ ... ]
>> +&lpuart5 {
>> +     pinctrl-0 = <&pinctrl_uart5>;
>> +     pinctrl-names = "default";
>> +     status = "okay";
> 
> [Severity: Medium]
> Does this contradict the v2 changelog?
> 
> The changelog states "Move board specific lpuart5 pin assignment to board
> dts", but the lpuart5 node and its pinctrl assignment are being added to the
> common imx93-11x11-frdm-common.dtsi file here.
> 

The pinctrl for uart5 is same on imx93w-frdm and imx93-11x11-frdm. The difference are the reset/wakeup gpio and vcc-supply.
> [ ... ]
>> +     pinctrl_uart5: uart5grp {
>> +             fsl,pins = <
>> +                     MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX           0x31e
>> +                     MX93_PAD_DAP_TDI__LPUART5_RX                    0x31e
>> +                     MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B           0x31e
>> +                     MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B          0x31e
>> +             >;
>> +     };
> 
> [Severity: Medium]
> Similarly, the pinctrl_uart5 pinmux group definition is placed in the
> common file instead of the board-specific dts.
> 
> Could this incorrectly share board-specific pin muxing with other boards that
> include this dtsi?
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com?part=1

-- 
Best Regards,
Joseph
