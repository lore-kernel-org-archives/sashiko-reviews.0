Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0463E5EC2;
	Mon, 17 Aug 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959506; cv=fail; b=iINXFfJUaxJEwyxCQbLtqJt3LnrA2bnXA0C8RMBcG0jKUdDjv5MAW4cLP3WAP88//m3OmzacZI1Mr3bCFd6Hv+KT5i1gcXoFpVGtnJrkbA1yxORbOsPyXXzFwMaFvvUkggBNGu8/m6lIalHEhlhfF7SKBwGDYVF5rbSL8QdzvEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959506; c=relaxed/simple;
	bh=EqgPit1AkvwgLbG72sjqv7j91iqpr9ePANTLrj6AMp0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k752gWuNpak0ot501SjSrydfs9f8aDzL+3WszTOKcRiHsR1dTcUYDmorrOtZwUbpdxxCSnxpHIOPYZEBwsONxqa8eeKMt1v0v7nJP3C+vRD6Gc1wgO1rYm962SfeWwL6f7IBlq8fqvnZfduw7AgvRxP2idQv4FVX7LCCEvqecQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h8bdzgsM; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h8bdzgsM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ0KOQRnsbIGx620xuCdRER+N8UPcwnMUewcb7iw3rxMA1/1pinOJZw9CskhAQd+oDguZS/jYQQX/fxBvvQ0wFYHP0SLemxaA/sh6BH0vv67vklPWjGHPrcUogAL6sCsiZYY/fm9ZV9UI8mkkYpbwcEaK8X3a7O8fgbFk54a6bp5n0eh/B9RKEaCnJM+cKgrLFHix6xTdz6Fzz+9BXBhF4Cb+DizCiWb4E5fUDHhvazjhljxgkO2euea3mQWltWBCvgT/TuI3SPNHzY7prVO2yHMaWtLIi9AdAWsQQdtaKfwLydE+QzCWcQ3gf7g8kzUT+c99K7g6rbPw5U8kPMKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19Fac7kQ0/l5zLxjRxaP4Hb7RUQ/xF8WWnn7ouf4w4c=;
 b=EYFK0YOv9FQ45Vx1H8CzLpfTdQJWWi0MAwXv4ZvTUxkXMVPgdPY10v58923g548sqWyM9sKRLRBqIlsJnQ8VAvGlxr3PwEgMdytAV0RlV4g8tBRYrQuoFQsraKhdtvFVzDBJ2fM/TAPC0/iETlYLWfDglcr1fuJiuERll1GdqSww//35gWOOA+vDX/QRaOeMCZ/Dr45onOcgPTKiyok3L6awwfxcWQkQgjuKY4yVyLNcUFFSEXGe/b5m8KauG4WK0B+HDTCMZRjAMr6wsXD4WDvEw3gm6Kt7fL6ZfdbSiGK9ZoqgAColF2hV4FWpnpQRaScUoqZXllzbgAaeRES6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19Fac7kQ0/l5zLxjRxaP4Hb7RUQ/xF8WWnn7ouf4w4c=;
 b=h8bdzgsMCsM76JsUyE7t+KmUlvWKBb1WzXsfwPDDnUZ1y8IqtEXl0UQmto8YMOEuFihXaOu46RFJHA7u7MeEELqNpcEe+/Tdb5HPDGfMRVzUsdfRpl4EMKsZmClLo3gnrjTKUnDV+9a/yiRQJrA0WkL4lqr+Bz5WUf8zgt35GGD8S9IIH5Lm0wnSScwH66V2M/EgBg+IA9kIRtb3vKkVwI223D+Q1hv3sCVy5ulXEakGL/RUbIH07WfA/1raWKjifg11QxHvG1N7ujAUUC19LJkioUza+5EQw+liyoo/gvC0+lt8nJdZkyXNnhLuPlRbs/hgy2ny7zwQwN7xg1ZP9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Mon, 17 Aug
 2026 09:38:13 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:38:13 +0000
