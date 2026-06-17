Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6083E5570
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707982; cv=fail; b=QfSv1usLUcmkK8sFNVwAUTMZOXVNzEBIyns5eLGf/bzA3wc6cU+MFXEnae9HHG/ynjjB3kXL+amrOAzmU1sCPQm0dMdDP3IXG/i5FhDRtrAgNFKUjeU+7uGPfsJsBDHIZdeA87iCSnGTwNjAM58PLUItOkUk+rlXhhf/S8jIl7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707982; c=relaxed/simple;
	bh=7U8hlfqAJV1eY6db42fVsK0SQTfy2me0peyGMEr4mzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gaPe8PzMuCL9BA92HeKO5SWxRJWSxFzcPRujBGN2z/CLv6OPXHxpn8MmdJ8sEj/qiLvTniAr0vbZaNiFNpJ0s+1s8Bz5jJQZ0ws2pQI6gi6ELVHd93IIbm5sGPftZo0H0ZBRYLTaLhPZfcsCH8/2IeO0UYWSdqo8s4TmQ1LZj0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lSIirCEz reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lSIirCEz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THmCa29w0/0G37hN+e1TLM4pamXI5/nPAVOkhfrg1aaX1cl2ZrkvOcJhMc8I0wHl3oKsdjMHcoJ4ouHDduVN97Q2U1R4FYhR6WSMc9SptW8w/7miP4aJa9f97aDKdYhbVasu4i5+iY1VSqB9D2d9WG7qDcond9lFYflEAKmIbu2drJjL0u+2g2xShMJEW3S8zvzN8fkRZLdPiMB6EsKOzBlkRMs2wG9x6+JYVIoc2vQT1DDId8ggf8aMc3StRTmglPJJ9rIxn3od4MDxqWlvAGsyoO6geS/BkYZUIGO9yQx8VRj6o5PWYokQt1CG2cGMBtgw72A0myhAKS0BGHb8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQP1JVKiwqOU0zDKjFEJSF3uTacR3Sugq3u/tlkjpbY=;
 b=VuYpFa9rztQOwR1MTYLp5ruNHAkEq+KmBLIPND7P2r9zvrkWthCPTi+AwzAwubOLsSw95rO+gEYQzFUti0wlYWMRoiEbYZydjTNHUVcAn5pF4ubRk/MeHt8644Qv2hsJ+++9lEpkc44FSoorlRcvtiX4A/gaFGsSvZp7isMlS3Gu74p7r/XBkzBvYnQX0l5qfAMRcLO222MxSsqQq6RRumYrdNtKszUlioNRFVaFBdTM580NrSMOpvI8fVwWCAPyipoapO68CPBOV2x5yMSRZJfeHeJHySwngQ2Btfqnf2RCx5RV9Bc9S86zcj0mAMpIhe3C3onO1K5M/q5LitHKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQP1JVKiwqOU0zDKjFEJSF3uTacR3Sugq3u/tlkjpbY=;
 b=lSIirCEz62A0CTjodqcVw7gNhxnFMMlgepwwaH8Qur9l9gI46j3xfI49Rfosv2jo81DcCaPRq/gw0QPXaCjLT8/1iyiVGtWzTG5nyBhoNWUST0ObWtWL2Y5RGuAC3aBFSgHMNw7w6z15O3PoeBmYx/ze82VCAdtZeKehqwpdvkPrijYQ8wsfEa0F5HScdSx5cqLwMlOjDz7AqLaengU4n1GuWdUZ5XQP0ioeHZM+6rKJ0ZTtcHVIZSG0rVcbQjhSoYUIAnvoaF20+SFdNoIyxZ9l0YZASoT9d8hiZ27oT1FLCbi4SF+DY2wEttobbjlXr75NGT/3MsspdaIwcQKH4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7947.eurprd04.prod.outlook.com (2603:10a6:10:1f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:52:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 14:52:56 +0000
Date: Wed, 17 Jun 2026 10:52:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-i3c@lists.infradead.org, Frank.Li@kernel.org
Subject: Re: [PATCH v12 2/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <ajK0wrNxxlhvaRvT@lizhi-Precision-Tower-5810>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-3-lakshay.piplani@nxp.com>
 <20260617111331.7AB671F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617111331.7AB671F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:806:126::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7f7c49-8648-4627-f139-08decc801deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|56012099006|5023799004|4143699003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aAD29E9Xkbpnit6+XyKw6uPAjY3ne5Fj4QLO3lJoYoHMWCoyY7xQtIejH6a8qMFeAtxYEamViHvfst24H+gYwKaDvfd/JVdJYDlh0ub16IawOFs75aUo2VZ6dAHyp8y2bVgrCBcoSuFd3ibGp0vudDOX3GZ1s5/fYBiHABbsnCh07CNwtXWx/BEv7O3EribasPUKM/kyggURvhlwxdHoV+X6Ph0OQ6nVsTUkWFX2Vhs7PXtgxPAv5MrFN+xmiwPcqVP0Z5sbqWRtnjV3ykDqDpwac/24G1B/wgYTw3q9BiPA5egWsKj2tpN7thAPinc4XtzSa3EEwrJguqhMDSdsLd3JD1tP/I2itY7v8vfLdLpCOsLO0jzRJVsC4x7Z18qlNlqTvfazYbzZNaRW05gTGPufP+CjLwnpzWaULYBHbps1spfyaHDsm+bHz1n336cf6pBgLFHa1JOpmIZWksWAJfvsVcLUiNhzig4aDhCoqNHCRD3o2EypoUII1T/d8gqIkjgc8xZB5p6PqCrWDoUYzU0SQwc1N20cWOpAujhYaNLHpzyMAfO4p8S/woBzO6pzmmI8bUEmomJdjC7ZoI3W8KvXNUpBy/rMPnS926ve2lUseVeySd8MJ2a+XhNxfqis
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(5023799004)(4143699003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eppYw6VfNV2v5xPalB1VjvWzD7GXx6d7kb4AHI+QoRwjIFWDf+CEjUlLTI?=
 =?iso-8859-1?Q?E31fQ51lvytx6rwZozy1f66CnIHHd59tKoMXxDt10nnRIRVCcbz5NyjfGA?=
 =?iso-8859-1?Q?ZbKKfzmVPDRSnuC6iKHSlHtMOidkYTiwBQvkyowB4/VSFT9oxERYajaYpA?=
 =?iso-8859-1?Q?4nPkx1vwPyRxhX/T2FX/ccIEFsFCloGtw0yh3DbOOM/8PHsSWJrzTWdSpS?=
 =?iso-8859-1?Q?8C34aFUexunfKiKC8mO9KCr1gC/VWgxoj0mnilMBxLU2fEFU4yHle6FeIM?=
 =?iso-8859-1?Q?zK5H1dUBbv4//FNvSmW8EwOKRMv5DaWjPMJtEcdix8/HVvar/9ZPh25Gtp?=
 =?iso-8859-1?Q?Hu4DUhPyBxGDhmIp8zdKu6ptRuQb0vuuBxs1VgUyOa9e/WBUANQ1rgc+ol?=
 =?iso-8859-1?Q?li5sVjDMALUSr6AD28WNNbTEmb242EfsUwszt/+RPq8xxdLktUwFsAHmL+?=
 =?iso-8859-1?Q?WZGqAV0MeKsyV3Y2ulibTozJcMqcEdM/EnH/RjABEAkPzsjabh0tkzJ4hi?=
 =?iso-8859-1?Q?m2FTxHxLfSUBJfCXMVp8U1qDIQdAwb6yZUl0mTEll7JvxsJqGYz3jMcOdr?=
 =?iso-8859-1?Q?V73/JS9C3A0j9JFwWz95DhLgBsZtdNuer+l1kLA7w/zZPdmsqujpwW1i+e?=
 =?iso-8859-1?Q?tLPlDiPOGIIstbwnL7sCXvfoUiiopFHaIOSBxCKyNLg5AfGzBbPV5wCWJu?=
 =?iso-8859-1?Q?qGcgB8eHdKPNWqSSrZGrz2VTlRpfP1t1JZjiLumSqsyL1T/xVJks/OQltM?=
 =?iso-8859-1?Q?KFOj73rSCZ/vs+DFk5c+3KgjS393mLiVW6ByeBWwdyfn28UJWj71NUH8co?=
 =?iso-8859-1?Q?zglREuLZfv3Usy1EYm66ESBUWMAIWRXV5jmo5E6F3pNxiTY14sB2bjlglD?=
 =?iso-8859-1?Q?MoEhr+o/FdJ1uZ7ww7PzAg6KqMoCwWP7ERqIaJc12WSVYyRVIDteLBWg5G?=
 =?iso-8859-1?Q?cUohrCJ6yGslUCBKstWreAhQJWvda8OLGmNY/fmEJqeHcVB1cZNitPOp80?=
 =?iso-8859-1?Q?tRR/1v+8kN6XqhnMnB+VRCZzbzjzC2DBdC2HaMEqhQZt0wBzQ+pG6KiKn2?=
 =?iso-8859-1?Q?1CWawUvPfCVUrZh/8kdtvRiNDVnjvM4+MgmcMcYkEFZLpN3RTpasWvByLd?=
 =?iso-8859-1?Q?Gec0OovsapTiPwix9JEVF6P71A1fTxom/Bdwtz5wVS1ZwKSqtY/+jZ1V+e?=
 =?iso-8859-1?Q?TWKTmIVGGuqwsjL/OC+zumlb8qJXMrJ9ch9xjZKvV7eC5KR/WL9d+gkUZy?=
 =?iso-8859-1?Q?EGGV3YYRAyG3HLPdVvmvb2TSKL20+1+iD1nQUENr258U9Ew63F2Vb/xnov?=
 =?iso-8859-1?Q?8oFO1rzowQiT39Xt4b1DEY6MRrZrOoQAJ6iFDDz+ne7QzvRPhqB8WX4r5C?=
 =?iso-8859-1?Q?UxIKTyYjR4t96p5Ta67G7EKNY8RG5XH9AYUffvrygoHLmLO5sOb/+mTRvl?=
 =?iso-8859-1?Q?PhD7xKG3W7rC06G75hAd3GdSlsWeO+MnyPjL2F+q8hyYuzN+VA9Aile1qy?=
 =?iso-8859-1?Q?1QcnFkCJf3uGpSIyVcdeK8qaoxD6/3yVYLgd5ZscJCpx/z6kvtnMoz2PHt?=
 =?iso-8859-1?Q?7uPej1qrwygTNdhGF42tUmPG2cOHWZ7Gt0TofvgJQYNEiOgR9EVzpnqtPW?=
 =?iso-8859-1?Q?2IpBlohW5Tivs/KQ3VeguP/WomwbYNHKCtB6JV16GKXqbEA7fx/5VjILYd?=
 =?iso-8859-1?Q?Kp0hSwQTPNaKpugJtVi+fvV1BiWuaOyr/QJFyAItdxzSwdziEeZ2q1M4zU?=
 =?iso-8859-1?Q?q0wV4f2+t+XKNkGVZ4sIIyF58Q8P8UxZpaFIRhFuJv3SRPStCG1eE0VdOi?=
 =?iso-8859-1?Q?4MGZTNEbB269FhBgUnkSgSEkJnV9CT08WgZUq20VRosNlyNsrCQD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7f7c49-8648-4627-f139-08decc801deb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:52:56.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1vwUha+tkCgBFVF+5rTOY9f9wDnoeitu5PqV8RZiYhSnjri513/37F6Rig82/+jszi3ntlURF6WT2drmCvgHqotX77MpP0IX868WvR1v7643YKz33ZcV0rDjk0CSoKe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7947

On Wed, Jun 17, 2026 at 11:13:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The binding documents GPIO capability for target ports but omits the standard GPIO provider properties, violating subsystem guidelines.
> - [Medium] The binding fails to include compatible strings for the 4-port variants and unconditionally allows up to 8 ports.
> - [Low] The unit address in the I3C example does not match its `reg` property.
> --
>
> commit af3b77595fece3e15864b37b9b683be835a0e1eb
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
>
> This commit adds device tree bindings for the NXP P3H2x4x multi-port I3C hub
> family. It supports connecting a host via I3C/I2C/SMBus to multiple downstream
> peripherals across up to 8 ports.
>
> > diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> > new file mode 100644
> > index 0000000000000..c080eeb0eeaa8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> > @@ -0,0 +1,291 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2025 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP P3H2X4X I3C HUB
> > +
> > +maintainers:
> > +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > +  - Vikash Bansal <vikash.bansal@nxp.com>
> > +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> > +
> > +description: |
> > +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> > +  hub devices that connect to:-
> > +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
> > +     peripheral devices on the downstream  side.
> > +  2. Have two Controller Ports which can support either
> > +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> > +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> > +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> > +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
> > +     peripherals.
>
> [Severity: Medium]
> Since the description advertises that target ports can be configured as GPIO,
> should this binding include the standard GPIO provider properties like
> gpio-controller and #gpio-cells?
>
> Because unevaluatedProperties is false and there are no child node patterns
> defined for GPIO ports in patternProperties, won't adding a GPIO child node
> fail schema validation?
>
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,p3h2840
>
> [Severity: Medium]
> The commit message and description state the binding supports the P3H2440
> and P3H2441 4-port hubs alongside the 8-port P3H2840/P3H2841.
>
> Should compatible strings be included for the 4-port variants here as well?
>
> [ ... ]
>
> > +patternProperties:
> > +  "^i3c@[0-7]$":
> > +    type: object
> > +    $ref: /schemas/i3c/i3c.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          The I3C HUB Target Port number.
> > +        maximum: 7
>
> [Severity: Medium]
> Does unconditionally allowing a maximum port index of 7 cause issues for the
> 4-port variants mentioned in the description?
>
> It seems this allows invalid configurations that define non-existent ports
> (4-7) for the 4-port hardware.
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    i3c {
> > +        #address-cells = <3>;
> > +        #size-cells = <0>;
> > +
> > +        hub@70,236153000c2 {
> > +            reg = <0x70 0x236 0x3000c2>;
>
> [Severity: Low]
> Does the unit address in this example match its reg property?
>
> The reg property combines to a provisioned ID of 0x236003000c2, which appears
> to differ from 236153000c2 in the unit address. Could this mismatch trigger a
> simple_bus_reg warning during make dt_binding_check?

I remember I3C mask 0x15, it'd better kept node name consisent with reg

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617110355.1591844-1-lakshay.piplani@nxp.com?part=2
