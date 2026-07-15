Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF243F4112
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134085; cv=fail; b=SVRRV05XRxmjeHK7cyeCa4vRwSFs7HX+jC+ioKyO3hrJ6Dk12ab744KCskyDXK77uiejvGU9ZcsOVmTa7712SVLBxmjlqCyPPZuJ5XR8ek6qS8YsOiYxE9Pn3wwFyPeKW3q5R7iYUQEgBEpgqSteb7u055cPAMzAV3iTqEc1Ohk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134085; c=relaxed/simple;
	bh=yHn40K9SyEOCGRbbdKi+J7NWvEN92pjCYWbUFZatYss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y90su4raZT/i/C3v2ai+VTXMSff3V8iBC2dp1rcsHYxjl/sLpJG42REk9uSjJj6cT/HHGCrpjIozliJz51ZMmVho9j+Omil1tQDYMuoJCJV/kd7yj6TPjG2++7y5LfEv08r1SzP7/dlVenY4NkeJgr22Vwk4VU5cHw4XQNj4GU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vwo8adMb; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vwo8adMb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgxgCx1+FLCOZoThaG8mPoBXE7RcfnIhe7PeAGnn3JZPL+379NALjElG9kN+El+yhPkqbrUHFP29r5OAhcxVVA4xKc9iS6gNA1lg5x2iT41Z5uqRc00jerWoTfzATXFOJ9PsMM03x+1yilXb8AUhu4VqQAPxNi85CMspxwZwPjJymXtIN7V7hjet6IivicNN1shq8rwM+DJyqtWSxXM1hFhmdVWfbSPHsG5WnRyEh3IhiZbF/GLlZEk1PIaE75Wnaxe3/DGmkZThalqbECUZjvJf5URemiW9UFjStY/R/7yWyNPnkw62uiT+lZVRlQfosyEIPHWODIDuggZDcZ+QKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiQldvNUsnWhgVn4eDALepOMtE9cM50bBdznHJf01hE=;
 b=yk3fMIK4YYQAXsn19wgxb9UFybMBPWl58ccX4bJKCUa6PK9J2aDwDJKIKtYBebi6y8yjeWlSkx/x/G5ZRt46Vb9AIP+Rdv5W+p7Vnr1dm5c0u5r2mwu197UxtW+XG/rJiuP6UJA3dO6ctZ62ndeGcslDOhezvj6e42ZlCQljHjUAkd91pL9dkqK0XwkwNMYSLerh0xWm6I3gwaCxjU+A7vXJESElhVXt50p3M3JtwbiebtoSGm0FOSEt4eWFwLP944SJbpYNtt0J+srvZT8zwBaqfZZzClcS/r1uoTNCp10DqkjtSGJnSrdSMh5+hyiXTRrENU7WZMPYWCLTHTuSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiQldvNUsnWhgVn4eDALepOMtE9cM50bBdznHJf01hE=;
 b=Vwo8adMbXfkyljp30AAArjt/eD5xdUuHWA3MMN5ZMwBwB5pVGS3xlx5kf2SD9oksMxfMQdJ6LMhV/UZgVX4yiO9i+2zGsq6XGkfldnlfRqeu7kGBlpm5M+UjZ/YPauvCrBy/f2N3/yiohtiOr8WlKn5CAkajbIZam+MrgJCQIFd0SDDjfQ7GD+QSIzulVuC2eiTocgnM2HkNjg7jXkmJQiuDL6UPX8h0yNp5BOQB+0KstQ/vGG6a0hk8rHVq/iIyhmJl3qg0U82DrFHCuJfDtnOJjpBA8WJ1E6Q78H7jYQDvZXNckOUO6LI78kFcidZeoJMJfZypyNILS6uFHl+Vzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10322.eurprd04.prod.outlook.com (2603:10a6:102:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:48:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:47:59 +0000
Date: Wed, 15 Jul 2026 12:47:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: sashiko-reviews@lists.linux.dev, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address
 Assignment on resume
Message-ID: <ale5uIQgflO4sjz1@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
 <20260713135032.ADFB41F00A3A@smtp.kernel.org>
 <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
 <5e17bba2-9259-4d39-8170-275927835943@tuxon.dev>
 <alaGq8mKvCm9kWao@lizhi-Precision-Tower-5810>
 <1b219dc7-ac56-4534-89ec-55e19a5d62ea@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b219dc7-ac56-4534-89ec-55e19a5d62ea@tuxon.dev>
X-ClientProxiedBy: SN7PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:806:120::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10322:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0b24e5-80ff-401f-9047-08dee290d417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	rirAjrax+GSRQhejzpcIcjXA1ICUBA8KPQ/iQXpSAWQnPHM9kRtNQ5bQ8mDoruG3B66jdnR0IaWnh7CJWLcnNYgvc2a79NUiX/9CjP+Bb3s359lbRubGc/h2WhyeOlGmaqHoGzMrPd3/3BF5zBk9bqDG/cpLzdlkLuZOC2y4ifotUYem67Iv79G+ivdrCjZDePtbCg3pCCC9is2juuaR75aknl5A2oKZQDt7SwkjxHII8wgVUfsFvhRyIKW1RLQYhREPDUwxG/MUu/VZlKa7z3Inbh/cInXVLHkfCbI8wWsUPqdINs4lLUeytQSw73pj0yVo2RkvVmKfabt9XqpdfewFa730Sb/5Pyj9FaBW00NXijoRVr7rtMMdJrI5s/KQ095qJ4vG4gl7idv4Shr2+jQisxoB7hhJkvEm6Rfibrh2cnVCv/4dSGuikAZ622FVbL1P+U8rDuaPFOFk2qvsnsnmUZV6V4Ya/0fmeCw3f/8yepezBwMRG+loLVry7liyGIa312DNf4M8oP0P/ZelPqndxBJYJfAmALWoKuCthjkXQo6QZXnQJxdr7xPIGCLksawAZLBMnRj1gN6FTYWy7vPCAXFgV7A+xfMlV0GVKSCR1ZUGlOOC75FCxpNDH/6xpSi4Hk+U24jV+Y4L3wLnfR/VfxSYWTXMb0spbVaCiDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5nQRWo4J3iyJIqIuionrWCJUKB5YbNqSMp++hUg1qb+rSkhaLXmnjdHfnANb?=
 =?us-ascii?Q?UK5aYiadB0UMda0ASPhkTOlaOsjkFjFi6Z+8IdVeAf7AjbZaG3nSu1k6fsWX?=
 =?us-ascii?Q?4r4ZH6atg+/PkZ2Pk4Sidk9sJ8pK7Cn+ih2JyxIMc7Xtsaj3nvTcG8ZBRROf?=
 =?us-ascii?Q?7WBegwZWq9mhiAHf0+w57jCdoWkdGiLVqSSzYjFPrWNm0iONmHd729HNe08I?=
 =?us-ascii?Q?0mr+FT3lnxMfb0OQxUKSV69g/MCdD0BuF1Tm1h3pKDzRWl6YJ4Iq+kjiIRmo?=
 =?us-ascii?Q?EHwlul8FKggz+yjtZGjldph4jSLtkPFpBBxWSgnO88y2JB8kZTHci4r44npN?=
 =?us-ascii?Q?3JxpO1WpKwayyq8/2wGfcsSZvd4XKWmZg7RxqycIYmoARzJfV8iJ5Nzys4VB?=
 =?us-ascii?Q?QwXfdozjvLGsidbUU9AKrLixYJrsjzxxo+ULeaSv+wNKxpCDSIS52FVV5Bku?=
 =?us-ascii?Q?tkazC8X5QXGqUIH4Kd0UUVCdmzcaHT6CjNGAeRiLvZ56ZoWaqQJfnbMZdmyP?=
 =?us-ascii?Q?6pdDjO5V23jt5rqzJFWd/XpMaO99hZpaU+mA3J87HdOz8Szx917GH1dTD6Ew?=
 =?us-ascii?Q?UqLeaTwi4FzUCEkz+MgXdPYMtpC1aJISCWDGW8l2/1sODTa1GiUBG9pIcHub?=
 =?us-ascii?Q?CPjv6F0dHFSYfQgIllszhoqkrQhyBard3RUloNlIy20uWRgldOYxjjDTkl9S?=
 =?us-ascii?Q?kSn+d3NLC+5LusAsvbiuXDoaC96z27CJthEQciM/J0wDwsCltWl5OAwIlMPQ?=
 =?us-ascii?Q?nGYP7KzW/zIA/ZAs9Rr2LLIOfFwHLETzhyIqUsO979dKYLoCDj6BS+7fDgOJ?=
 =?us-ascii?Q?kI+9ivgUTIVJTl27BRNWR35s7uyow1dOwmU46VdFQowJeSR7gylK7bOdFXY9?=
 =?us-ascii?Q?YPYhXlScPn1xXtCnJwXw+ToBdj67ux0uXFXUeGpjh6YcV1EJ7KfMDv/Cf+Xm?=
 =?us-ascii?Q?d5gvHiUG6wGNHHDyZQvF16PlCrdS2H6sCiZqeJilD4GZ1qIXslIMUnlY9sNU?=
 =?us-ascii?Q?5mI55gb1x9YCgn0XxGO3NtXBe95tsyZaZpaPaHQkB2/xBSUz9lUhIsZ5Ith6?=
 =?us-ascii?Q?/zw55tXx0BcKzFf70uemA9BsO8Tn7z9RCoEYzhlTG1eNG0ZjK8Ut82Nssj35?=
 =?us-ascii?Q?FViLSjLtTw+I1UgBAd8+pkOwyZ0MdRrMLLIUfwmIjsNfEPKi+zAc1WWwSx0P?=
 =?us-ascii?Q?VJE2f6wQlCtZ88wkL87eCvOzfiqUG811aXr02h26fBBWO3vb1YEB8HhEIOC4?=
 =?us-ascii?Q?KUwkYKt4etC9FzxCJwOhaKHAPLa/1b6e/bs0q3/A5CIiC0Z6JBGrhInKxMki?=
 =?us-ascii?Q?qHWkTvPrxfOrK57GSvEFeZJGKsqDEYDPFVtbxdaqkzmIWkzk21v5PPGW+pSB?=
 =?us-ascii?Q?cvpo87NTB+ULf8Fd7DY/XMUKG76/8sW+EFm4m2KuyLgXnpUHtxV3LbFRhmuU?=
 =?us-ascii?Q?WMB2KmkYlUcibgN2D8ZnGAyEUkzT5KS6Xf3FZDqnTWcPO8mGGpmc3mvTPey4?=
 =?us-ascii?Q?m9X8cxE9jymr/khp588nMy+cmDI1o3k9oLEOpQzCs2KntJqIv/Km0bH9RnTQ?=
 =?us-ascii?Q?7/EZw60v3PpdvjSZwPdwHrvw0AmtaqonaWVZ1Bn4L58vMhHACnDvxJ7o5zYZ?=
 =?us-ascii?Q?N28JRYxVFI4VGsJJ3WO0pT8/13JkI3VuRCOgwyorDjoImHHGhGNEq+gNEoQl?=
 =?us-ascii?Q?SziDZYP1AqH3pnpcIq5ovzpmoVD9vgNaL4z7+7Dq8IkfUgwgyIIhpVlIb0/h?=
 =?us-ascii?Q?AxjEsfZiLlDOiVeKGvzAmw/+Yhg1GOnvWHcnDbQU9zBgzJtxTeMB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0b24e5-80ff-401f-9047-08dee290d417
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:47:59.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbDj1peVS9UwVsZ/P8+VV36KwStdudCBaW73hRnHgDkLN7Jp3P4vg0Qe93MtZPERvZm8tvaUBCGp1llx/SjPL8+k0cPxhmzBHe4+tPfnWfa4eWzOR4sLAn9svPXzLxJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10322

On Wed, Jul 15, 2026 at 12:32:01PM +0300, Claudiu Beznea wrote:
>
>
> On 7/14/26 21:57, Frank Li wrote:
> > On Tue, Jul 14, 2026 at 12:30:13PM +0300, Claudiu Beznea wrote:
> > >
> > > On 7/13/26 19:59, Frank Li wrote:
> > > > On Mon, Jul 13, 2026 at 01:50:32PM +0000,sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > > - [High] Removal of the DATBASn save/restore mechanism completely breaks the I3C bus upon resume for previously attached devices, and fails to resume if the bus was fully occupied.
> > > > > --
> > > > >
> > > > > --- Patch [6]: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume ---
> > > > > commit e4ac838c055dc33beb2ff4e8968a032da48a2a47
> > > > > Author: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
> > > > >
> > > > > i3c: renesas: Perform Dynamic Address Assignment on resume
> > > > >
> > > > > This commit updates the suspend/resume operations by moving them out of
> > > > > the noirq phase and attempting to perform Dynamic Address Assignment on
> > > > > resume. It also removes the save and restore of the DATBASn registers.
> > > > >
> > > > > > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > > > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > > > [ ... ]
> > > > >
> > > > > > @@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
> > > > > >    	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > > > > >    		       MSDVAD_MDYAD(i3c->dyn_addr));
> > > > > >
> > > > > > -	/* Restore Device Address Table values. */
> > > > > > -	for (i = 0; i < i3c->maxdevs; i++)
> > > > > > -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > > > > > -
> > > > > >    	/* I3C hw init. */
> > > > > >    	renesas_i3c_hw_init(i3c);
> > > > > >
> > > > > > +	ret = i3c_master_do_daa_ext(&i3c->base, true);
> > > > > [Severity: High]
> > > > > Does removing the DATBASn save and restore mechanism break communication
> > > > > with previously attached devices upon resume?
> > > > >
> > > > > Looking at renesas_i3c_daa(), it explicitly skips hardware register
> > > > > initialization for previously attached devices:
> > > > >
> > > > > renesas_i3c_daa() {
> > > > >           ...
> > > > >           if (olddevs & BIT(pos))
> > > > >                   continue;
> > > > >           ...
> > > > > }
> > > > >
> > > > > Since the controller was reset during suspend, won't these hardware
> > > > > registers remain uninitialized (0) if DATBASn isn't manually restored here?
> > > > >
> > > > > Additionally, if the bus was fully occupied before suspend, will this cause
> > > > > the DAA process to abort entirely?
> > > > >
> > > > > renesas_i3c_daa() {
> > > > >           ...
> > > > >           ret = renesas_i3c_get_free_pos(i3c);
> > > > >           if (ret < 0)
> > > > >                   return ret;
> > > > >           ...
> > > > > }
> > > > >
> > > > > If the bus is full, free_pos would be 0, causing this to return -ENOSPC
> > > > > immediately. This aborts before the ENTDAA command is sent, which would
> > > > > leave the previously attached devices permanently stranded without dynamic
> > > > > addresses.
> > > > Please check this sashiko review result?
> > > I tried to address this though the versions v2-v4 variant of this patch that
> > > I've posted previously but after more investigation and thinking it looked
> > > to me that the solution to this is not that simple and related only to this
> > > driver (see below).
> > >
> > > Last time I've asked for some guidance [1] but got no input on it.
> > >
> > > Apart from v4, I tried (before posting v5) to use separate free_pos list to
> > > be used while resuming, and still use only i3c_master_add_i3c_dev_locked()
> > > in renesas_i3c_daa() but that didn't work either, because the devices
> > > (present before suspend and) discovered at resume, ended up to be added to
> > > the new list then deleted by the code of i3c_master_add_i3c_dev_locked().
> > >
> > > I have also thought about increasing the free_pos bitmask with one extra
> > > entry while resuming to allow attach, detach, reattach work (for the devices
> > > connected before suspend), but I don't think that is going to work either,
> > > and looks hackish to me.
> > >
> > > I also tried calling i3c_master_detach_free_devs() (only the code for I3C
> > > devices) before running DAA on resume but that wasn't enough for the
> > > solution to work.
> > >
> > > I think this issue reported by sashiko can be encountered (at some point) on
> > > all the drivers that track and limit the number of attached devices with a
> > > bitmask (or other mechanism) and check that bitmask in the ->attach_i3c_dev.
> > >
> > > E.g., on the Renesas RZ/G3S I can end up to that point even w/o the code
> > > from this patch doing the following:
> > > 1/ connect 2 I3C devices to the bus (I'm using the NXP P3T1085UK-ARD with 2
> > >     temperature sensors)
> > > 2/ after the 2 I3C devices are attached, simulate the I3C bus is
> > >     full (no entries in the free_pos mask) (with the diff patch below)
> > > 3/ cut the power to the NXP P3T1085UK-ARD board
> > > 4/ connect the power to the NXP P3T1085UK-ARD
> > > 5/ at this point if I run do_daa the devices are not going to attach anymore
> > >
> > > I can simulate this on my side. I think it is the case for any other driver
> > > following the above mentioned pattern for attaching.
> > >
> > > That was the reason I have currently dropped the attempt to solve the
> > > problem highlighted by sashiko as its solution looks to me to be more
> > > complicated and involved more testing to be done, not only related to this
> > > driver.
> > >
> > > Since the issue is not only related to this patch but more on how the attach
> > > procedure works, and can be reproduced w/o this patch, I considered only the
> > > approach in this patch was be enough for suspend/resume fix and later fixes
> > > should be added to cover this complicated scenario.
> > >
> > > Please let me know if you have any suggestions on how to go forward with
> > > this problem.
> > >
> > > This is the patch I used for simulating full bus:
> > If problem only exist when full, it should be fine.
>
> Yes, it's only when the bus is full.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Thank you,
> Claudiu
>
> > It is less possible to
> > happen at real world.
> >
> > You explain it.
> >
> > Frank
>