Message-ID: <bfac9033-5b98-4352-9a15-b09ef12145ae@oss.nxp.com>
Date: Mon, 17 Aug 2026 17:38:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] arm64: dts: imx91_93_common: Add clock and
 sound-dai-cells properties for MQS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-2-chancel.liu@oss.nxp.com>
 <20260814073023.0B4F21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <20260814073023.0B4F21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3c674c-fb83-4d0b-939c-08defc4341d6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|56012099006|22082099003|3023799007|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DkDmWnekWmHwx69MkyrWsroWoY4v7d4IWFW0gXBG0m9tGMMSfWv3lOP1NJt3xalBFJgaBslEMYGFRUVqbNScKQRas1zPgiKpsMlGlbSPHE2n/o2OLGjtVIzQvgJ7orSBDxRYOxHzM4/+Ub5REDZWkzFgoGgEV5fZGbdgexYKGIQMtMWs6pz2hvUHUEcSK7F6cmonm1gHCp3HW00llhbmmgK6XHiWc9Lb7K5qawKEfB8m27J8ClRkbceAqkMkd5izOYm1ED9xm8kNYJXlIlS2TuK5MAilfWuPTEXJyVVMuzUX9nz3/kYVW1dzx9AOonHQOF+yRLtT9WEFOJT7hPIc6O9nVPh3IsdaA8siT0I2NKNJ4OsLpRHOjqnYBtAiuaXSj+/3Pg0tBrnHbE5INs7TPLp4fFQCJWb9YN6hbuNLG1CFXyEfKJSi8UArKBVNp0bvJkZX8AesfUItHfr8ad+R5nvQFiFCpT3eYyvFUL5tahZaBSI/vDbBeJHQKB+2NUDHxEYLwiPSdXDO8v4BAW3uwFmmTEZUf3cYV9Bh+5N5YAxQzb1FSYxmzupY7U7JIXNDtRGZBTH1hr++f9qFEgDLCwgS53rCGIcfoGA+8+S8m7VnmD+L0e9FJvhpCAneE8TPGb0OyghEcJZYhHaLwPdXeaa4TRyJFOrS+90oxQAjJHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(22082099003)(3023799007)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01lQkpkeUQrSHpISXpOTC9sS0lieVdXSDBIRXR4cWJLRzZsaFZFM1JSb1pk?=
 =?utf-8?B?N3BOUEhpS2JEdmxVMERSZlAySll3SkR5aW9TOVRpNUZIK3pQdWJNcGpISUZn?=
 =?utf-8?B?bFJvNmdCbmhGUWRuL3RlbUNyVnJDOUJ6Rlp4dVRaUUtLRXhVbFhOUVd0RC9a?=
 =?utf-8?B?Z2drZXVhT3VXYjYrWER2bCtwK3B6bS82Smg2OE5SVlArdFpISkplNlE2OVBz?=
 =?utf-8?B?eHd0V2ZDQUFHdlRramxtSU5xV2ZFWTlFWTJrODFheWpBNllUZGZYSHJNTXFt?=
 =?utf-8?B?ZThJNTNXNzd6NExMQTN2RThoM2oraVVJZWxCSEpDOWIwR0NjWWFIL0FnV2pk?=
 =?utf-8?B?a3dXdEZYZUZDaFM2ekxiWndCSDZBV09Wc0tXa2NtY3Rhd2o0MGJ0WjBXOXQ4?=
 =?utf-8?B?U1pMY0VPUW8xbE9YempuZ05JajZJaTdMeGswWS9Vd3NKNUpnc2ZJQTFaZTkv?=
 =?utf-8?B?STFhdVpNdmtkWnl0UEZ0VXNDb2lLYW5KRGJHQ21tVzZOT1E5Nm9hTlZFbDgx?=
 =?utf-8?B?akVDQnVXcmZIanFhOW9WNC9uc1J0Ly8wUjZha0FqaEFMQ3I1WVM2NitxY0FJ?=
 =?utf-8?B?QWl2blVraG95dzc0SXNORlRNYkVwbllQVnpLR09yaXpIbXpLM1AwQ2c2TGZL?=
 =?utf-8?B?VXhWMnNYMDNGNGdBa3craUphUGI2QkdJTjV0R0t5M1JRUS92Yms1c1lvMnQx?=
 =?utf-8?B?eElhUk9hVHZjYXYzb1FEUEtiNzY2YmlXMk5HRys2SWd2aGxZY1k3MGhnWFRk?=
 =?utf-8?B?aEZtSW83eXB6TkJ6WWl4ajBUbDY3c3RWd3BiNEZHcGY3dWpFbXliVk5BUWlT?=
 =?utf-8?B?dzU2cjZtbk5SL0JUTGdJUWdudlEvVUYyTUpxbm9ycWZYMXVSVUtBc1VUZGhN?=
 =?utf-8?B?cjFqa1luY3NNWTIvYlFUTmQrR051V0xuWmIrSkFCTVI2UElUVHZCN0ErSkRG?=
 =?utf-8?B?VGJjenRvNE1CUUdpNUZNQUdxZ042MnpPd21wK1N3b0xoSk13WnRYUExlNTYv?=
 =?utf-8?B?Y21kbzlyMHVVdGJNbFZ1RThIamF0bWoySWMvVTVjOE40d2x5UjVnSmlLemRs?=
 =?utf-8?B?M0hLZHlFL2hqSUM1a3NqMWpHK0UxdWFJbjdzWlhBQmhseDhxaDhMbFQ0dWIv?=
 =?utf-8?B?OXZVdTBVQTByL1dKYjAvVTdrd2hjVkQwQlRoUUdUTlNtUHBUVEpNM21sSHFx?=
 =?utf-8?B?cU8rVzRPajRhS0w0TDh4Q2dtZDdMc0o5c3NvTVNhTkVBNGtORE9USmRBMEF6?=
 =?utf-8?B?NFhwZnY4ZCt6TmlHU2tHSStFWkdxUmNnUFdzNUhpb2NoVVRBU1lTOTF6TUNE?=
 =?utf-8?B?aEthcS9CTkpqUFpibGlxVkRHZ1EwcFJnS0c1WmJMRzhoUUN5YVZFRCs3NElO?=
 =?utf-8?B?UE1SV1kyREZKTVdta0pCdjBqN3NGeG1XaUlTYWpzT0E1V1JzS0FSdXFwWVJK?=
 =?utf-8?B?Qm5LNUJjUDVxbGhncWkySkk0aDc3UUs3MXk4b2xNbUtrMG5PdkQ5aFRUSzVi?=
 =?utf-8?B?dEdrZUhXelM1RHh1WnBRZkd2WkJ0VXBFd2NHZWdkS1dzYjF3MjlScGhDZDRX?=
 =?utf-8?B?WXZYdHlHQzVIUVVwbHBEK3MwNGZOeEJHcTFLcXFORlpGM3VOT3FIdG5hMFFO?=
 =?utf-8?B?TGg5WXRoMU1CWDdoNEFvYzZuaGwwVG9PaWh4Rmo0M2NocENhSExVTnhlbzFO?=
 =?utf-8?B?RDgvUHYyQ0lWRW01RXhtY0tvSmRFQ3liZG9rcGQ5NG5hRXVjc2U5Q3drdjJR?=
 =?utf-8?B?blppZTBrTUw3MzByMHF0QzRoelZycDh2eU5BZVBwdlBXZzIyNWpTZmwvQmcv?=
 =?utf-8?B?OERqaHBac010cVhJaEUwNUJ6eFEyL21aNmhzUUhCQ2JFWEV6N09xRUlaRU8z?=
 =?utf-8?B?Rk1XcTUrTGZ0S3BOeXBJeXFkSmNDMXk3NjFhclhTTWJPYytRa3NQYy9sSGZN?=
 =?utf-8?B?SjZuNk9QMURsZjRwS2VNNG5YNWFMbjR1Rk9yajVNUTUzSHFCNGJPNDZTRi9T?=
 =?utf-8?B?aklqTiszcVREQ2R5VXhuZ3hQNEpITzgvV0QzaEN4b0pnV3RXY1Rtam10cHVB?=
 =?utf-8?B?Z2FUcE8xN1VwUHVHYzBuekt1RUJtNUp2djg1R3ZaYlhvYkZOQTgxdG5OMEpO?=
 =?utf-8?B?Y1JtWThWTmpxaGx3RFRtRkZJZVJ1clpZcS9JNTl0M1p6eGhJYVNDNW1sNTR2?=
 =?utf-8?B?ZG5SekViekYzV0tJOWNqK3ZCSUE2dDRSR3NTeFRBanR4T0MvTUJ6L1k2Sjlj?=
 =?utf-8?B?SUtibzBoQkpRRUtZRXoyanQ2bTc0dVozRGpHQStJSndOeDhSUng3b255NldC?=
 =?utf-8?B?ZmlhVGhGWCtUTW53ZjhPVmxOMHpSRTV0TXlQamlieEI4VGZmaGFNdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3c674c-fb83-4d0b-939c-08defc4341d6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:38:13.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE4UHq/h/Wscy32g+QqZK3bw3lAVfBojRpxdh8pD/1hkDorvL/ghzusCSb8sMdn/hZvLCGjmcA+tBM3QgzHQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete refactoring leaves duplicated property definitions in board files, mismatching the stated commit intent.
