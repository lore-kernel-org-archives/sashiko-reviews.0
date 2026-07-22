Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7B37FF5D;
	Wed, 22 Jul 2026 22:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757891; cv=fail; b=ikv3QghWkypdiDNxh44gpOr3e+/F0CHXibvuSBQCTOCk1U2H/wKSRGNLmeP+EunaIRX0bFrRUq6aN5WUOjlc0QAstLroQ+5v1fVL6PkAwPjCUAAXtPGKAPBkD+ZynpqOdZGNNo4QqEq9XbOvvwyA4JiXbBB5/7i+oRts31ZgXAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757891; c=relaxed/simple;
	bh=Sr+1XfZHQVcBTaAbjg/ngQ/Eq4cgNyFUKts5Kagc1Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u92IHUOVuvuZifD06zLaVJIe9KTqiWlOq4yugoPM0GSw6bIpbllCUA0BL2wbJFXwmjlPN9jso4+IDXqH13/0/DN8a2DXaGFp13OrLUgmK5WWasiTZTsB3pZQ4z4sYhPDHHuyRr7tFpyYmJYcIwbZxG4ZmNjOywIuABkiNkKwmsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dPwICV+r; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dPwICV+r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8qugv6BflKEIYA76ulP2ifzjFxDV60NOW0rRH2D+oyO0EXzLPs5Yd3iu76ONukFIupF0ID0y4iL6U8RV82mo+9Jz4XOpkapnuZtLDM6NR/Tk2cls8pOwdIyRmbC2KqUjIYKm/tEcxvCMXQCa0w6HpfG3rE2RbMrVQW7u7Omm3nRyc4qQE+/FNAHK1N5uKdc5QZVjRLBVKnBRKuJeFSYe5vcQiCUpcK58D9CtJpfzfr3Q7e5oHUjCANPv1z6SERxvfmv183D2G95wDuUpc8V96/Il1FNKi8C1Ml+HBPEAyNUm4r2NS0x3gMYXkBnUTLw8s2mh3gIubp5zP3+PByhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsS1/lMaSYHypTSDmw6BeXDux0II01fmAcc+5DdSL/s=;
 b=ietFd5IPO6Bn90W8xjk8J6njqT/UWCaGTkw3FVzzkY+mr2AqqD1WTMRM5FLxcUNRrK4+7tNjK6N8u1bHTPeXrq9rigWrB2wrkUx/19w8NWib3Z1yD3HXvZ6r6yojihZ2/0BKJQqa6hI7ujaRWicJEfEjUCbn80wehYgs8YGQYpch1nEUxoNi6tO8fhDoYHctoNM2yBj+znNqx5BItQ/zFLL58/x0nTsQarXJMONjDveMAWtnSWmxnz9rr2gYHdL+KGE7Rq2NqarhH1T8V4TuWnZxsNv9T9Sexz22xlK/jNa5FJolYwL90ktucTTG7+cwZ/6JFF8q5m/6Chmdq1FSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsS1/lMaSYHypTSDmw6BeXDux0II01fmAcc+5DdSL/s=;
 b=dPwICV+r+3lFER/PYZG+e927RAg17HG3WfyjFDXyCULd94zU7ohvenwi5snTXU63/D8705ChzxOF+pxPr1yXzIejj/+XYNuxe+onY3+NmXtKI20iT3U3LJbEMi3B//Lx7epg5zIcj+KGw8xYKwD+EJEQdOqJGSk0ORMyu8qrjK9b4iyKGmWr2VuRUWDRpYnH45rocQ4RuwwLR25RhfMK43gRwHdpZBKwm4902yGDzsGXgeUpf1TPmOgW1YZKB/K9JUAfbJjWZYQuML+CJdxKVLUzLioM5s3Cz+R04P+Vr/2ZVcbdla4TxZf/BzYxDlBBdRAK0bpvcEcpXROkmB/+Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9674.eurprd04.prod.outlook.com (2603:10a6:10:306::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 22:04:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 22:04:45 +0000
Date: Wed, 22 Jul 2026 17:04:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Bough Chen <haibo.chen@nxp.com>
Cc: Joseph Guo <qijian.guo@nxp.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
 Board support device tree
