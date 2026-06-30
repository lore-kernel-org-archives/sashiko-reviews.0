Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA03CFF53
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820876; cv=fail; b=NCORGoVVXPTXezETTSpe3UUyrEO6JqfJSB0THGvi9lcL6R28CpLcSy0G1vVhKTYdXbw30ThPdn/BaJquomCAFWhXN32ofDLeRdIy0g7RRP1zsw/MV5xYJWhqI17LQdY1cbeVOZCbszlw03dGwIK+dwZAsKc1jxezZ1cTKLsZlyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820876; c=relaxed/simple;
	bh=a2RhSf6Q8QTCPyV8zYcWg4ZPITWdwsaVgxIRqM1tU2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bo+dkOIP7CyVeHROjAYPWP2RaRtWTwtHavElxo928fan9QR9qQXw3cUcED7BAtCZcqAtrXKK5imV8pkf4U438IjCfzhxChtkPAfOLc8EEEtaLB04vg4DavHcsWEHKul3QbsdbB+JzQ05aNpsHvuaalGqEELcgzFmOgWeexzH+mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JMzgLU4j; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JMzgLU4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7ei/RJDao1PQljGDtCbi0fULTyCyWwfG+SHlkmKiTK7H62tPWOUkHsnCe+EuX2w8TKiZ8Y4TKPBdvJwOdVRj7Y+nbDqZZKMuu4pwxndZ9G70POQH+/Hi/NATrFkQCufD/QJupE79RT11SW/0Liamo1F1pq3J1+W67nEP5+Ui05lwVi0NuHgvt1t+1LP71/hFn/ooiyOsLijvbgZMeWYhNTRHirxZ42X+qIxS2c4506LZ7bP6zzoXQP7phZCaAIkOZ0KJEz219gdFgsqgyntRuZqon4onegk8fYZFg0tJb1AyAXEKzzrIXiJCt8z/9kH6hLDXIQupk5Lg8KoCcHJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGa5gMb2z5bGRwfuTOT+P7tSYdtm0PxkK7hO+mKx78M=;
 b=c7po4pAywI7gh4EQe8yoGT9/DtZmnqdP8I6FL3xc4aHr/ZQQUcS2cczLfkN16eLiOmIvvMb7OZ09PZVyCIzmBVGj+nGMO7Zmevy/QD467VejGxn5ZsPRuiMQJ9jR4/qCGjUiYL2TsAueNZa086Zd0Ii6lnZsDGa4CIyU2BcGbHRub8e1v43pfIdbbHfLmZY6nkLxUGa/vpj7c1a4pb2ck2hqNyi9GGlpQ7coPNjOL6jPPhb4vDkyBLxjRTFgRq1X+ogk7N8BHzhsqtmgIh63fHYXne1VR/RySwIfbbI+Aus3CxdicnSoK8+o1VE1JUc44AE+RBQGwOA1Eo0HF46TKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGa5gMb2z5bGRwfuTOT+P7tSYdtm0PxkK7hO+mKx78M=;
 b=JMzgLU4jDp4XDPcxI5OBBAi20MEkBtHnxFycPUUaUt4t5fKSdnpe5RKJtVbhqH2DFUxo13nnVEiGji7hnMIU4DNoH/MkUsftJtuDhOxV5DNVy0c+NwsOzJp23NFRZWvMjdmXDCEho4i+y3eNRvH0EXdK81Sq0VDw9bAQ4jPOV+R/udwtjTygUIbBs/ICkOzCJdOY7WhMQzl7Rrku51BfSew6oqnfphhQeshdbGDoqM10bXFb+VNGzgy6XtEd7U81+Tl0RT4FX62eqHcLUtN7tfteQtKiPcVhnYq6eacJZIhaQiFHXukzhc06WdPf84ez/rX0509alGdHTfHMk9N0dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DU4PR04MB11897.eurprd04.prod.outlook.com
 (2603:10a6:10:61d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 12:01:09 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:01:09 +0000
Date: Tue, 30 Jun 2026 15:01:06 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: lx2160a: transition to device-specific
 SerDes compatible strings
Message-ID: <jz6rx2luzj7bxhr3674sq5746zpyu2bgk23jwr345c6vaipn6h@rkfjxvuwsfp7>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
 <20260630110459.516364-2-ioana.ciornei@nxp.com>
 <20260630112625.F333C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630112625.F333C1F000E9@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DU4PR04MB11897:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9b1263-8c26-4789-eba5-08ded69f45fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lYyK3IBh8fYPsAEfDLLJNYksxUH42ji4+LNJtUPLt5KOVUU+5J89kY2lshPMeJxN7QXP5Y35AC22Cn4G8TxM5bsxTa3wNaal8ivcwPMvSyJrmpfeC1T3BEhgTh8GwUOVM2hMy0LvL72ORV0R2GAqMDyQQwJP9DEYT2GeZYq2lQQ0M+rz+QopjQZyfH9gjwJVnrj5MB7eHFXbsPH/dqF+J9NllHDYxYOadQrbl3dL2IBSlbgjKbKiC9vskYff//NHR2Tm8O2E93/R8MUTOjBWbW9dFPywS0UyUvWnFAUJ61U0Vi4B5mUjkkA6w8VM7kt9rXWXkxiK9E0tTstjBzRi0hBi9D5smYsAur9Nm09rvI7dO2rmWGD8tbsc6gDGuBTPe30aNhlEN57YZCQk7T2hWYN71XyNEbr8BbsuSdQyoJ+82xhGuf+ie8XCEwFS6lkpdmSkyZDvp4YWKjEeq43ogmHHDZXToBXzORUqiafej9pGKuclOpd6dju+c08xz1CqhCMPNev9EczZvVwoh2KmIrvh/UAcN17EKLP65nI8uCTiFXfxlJ0ZM0+nPZ02q1CrlD7wiBrwPc5B7n3rCWvkA66y+xX237kskRbNqiFnC4IOCBotObjtE2aygNWdPsFw9C3BYFjuoUFvIzehsyLyZwkjW1oLMsYxAWBq8PWPb+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VnQTwNG1pAq+tJcw9c8lsDmq1D/tZJileHzuuJvBNqG4mfbOlL3QT8Ql/1MA?=
 =?us-ascii?Q?ORtfEtnkq6R3I1pv7WNd+afBA4QZM+9qa3RgjgBNKPUD8CrxJiwa4gcJ5v1R?=
 =?us-ascii?Q?hihZfbmY5hBK6L59JJQ62U0x9kdZY1ZotlW9Diu2KJSCcRAh8sUErysbTvoV?=
 =?us-ascii?Q?yahpBVqW+DuCIxQzDznI4E2aRXjiVi3swWSNYh14zVVS2hKQtYS1IeXGqXk6?=
 =?us-ascii?Q?kEKSW+vgM5Uz2Z5dOsV+VsYmRuW+/buSKhachxaTKhzezb6FhwkzRdsInAf6?=
 =?us-ascii?Q?b0n1INMSCE2hyiOkYqEdDaMzQ9U9lp+wXfAw/fzhPSZJn4UCtM2kAsmY4c9I?=
 =?us-ascii?Q?ROEXBk2C21sjrDb2pChXAR4hg3RAN7KlzECuIqb6kN+Y8xMTCsvi9to3vVw+?=
 =?us-ascii?Q?1/EINgUzxe7qdoNHlgjfXP57IpmaN1WViXe24/9namJNF94lr6B8sD1VPQcq?=
 =?us-ascii?Q?fgvyqpcWUalfS5U5ZKeNgNUD+o+qHIBigYJNu6Q+47Jf+haNtEkU2HnJuDcU?=
 =?us-ascii?Q?cQnYLU/KgL7mU5s1kAhJx6rLQIEx58sGOiqdKj25n2CE4l5RYIlWPhWt6I0T?=
 =?us-ascii?Q?mrKcowaujtZjwNeIYnZG9OMNxbdu0dqmubw6IYoYAn/kyixyUwt3T+f4m0NZ?=
 =?us-ascii?Q?ZBlW1yjod85dr0iEOolg9Lxec9m69wqJgwIu2OY5iLvU6ODY/G8H2Lsfxjf6?=
 =?us-ascii?Q?BPn0zrQjZP/dkc7jx0ggDZKJ13u+l0U3Z78MhlHDMjMDbLMBScE4vWT/+eyZ?=
 =?us-ascii?Q?hBzVSOHiVg+q48B+94fyS/W7sDcV5+d3U0uGlHgPXWp9kLv8OPrGJg02ykMP?=
 =?us-ascii?Q?ismLlJpG8GyIzKMDH3nwHD6OEj9oohYs4EfkcYzOysmVQATYBB8yK4z9tUEt?=
 =?us-ascii?Q?UVuvwoGM0yna9bLXI7JAobSkeqh1LU8ft50R5RY64SEzDI5BwDcSZAZbHmhz?=
 =?us-ascii?Q?cyHVCb2e0DeAUYxKBM+SHHFp5tFRcQwATe4/1Xisl4UU+PVMHF9opaXqD4CR?=
 =?us-ascii?Q?1B/FqEeRLh8AN1w9/9oY9oSvKWjXFXHXkqEpIcAhI7K6EJOCYTei9XPxCWyl?=
 =?us-ascii?Q?sILzm3clICLkZktQohpkzd36Dvxkxvz2edc7/aifOSzXlBey8MtIaWV/2oT4?=
 =?us-ascii?Q?2qWd9Z6fjq1ai4LFPxrEz4M8mWD7hyrNqV7aGrDSCs4hJYSKIIbfqOs5A2Sx?=
 =?us-ascii?Q?oTUNSGV2meEp8+31fn/0Woe29wauHwdvmMW5K59F09BFxQR45ffvD1QooVDg?=
 =?us-ascii?Q?cpx+/CkyS++iOvWU02kntDRv8L+TAXkyKAmz6qK22IKfg8KuCltxgILuhPLw?=
 =?us-ascii?Q?e8B1QLP99pzqDjT5bYMHdQP2su7vIK8dLDmn9oUphEHMx++9OTOCGNBlXMwW?=
 =?us-ascii?Q?+4Ivc6czoiXuwiMvY8PqYw0xSFFvjMas5KjOqFiHLMFZDql0O21lJ3YxRllO?=
 =?us-ascii?Q?oxOGTZWEv49hmMeesPD1if2rs57+Qj1gbXAlhUNyWxKvR+eXCLTrI+n2YeMC?=
 =?us-ascii?Q?gprmcUsCcLVtOpvytJfcXpIajTrS7Uswk3TvtnbwPVe7M9VRUHl2WSwJ5kRs?=
 =?us-ascii?Q?aQo3plRc8DFUnKPTqv8TThILbH7L4eJqrFStYNet5FgA4+2p6DJneiH8ZWVc?=
 =?us-ascii?Q?IiRSZ5NxQGN9XcnpKkRlbYXlJNyef2bbNkuEdFEXf145xlEEVvwTLk5IOWTo?=
 =?us-ascii?Q?BT9dyH5F6Mbe1zYCWB8M5KET6PMFbv++Oko2yNjTN0qpje9OtwgSk8zGF6nC?=
 =?us-ascii?Q?5+eKY2F/3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9b1263-8c26-4789-eba5-08ded69f45fb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:01:09.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUoqsb/E/eS8Vd+2JoiqAeXXVbBK1YeJ5wEp7wgoGfk5SMnxYz+X1QQ2nClifs7XDgVZ6kJ19YtJJy1TmQ5Vaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11897

On Tue, Jun 30, 2026 at 11:26:25AM +0000, sashiko-bot@kernel.org wrote:

(...)

> [Severity: Medium]
> Did we miss updating the consumer phandles in this patch?
> 
> The commit message indicates consumer phandles need updating to match
> #phy-cells = <0>, but they appear to remain unupdated in the device tree,
> and #phy-cells = <1> is still retained on the parent PHY nodes.
> 

No, the customer phandles don't need to be updated anymore, both modes
are accepted by the driver and dt-binding. Will remove that section from
the commit message.

> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > index 1d73abffa6b72..a687eb3e31904 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > @@ -621,17 +621,163 @@ soc: soc {
> >  		ranges;
> >  		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> >  
> [ ... ]
> >  		serdes_1: phy@1ea0000 {
> > -			compatible = "fsl,lynx-28g";
> > +			compatible = "fsl,lx2160a-serdes1", "fsl,lynx-28g";
> >  			reg = <0x0 0x1ea0000 0x0 0x1e30>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> >  			#phy-cells = <1>;
> > +			status = "disabled";
> 
> [Severity: High]
> Does this default status = "disabled" unintentionally break interfaces
> wired to serdes_1 on boards like fsl-lx2162a-clearfog and fsl-lx2160a-half-twins?
> 
> These boards consume serdes_1 but do not appear to override the status to
> "okay" in this patch.

Yes, my bad. Will enable serdes_1 on these boards as well.

> 
> [ ... ]
> > +		serdes_3: phy@1ec0000 {
> > +			compatible = "fsl,lx2160a-serdes3";
> > +			reg = <0x0 0x1ec0000 0x0 0x1e30>;
> 
> [Severity: Medium]
> Should serdes_3 include the generic "fsl,lynx-28g" fallback compatible string
> here, similar to what was added for serdes_1 and serdes_2?

No, SerDes block #3 should not use the fallback compatible since it
wasn't supported anyway through the fallback.

> 
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> > +			#phy-cells = <1>;
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
> > new file mode 100644
> > index 0000000000000..b9629e074d943
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
> > @@ -0,0 +1,24 @@
> [ ... ]
> > +&soc {
> > +	/delete-node/ serdes@1ec0000;
> > +};
> 
> [Severity: Low]
> Could this /delete-node/ directive fail at build time?
> 
> In the base fsl-lx2160a.dtsi, the node is defined as phy@1ec0000 rather
> than serdes@1ec0000.

Will fix.

Ioana