> --
> 
> --- Patch [1]: [PATCH 01/17] arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS ---
> commit 3f3b7186dd0d4a7ad6f02447032fc2e5538b3ca5
> Author: Chancel Liu <chancel.liu@nxp.com>
> 
> arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
> 
> This commit adds the mclk and #sound-dai-cells properties to the mqs1 and
> mqs2 nodes in the common imx91/93 dtsi. The intent is to define these fixed
> SoC integration properties centrally rather than duplicating them across
> individual board files.
> 
>> The "mclk" clock provides the MQS oversampling clock, and #sound-dai-cells
>> describes the node as an ASoC DAI provider. Both are fixed SoC integration
>> properties rather than board specific, so add them here in the common dtsi
>> instead of duplicating them in each board dts.
> 
> [Severity: Medium]
> The commit message mentions adding these properties here instead of
> duplicating them in each board dts. Should this patch also remove the
> existing duplicated properties from the board files?
> 
> It appears clocks and clock-names are still defined for the mqs1 node override
> in arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts:
> 
> &mqs1 {
>         clocks = <&clk IMX93_CLK_MQS1_GATE>;
>         clock-names = "mclk";
> ...
> 
> These duplicate properties also still exist in the mqs1 node override in
> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts.
> 

To avoid misunderstanding, I'll remove the redundant properties from the
DTS overrides on all related platforms.

Regards,
Chancel Liu