Message-ID: <amE-dICUsWdjZ_Nb@SMW015318>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
 <20260720065549.C24301F000E9@smtp.kernel.org>
 <56975936-9db1-431d-91a5-c038dc16c196@nxp.com>
 <al45mQ_okIqpkDW1@SMW015318>
 <AS8PR04MB8676EE994248F3F168E39F0A90C12@AS8PR04MB8676.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676EE994248F3F168E39F0A90C12@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:510:324::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: df1e919d-08f6-453d-ce8f-08dee83d3d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|4133799003|10067099003|11063799006|4143699003|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	eMWeQmcjeXehKzlmSrgbUPL8Zp4cXPF1jV6tMZqQNK6wiRxGA9T+qw8TwVbpQTFecLjQndhRq8Fo6IpDV7lIdGYATRk86O0TkYQKw1Rfr+wzSbRoQOKZ5649lWcbNZxsL4kebUAelBftYr9SS7ylyIwENueoShQxXK/4xZhciOJDeNpN06EHqev6ym+8eAnXHW94CLTWux9AoHaVIqUjXF7H/WhpN6qEx3ls8H+C/vfWqqm18pEgpqQctBhkIf5Wes+m8rGT6vhTauM5k/29eDqKghTigWyNN/eLFd6I1TJL3vgjRoCJneIzgcsRLpmDo8Ns+N9tf0II2hkTqOTIvSrtJC1OfBMq/dVCq9JQpiVOXiMmV3i7qg7Vh5ni0pMyvS62aDDoT1aj+7M5RlwLpxolnRVMBqTkQ/YbO0gCx9QdeR3da9XeqgnK5wqhmDtBtnCD0WR5gqsA5O0Kx6u0GAVXtNQ605WWj38ULhmL22hKZTpyZxFy6AObpZSW7bchhriJpgBh2LGBGPkyHs0sE434ryG5lTi3RLHy6sXN5ok2scn3qJlobR0Cp5fsfJeTfEki1AE/NGSw0zorIgjw466oIdh1jYHbt7ko8pZ9+Td12URjRymfav+BFeQwXA1y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(4133799003)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlFoZXAvR0hzR2xvZFJjQXN3SldaTGZnb2ZzQktVZ1dzUEZzdTZKTk1zNWRs?=
 =?utf-8?B?enc1YmNGUitLbmZVNzQzd1RZejlFcFJ4dmJMa0w0OWVEVFEvVDFDVnhYQTMx?=
 =?utf-8?B?RjdNc0tMdmMydVlhcHEzaDhWNW0wTUl0QWNoa2pxWlVMSFNmTVYyNzA1ZzR6?=
 =?utf-8?B?SkpEbzNIWVd5RC8vUm02bUIvZnRFTWxGTFEyZjlRNWd6bjIwMFk0NzdseVhx?=
 =?utf-8?B?aEFTVDE0azlhdUVRT2JCQ3ovTFQwc3BaNlZtUFJQL2xXMUtNeEFBV2FFZmto?=
 =?utf-8?B?aWdVek9UaHBNRllaUURYYStXSWRkMkpiaGVDY3NQcWxyV2RWczAwbmZvRll0?=
 =?utf-8?B?OFFGSXhId0tzZkkveE9oZnY3eVlFN1YxUVVkMXlJb0o1c1EzMUxjb1pCSVor?=
 =?utf-8?B?OGtvcHVnVVdjQmF2MHJCT1QyQTM4eHJ2MWJ5SllrSzRDREFMZEhUcCthYmRE?=
 =?utf-8?B?Wnk0OU5FSjY3YW43Ym1EaWh1b21aYTQrTnVGY0w0QlVtckd3T09GKzdXYXNW?=
 =?utf-8?B?aXpmM0dMVzNGbS9qVUVhQ1grYTB6M3hkU21LWGZjbjZITWdwakkvT0RxWG5Z?=
 =?utf-8?B?UWhlWElnbkhWekxIMGFtUnJSVk1zK0ZLWTl6T29BVWt3dk4rdGF1UytNRklM?=
 =?utf-8?B?WExYc2hBWjlVZGtobmdWRDBaUFNVUzBXaVR2Sm9TOFJxeGw2bCtib3NBZEh3?=
 =?utf-8?B?dER5TnRyTytmbG12Rkd1bXhCVTQ5d1hrajByTTc3NTAvbVl3aFdubzdDcVJy?=
 =?utf-8?B?K2g1RmRRcmlQMk1RY3c5T1pRUUpFbUhGdXJsY2hLeW1LbkNvUmIzZ2NiWDNp?=
 =?utf-8?B?eXo5bmdoRjdDMnRJMnBVd3hLMmdtWWlCU05zb0pJcHpvOVZCRmhia2o4OVBK?=
 =?utf-8?B?aC9YVFBia3pLaE9tNXBKUEdWZy95ZHZKV2s4Nk04bjNEN29BRkRoVDAyaGFN?=
 =?utf-8?B?cGRwSnJNWDVxOW02ZFRWMDVtYkdITjVFUDJFaVVuNCtqa3FsKzFWbmczQlZ0?=
 =?utf-8?B?NlcxT2xyb1FYanFWQzBJelF6VXlBU3JwYUNUSjBFaDV6VDlveUlLZjVnY1la?=
 =?utf-8?B?ck5aNisyb1YvZmlxblp3UlVhZ1pMM0RPcVJSZGpOM2UxTXppQ1RXNHFzSXZv?=
 =?utf-8?B?N3NSRmZtUWhCb1ZLMC9hUkx2c1dSSlJzNVhMTjcxQXpBYW4xUWdKNCtoWk5B?=
 =?utf-8?B?a1phSTI0cUlyeGdJUDZTcmxyVHJrRnRDWHA0ODI1VXdhUTJzNnNWaEZneHcy?=
 =?utf-8?B?ZU1GS0JuRHlLc00zdmRoeDhqa2xkSHJoSXdxemRSbG9FMllreDUyRG5YbnZv?=
 =?utf-8?B?V0R2SVd2VlpKY2FwRUJKUXFsQjQyTFIzT2JaV3JrcElhV0d3cGo4bXNXYWxi?=
 =?utf-8?B?TVlzazQ2S045dCtKdEhTcDMvc0JmM0RwUkdjakd6ZlRReEFQZEZOaEo4N1RN?=
 =?utf-8?B?RnVBZ0hIRTdqSTUzaVQ1OHpGL3gybDZ2eit4b1ZMOFg4U2Nnb3hFRjdJcW1H?=
 =?utf-8?B?a0NZeG5UeEk2YWN2amVMTzRxU2VxL1JsRW02TUdTOUI0bUIxSnlibTR4L1c4?=
 =?utf-8?B?cDZudEtudWp2TjVwS3craFZ1eVAvRFlKUjZZMUo4OTY1VUVCWXA1Y0ZqWDN3?=
 =?utf-8?B?cHVoRmxBODZ0T0tabU92aGszb2RNQWZpajNXMkswQ0VVRVJ5YTVXRGpBRUpn?=
 =?utf-8?B?a2o0U0dGTENzNGNnVm5KNHl0cXFwM2JYNndhaDN3SDdzaWxreVFyOUxpUG45?=
 =?utf-8?B?US85TkR5YzlXZ3I5U1dnd21FWklBWEwxcThCQ2Zmc0l2MUU2Z3hTQ0RIZk9q?=
 =?utf-8?B?TlYxRTdMWFBPYWIvREJoSTd4Sjc0TGpucXZVRjdMamlUN0Y3WVU2UXRZa2hU?=
 =?utf-8?B?ZDBoZEVzVUw0Mm1IQ3k4bXN1Z2pBdnBlZTRSWi9ZZlBPYjNaYmRDMFpCM2pK?=
 =?utf-8?B?VWNNcTVKSWpBV1YzeWc2UnA3MHFOUGx1bnVQV0h6eFZMRnQvenNXMkg4eE9D?=
 =?utf-8?B?TG1EcEdFN1UyKzlua3M2QXpqaXRMdjc4eGdnbStmRk40TlZtZVRMNEhFYnlG?=
 =?utf-8?B?OE5td1JEa1dtTDd3QnQvN2RSdlpIVFJlZnJJbDJnS2w4ZHpQQitxSTdKVkFT?=
 =?utf-8?B?T1EyeXlFRStvMURQQjhkYmZOazBXRjVueUllRlV6aWNRQTFmWi9NaEtJVy9G?=
 =?utf-8?B?VXljL0VEbGJHWlp3WVo3L0tNS3kvS0plMkN6UWtjamQzek9tdFV4K0R6cmdH?=
 =?utf-8?B?ZVQwVnZJVkp0Zyt4S2dHRXpQOVlVSUs0NmNwcVdSNjl0Y2hmRGY2VEdHd01s?=
 =?utf-8?B?cVp2bVFvS0xrdFZXODc2WW5xWEJ3WnVldURLaDVPMWdCR1NocVpXSFd6K2Rn?=
 =?utf-8?Q?5WCd6+ZIwCPKYzRwMgHlF1pEADsTvFFaIG+3V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1e919d-08f6-453d-ce8f-08dee83d3d69
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 22:04:45.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgdyJZ2PBp4NcEAlvgy6gZ18s/tzm4LhdnOTJiKQ+8/hp6quWnndjiE1UOPY6QLS2unzQPKCOKKLODsvUxCiW+T2+nY/zkpIrTgd/Yd4SIwj5Q+U02et/Q/Wkfs/NeTP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9674

On Wed, Jul 22, 2026 at 07:57:58AM +0000, Bough Chen wrote:
> > -----Original Message-----
> > From: Frank Li <Frank.li@oss.nxp.com>
> > Sent: 2026年7月20日 23:07
> > To: Joseph Guo <qijian.guo@nxp.com>
> > Cc: sashiko-reviews@lists.linux.dev; robh@kernel.org; Frank.Li@kernel.org;
> > conor+dt@kernel.org; imx@lists.linux.dev; devicetree@vger.kernel.org
> > Subject: Re: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
> > Board support device tree
> >
> > On Mon, Jul 20, 2026 at 03:03:20PM +0800, Joseph Guo wrote:
> > > On 7/20/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> > > > [You don't often get email from sashiko-bot@kernel.org. Learn why
> > > > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > Caution: This is an external email. Please take care when clicking
> > > > links or opening attachments. When in doubt, report the message
> > > > using the 'Report this email' button
> > > >
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider:
> > > > - [High] Shared GPIO requested exclusively by two CAN transceivers
> > causes probe failure for the second transceiver.
> > > > - [Low] Use of undocumented, downstream-only device tree property
> > `fsl,cd-gpio-wakeup-disable`.
> > > > --
> > > >
> > > > --- Patch [2]: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
> > > > Board support device tree --- commit
> > > > 8bbcb28d08a05e0f4c57023333492b4e023f7caf
> > > > Author: Joseph Guo <qijian.guo@nxp.com>
> > > >
> > > > arm64: dts: freescale: add i.MX952 FRDM Board support device tree
> > > >
> > > > Add basic device tree support for i.MX952 FRDM Board. The
> > > > board-common hardware description is placed in imx952-frdm.dtsi so
> > > > that it can be shared with future i.MX952-based FRDM derivative boards.
> > > >
> > > >> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > > >> b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > > >> new file mode 100644
> > > >> index 0000000000000..b9ef6bec2bd5a
> > > >> --- /dev/null
> > > >> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > > >> @@ -0,0 +1,727 @@
> > > > [ ... ]
> > > >> +     flexcan2_phy: can-phy0 {
> > > >> +             compatible = "nxp,tja1051";
> > > >> +             #phy-cells = <0>;
> > > >> +             max-bitrate = <8000000>;
> > > >> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> > > >> +     };
> > > >> +
> > > >> +     flexcan3_phy: can-phy1 {
> > > >> +             compatible = "nxp,tja1051";
> > > >> +             #phy-cells = <0>;
> > > >> +             max-bitrate = <8000000>;
> > > >> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> > > >
> > > > [Severity: High]
> > > > Does this cause a probe failure for the second transceiver?
> > > >
> > > > The first PHY node successfully requests this GPIO line, taking
> > > > exclusive ownership. Because the phy-can-transceiver driver uses
> > > > standard exclusive requests (without GPIOD_FLAGS_BIT_NONEXCLUSIVE),
> > > > the second request for the exact same GPIO line fails with -EBUSY.
> > > >
> > > > This prevents the flexcan3_phy and the flexcan3 controller from
> > > > probing and functioning.
> > > >
> > >
> > > This two CAN PHY did share same pin as their silent-gpio on hardware.
> >
> > Hardware share gpio, but driver may not handle this case. Are you sure
> >
> > flexcan3_phy probed if can-phy0 already probed?
>
>
> Hi Frank
>
> I dug into this. Both of you and sashiko are effectively right, but the outcome depends entirely on kernel config, so let me lay out the facts.
>
> The driver side confirms Frank's/Sashiko's concern. In drivers/phy/phy-can-transceiver.c the silent line is requested exclusively:
>
> silent_gpio = devm_gpiod_get_index_optional(dev, "silent", i,
> 					    GPIOD_OUT_LOW);
> No GPIOD_FLAGS_BIT_NONEXCLUSIVE, and tja1051_drvdata carries CAN_TRANSCEIVER_SILENT_PRESENT, so the line really is requested. On a plain build, the second phy referencing the same pin would hit test_and_set_bit(GPIOD_FLAG_REQUESTED) in gpiod_request_commit() and get -EBUSY, failing the second transceiver and its flexcan controller. And NONEXCLUSIVE cannot be set from DT - the DT gpio flags cell only encodes ACTIVE_LOW / OPEN_DRAIN / PULL etc. So DTS tweaks alone cannot fix it.
>
> Yet on the i.MX95 15x15 FRDM (same design: flexcan2_phy and flexcan5_phy both use silent-gpios = <&pcal6524 7 ...>) I tested it and both can0/can1 probe and pass traffic. The reason is the gpio-shared-proxy framework (drivers/gpio/gpiolib-shared.c, gpio-shared-proxy.c). At postcore_initcall gpiolib scans the DT; when the same controller+offset is referenced by
>
> 1 consumer via a "*-gpios" property, it claims the real line once (marked "shared") and hands each consumer its own proxy descriptor with vote-based arbitration - so the second probe no longer returns -EBUSY, with no DTS change.
>
> The important subtlety is how that framework got enabled in my build. It is gated by HAVE_SHARED_GPIOS, and in both your BSP tree(frank.li/linux.git) and current linux-next, the only selector is ARCH_QCOM (commit e511d484cbe4, "arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM"). ARCH_MXC does NOT select it. My kernel has CONFIG_GPIO_SHARED=y because CONFIG_ARCH_QCOM=y is also set (as in the arm64 defconfig), which selects HAVE_SHARED_GPIOS -> GPIO_SHARED=y globally. Since the framework scans the whole DT regardless of SoC, our i.MX CAN nodes benefit from a config that Qualcomm pulled in. It works by coincidence of the multi-platform build, not because i.MX enables it.
>
> Consequences for upstreaming this DTS:
>
> Pure i.MX config (ARCH_MXC=y, no ARCH_QCOM): nothing selects HAVE_SHARED_GPIOS, GPIO_SHARED=n, the framework is compiled out, and the second CAN transceiver fails with -EBUSY. This is exactly Sashiko's scenario, and it is real.
>
> arm64 defconfig (QCOM + i.MX): framework is pulled in by QCOM and it works - what I tested.
>
> So the DTS is fine as written, but to make the shared silent-gpio robust for any i.MX-only configuration we should send a small prerequisite patch mirroring the Qualcomm one:
>
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ config ARCH_MXC
> 	 select IMX_GPCV2
> 	 select IMX_GPCV2_PM_DOMAINS
> +	 select HAVE_SHARED_GPIOS
> 	 select PM
> 	 select PM_GENERIC_DOMAINS
> (and CONFIG_GPIO_SHARED_PROXY should be built-in/module in the i.MX defconfig; it is default m). With that in place, the shared silent-gpio in the FRDM DTSI probes correctly regardless of whether ARCH_QCOM is also enabled. If you think this method is okay, then I think Joseph can post this Kconfig patch alongside the board DTS.
>

Thanks you for detail information. It is quite helpful.

Frank

> Separately, on the [Low] finding:  Joseph, please drop the downstream-only "fsl,cd-gpio-wakeup-disable" from &usdhc2 in the upstream DTSI - there is no upstream binding and no driver consumes it, so it is dead code and would trip make dtbs_check
>
> Regards
> Haibo Chen
>
> >
> > Frank
> >
> > >
> > > The same design on i.MX95 15x15 FRDM. This should be fine.
> > >
> > > Regards,
> > > Joseph
> > >
> > > >> +     };
> > > > [ ... ]
> > > >> +&usdhc2 {
> > > >> +     bus-width = <4>;
> > > >> +     cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> > > >> +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > >> +     pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > > >> +     pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > > >> +     pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > >> +     pinctrl-names = "default", "state_100mhz", "state_200mhz",
> > "sleep";
> > > >> +     vmmc-supply = <&reg_usdhc2_vmmc>;
> > > >> +     fsl,cd-gpio-wakeup-disable;
> > > >
> > > > [Severity: Low]
> > > > Is this out-of-tree vendor property invalid in the upstream kernel?
> > > >
> > > > The property fsl,cd-gpio-wakeup-disable does not exist in any
> > > > upstream device tree bindings (such as fsl-imx-esdhc.yaml) and is
> > > > not handled by any driver code in the upstream Linux tree. This acts
> > > > as dead code and will trigger `make dtbs_check` validation warnings.
> > > >
> > > >> +     status = "okay";
> > > >> +};
> > > >
> > > > --
> > > > Sashiko AI review ・
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsa
> > > >
> > shiko.dev%2F%23%2Fpatchset%2F20260720-imx952_frdm-v1-0-6d145eaaa5
> > c4%
> > > >
> > 40nxp.com%3Fpart%3D2&data=05%7C02%7Chaibo.chen%40nxp.com%7C29
> > e9bc792
> > > >
> > 4f2455f2cdd08dee67565f4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> > %7C0%7
> > > >
> > C639201589065857811%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGk
> > iOnRydWUs
> > > >
> > IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> > > > %7C0%7C%7C%7C&sdata=hQfdYq0rrk8kvruJk%2FGc32LxLfMMmRAJn7kG
> > bT5BMjA%3D
> > > > &reserved=0
> > >
> > > --
> > > Best Regards,
> > > Joseph
>
