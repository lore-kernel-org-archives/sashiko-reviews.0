Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105D3346A8
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055480; cv=fail; b=QQYpZHL0we1qQSFpqIh3gHV6C7qrsdBRjFNQD2c6fPUDAZq1/QoQGsV7KH3l+GcLla/ySJZbCd66O/5hA3n5bRO7ta1+MKK/HLaokvmVXitA/BKYLqt9VI7/4Zi2eFaxVWP0Hbl0sQMu5Wz9iUhoWh0sTteWOlZZCtodVGdwXHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055480; c=relaxed/simple;
	bh=jLSTcDJzzmpXy/fw7tVLl2NllWgqDC4Tfg5N3ESbpv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=biYEwNeYX5jU+S5gr5yyjac8JDN4pR117ABGAfumcujcMnVQYLoW1suflcv1msewsIZP4Gb+QONRG65BKK3Aask2dXeNFzvgWlOWipGAey0AovYRMtpN5evKn8TjBLgqgM6wOnq6zLBIhaMmCZsPcWAOJVtfPQpj/Us3/QWgfKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KkVMUkoB; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KkVMUkoB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQTd32pcxVhOBqyGEbMUY/7KMGZPzsGxNV7SmAeZ7gyVkV7XWRiMWMBWI7mpnmGp5cYcA0MmtoTtdlON8pogMp1eZbStLwjGtnmNDnCTt+Yh+qmOJ5vkWBJiecEIQi5QVNg/Fxg7AL5aW9vG/uO+8Pwan+WJCfSod/2uTE2IrK3g/pRDSoyXpjhxzmL3cz8ICX78e6scW0V0gciQ+hB0uS16C3enRkfXItgfNb6jKfPBIOwurliAJMRz28R6kYpnWlnj9VJZMfNYfCHezQOCfLK2Hg5WbTRnW5O09qytUP75qRyaSTAddUz2TPe4p5Zp9jhMUFPEWonqSiIERjPxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryVTX4vhiuHSYurf93Ut0ggxBH9680jsnYJnscWTlmg=;
 b=OwQXzmEhJfZwr9PA94824dgdyv+3GPJfC/EDLAX3RQrRI6Q//LYRM2yhxpUo7H2m9c1V1cITt/yv+igBXFYN7DEmLFWdVNUvyaMHr+Y9EgjxiyCIzvqqtWbIDKLkpr8lT4nhBk9qMDaVcjZ+wL87Zwp5gAS/ri6G+F7I7eDs5divJiaNbgebEvJHhTThMF5qB1vuVzgW9l3755kEYSOTK310QVSN8EWGDUqyr5KcDx/wtCXNIfIGKpnTsl7xuKBLfk/zuD3Skc/f18RRuIbW5G+Gkqzp7GUL5xxXJMVHrSLVRriQg5PeU+hw1RdbUAV2zBHhkZMe5SGZBweNz/Fs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryVTX4vhiuHSYurf93Ut0ggxBH9680jsnYJnscWTlmg=;
 b=KkVMUkoB6LbfMIgsTa3o2QJ/o+BIuBAgJCf2+lO5TbjgPzWDQ05WgKv9Nl0VC2f6i4V7I3koQbz1gIxRuIULUqNs9Fml4HI3P88IpFC7EypmTXOViQ5ogW+xYgLfcMzyeEtUkwRXkG1wjAFE4GaWBrKicXspHoInvgSm6nr3skD9C4oYyqI4comwyxF6lomptpAnFlm+ZBt8zhEadbgk1dtKOlCLJDpvModq7TSKadoHmX8OUpFM8xKWIdfWgrI0esFxtoZiGn0wFrVXOK8tbmw0H7dk89eSW7ARYwfNj1y49SGYjatmM3afqahsTJTAc8Ap8z8gCWmASpv3s6C6wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 18:57:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 18:57:54 +0000
Date: Tue, 14 Jul 2026 14:57:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: sashiko-reviews@lists.linux.dev, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address
 Assignment on resume
Message-ID: <alaGq8mKvCm9kWao@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
 <20260713135032.ADFB41F00A3A@smtp.kernel.org>
 <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
 <5e17bba2-9259-4d39-8170-275927835943@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e17bba2-9259-4d39-8170-275927835943@tuxon.dev>
X-ClientProxiedBy: PH7P220CA0178.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5c56a6-d921-4330-3ec5-08dee1d9cfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|11063799006|4143699003|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GnygerEOqOQXuxejyKj5XYSPzPqqXl3yA5Bbf/ovVuE9/S9wNjWYqb3KrlbTC1Gn5yg7/3E2jUR0QDgH96gFA3WsFQ3OJpwHAVyYrPdMcxT9q8vgu1ergA1SpaKWMHqAOtpNsaJPw4qYMwOMUr3oeXKkRxahuNrjec09+8+735lYPVy1y7mcu63G3VRBhXZIzJjnmYYR6BxXPFQlcdup6wDICK4VntQosiW/i+9eGatSrDg6L7KrKK1t069o5LWAM0ZAj2w3WEnURjvYn6jvQ/UnTQKWWdZtBNkcNMdxmy5y5q4xFFP117GPbwMVz5szXZAbKpjciLnqAKsquAz3bY7deMBOENL+NGaB9cEOdyRAm4y/DkN772trY4SXAmHgfpg+QcLEqYyn66cX93daPXuk+pju8qLWeGPzyfDhQ8EwFSftFdEWU31+WyKPnmk5R/3HUqdPrKiuIA8sDuH+9gtDq3Zz2zgAkTZ2J4wI10zxF3vvla/81pG0U4s7XBqon9k0YdlhN+AdplUrzSmBwjhYCozIeuFdTKvgXJVpx91mif8SAoe7K4iHpwAMEkI48wQkEqOAunoxmDDbvCXALjp3e6msO+NfSoyngm9eGNwM2oPVQwOp3IrjoJr8RalLMufEeuHzIciIKUdzDPhH0B/oXXH9FDzbG/8z1RBI6Q4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+HYHpE4Nvc38URmlA2/DjKfYBs82jzWyZmhDUdePLGos8OzPeiGD+Y6l+jtV?=
 =?us-ascii?Q?Tr7FQIm5cBTUp56p7uqUAYKvVHBHSnK+tS5XNlnHfeDy3nIbIYa9UTg9ZqlO?=
 =?us-ascii?Q?ZLSt7ZRleu7zf6Bu+2aJFjEoRLp/txe/kV4MwHPd/8hb4Llon0hX6+1nNSQ1?=
 =?us-ascii?Q?Byp47MubEhDI9sneFE7taaRNDmWh4OwzYnf0Khq4hgoP/GONHxOOhV6NkkGu?=
 =?us-ascii?Q?N+mQrfevIVg3KNAA4AOOykr9fL+PLmS6o6sP/9kmd1NAJsKNdISpV5C4ZZjA?=
 =?us-ascii?Q?RTkMzrivFvF2hzDHtFbdNp0yrscHgUIO8ynMBAW+x3gVH4/KoMH+gRIZLaiH?=
 =?us-ascii?Q?PSFe8LBllUiY8utvqjOKJApwRPd0Rq8EZ+PKsOMU2CzVIeo6MNDQaFgWxP0a?=
 =?us-ascii?Q?KNXJo7CBCdAT1EEhv4tzK+28EGl7Co4RQAlKEu9dEE+jXiZ+U9ApM5IlpR+o?=
 =?us-ascii?Q?Z+yhOxKeu7J2Shun8xboMnR3PszYDGrRXi4dXGezrvcyAFj/dUkDKmOX5IIN?=
 =?us-ascii?Q?QktIN41tA13oAcw+CZZ964SvXbgvAooiv4EisDkpJOfmR7RCt0ZgKqF1DD6m?=
 =?us-ascii?Q?+jSeES1ITS6xLSHdWixJX0eGcWRQfZr2fd7pelOLhrPWnY1saILzKp5PdTH2?=
 =?us-ascii?Q?Y1glWbtqXl+5Uc0HMcr2d6rJ64D9pMWtQFWDKFH4OjnYM8qlnYrVL4UYIBvR?=
 =?us-ascii?Q?QV6B84Ao4osTgxlZlqc6X/P2t9PpBw7FjijAwQLbiINZLzOHlXDbLZM9dE5q?=
 =?us-ascii?Q?ChwtyBJ/pMk28fRBu+3nexbHUUamWKd+5Zs9R1JlbVC2KShCAbYFZhY0wyHL?=
 =?us-ascii?Q?AstCkKX9AJ5T15UuiSEraiqtcViGM67Ugrgg4DkIlIwcxtuc+LQAMqAoDcNi?=
 =?us-ascii?Q?9TjSBGCd1N91tKi/HSWpcyXnsNNIZyJ0prhc3oNaVRXcH2d6j/CGxJZrBWYn?=
 =?us-ascii?Q?YZ5zaa4O7nsTtryZu0lW4Nr9KmSDrjUAxx0patEjfaFh8ShRGGE9jyaTu6wq?=
 =?us-ascii?Q?zgvdTvj8+B8ZMDeXcy3vIOl3cXlZmoFq/zQGaE+6gUO7zPso2ZT3imR6PVkF?=
 =?us-ascii?Q?RH73NlfS4AN0ynDhODhziQ0JOyHg+O9rhfKmA0FwMOxjRSIJd/sRbavybJCP?=
 =?us-ascii?Q?AmZsDtqS2YY61GkWZg8Ai80o2FnVyhp/9rNx7ed8jqTPBrstjEOVFfBAAq2+?=
 =?us-ascii?Q?8UyQKIcGMFV1EE0malyqu9L8AoEdzRjmZ/Bg2oDXrsfBmjQq5bJg2WfkWk+D?=
 =?us-ascii?Q?dGQ5IFSN58bwUOGrXsAA/PFChY7Qg3A7GsuBg4pDrSJTfJt5zpT+cTRXzbMW?=
 =?us-ascii?Q?vgMXspxHMQH2Ess0TVZPkF9L4nsECSosGHOB0MU7kObW1cewZ5PognRDemkl?=
 =?us-ascii?Q?cml0R4ffCdIpMSoui5c0tvGKFOj/OCo2Pn+THl4s9L4uU1HwblcXeTJWnajv?=
 =?us-ascii?Q?Zr1RSlZx1gn84lpPfc5l6mBR0ukgqE8EgeTewhYyxmhrdFX3hdTmf7OT5GSD?=
 =?us-ascii?Q?eNtUoY+2EmOgSVLMAMDK2nEgJHj8KPGqL3v2nkVTV5wjex/mDb9o6Tg0g3D4?=
 =?us-ascii?Q?JEJkuHaxHPi8NnmpRMODi+5YQA/anEzvFz5t9X40hOJwF1KC59niH1gErR4V?=
 =?us-ascii?Q?j8I+NHvWjFdbuV83jtD6YlPY1AgaZiltGI86FU45JmRRFfFuSfep8eSpIzYZ?=
 =?us-ascii?Q?FcHOv0Bap+sbTqDFYDXLufkFKZ/lW9k9wLtrwVH90CnynvFHsE/21tdpnEea?=
 =?us-ascii?Q?XAIqcE1FYBiCmb88ddOwt9tuKW6xbr52zsDNr2so+k9cd4RZqkos?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5c56a6-d921-4330-3ec5-08dee1d9cfc6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 18:57:54.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xM8zenHRwGUkurw03p9S0s+lq7EqDg1qeZ4a5aR94Z6wzq57YmZOLBHe7EBDo+XY1stZBDAWQd5LLGASY+7sWBsWIUkIgH3a47m3baDpsETiZbUKNlDJSqkaTeskQAx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778

On Tue, Jul 14, 2026 at 12:30:13PM +0300, Claudiu Beznea wrote:
>
>
> On 7/13/26 19:59, Frank Li wrote:
> > On Mon, Jul 13, 2026 at 01:50:32PM +0000,sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] Removal of the DATBASn save/restore mechanism completely breaks the I3C bus upon resume for previously attached devices, and fails to resume if the bus was fully occupied.
> > > --
> > >
> > > --- Patch [6]: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume ---
> > > commit e4ac838c055dc33beb2ff4e8968a032da48a2a47
> > > Author: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
> > >
> > > i3c: renesas: Perform Dynamic Address Assignment on resume
> > >
> > > This commit updates the suspend/resume operations by moving them out of
> > > the noirq phase and attempting to perform Dynamic Address Assignment on
> > > resume. It also removes the save and restore of the DATBASn registers.
> > >
> > > > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > [ ... ]
> > >
> > > > @@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
> > > >   	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > > >   		       MSDVAD_MDYAD(i3c->dyn_addr));
> > > >
> > > > -	/* Restore Device Address Table values. */
> > > > -	for (i = 0; i < i3c->maxdevs; i++)
> > > > -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > > > -
> > > >   	/* I3C hw init. */
> > > >   	renesas_i3c_hw_init(i3c);
> > > >
> > > > +	ret = i3c_master_do_daa_ext(&i3c->base, true);
> > > [Severity: High]
> > > Does removing the DATBASn save and restore mechanism break communication
> > > with previously attached devices upon resume?
> > >
> > > Looking at renesas_i3c_daa(), it explicitly skips hardware register
> > > initialization for previously attached devices:
> > >
> > > renesas_i3c_daa() {
> > >          ...
> > >          if (olddevs & BIT(pos))
> > >                  continue;
> > >          ...
> > > }
> > >
> > > Since the controller was reset during suspend, won't these hardware
> > > registers remain uninitialized (0) if DATBASn isn't manually restored here?
> > >
> > > Additionally, if the bus was fully occupied before suspend, will this cause
> > > the DAA process to abort entirely?
> > >
> > > renesas_i3c_daa() {
> > >          ...
> > >          ret = renesas_i3c_get_free_pos(i3c);
> > >          if (ret < 0)
> > >                  return ret;
> > >          ...
> > > }
> > >
> > > If the bus is full, free_pos would be 0, causing this to return -ENOSPC
> > > immediately. This aborts before the ENTDAA command is sent, which would
> > > leave the previously attached devices permanently stranded without dynamic
> > > addresses.
> > Please check this sashiko review result?
>
> I tried to address this though the versions v2-v4 variant of this patch that
> I've posted previously but after more investigation and thinking it looked
> to me that the solution to this is not that simple and related only to this
> driver (see below).
>
> Last time I've asked for some guidance [1] but got no input on it.
>
> Apart from v4, I tried (before posting v5) to use separate free_pos list to
> be used while resuming, and still use only i3c_master_add_i3c_dev_locked()
> in renesas_i3c_daa() but that didn't work either, because the devices
> (present before suspend and) discovered at resume, ended up to be added to
> the new list then deleted by the code of i3c_master_add_i3c_dev_locked().
>
> I have also thought about increasing the free_pos bitmask with one extra
> entry while resuming to allow attach, detach, reattach work (for the devices
> connected before suspend), but I don't think that is going to work either,
> and looks hackish to me.
>
> I also tried calling i3c_master_detach_free_devs() (only the code for I3C
> devices) before running DAA on resume but that wasn't enough for the
> solution to work.
>
> I think this issue reported by sashiko can be encountered (at some point) on
> all the drivers that track and limit the number of attached devices with a
> bitmask (or other mechanism) and check that bitmask in the ->attach_i3c_dev.
>
> E.g., on the Renesas RZ/G3S I can end up to that point even w/o the code
> from this patch doing the following:
> 1/ connect 2 I3C devices to the bus (I'm using the NXP P3T1085UK-ARD with 2
>    temperature sensors)
> 2/ after the 2 I3C devices are attached, simulate the I3C bus is
>    full (no entries in the free_pos mask) (with the diff patch below)
> 3/ cut the power to the NXP P3T1085UK-ARD board
> 4/ connect the power to the NXP P3T1085UK-ARD
> 5/ at this point if I run do_daa the devices are not going to attach anymore
>
> I can simulate this on my side. I think it is the case for any other driver
> following the above mentioned pattern for attaching.
>
> That was the reason I have currently dropped the attempt to solve the
> problem highlighted by sashiko as its solution looks to me to be more
> complicated and involved more testing to be done, not only related to this
> driver.
>
> Since the issue is not only related to this patch but more on how the attach
> procedure works, and can be reproduced w/o this patch, I considered only the
> approach in this patch was be enough for suspend/resume fix and later fixes
> should be added to cover this complicated scenario.
>
> Please let me know if you have any suggestions on how to go forward with
> this problem.
>
> This is the patch I used for simulating full bus:

If problem only exist when full, it should be fine. It is less possible to
happen at real world.

You explain it.

Frank

>
> > git show
> commit 01f99391ab3e (HEAD)
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Date:   Tue Jul 14 11:49:14 2026 +0300
>
>     test
>
>     Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca..4cb98328c8eb 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -810,6 +810,29 @@ static ssize_t do_daa_store(struct device *dev,
>
>  static DEVICE_ATTR_WO(do_daa);
>
> +bool i3c_full_bus = false;
> +
> +static ssize_t full_bus_store(struct device *dev,
> +                           struct device_attribute *attr,
> +                           const char *buf, size_t count)
> +{
> +       struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +       bool val;
> +       int ret;
> +
> +       i3c_full_bus = true;
> +
> +       return count;
> +}
> +
> +static DEVICE_ATTR_WO(full_bus);
> +
> +bool i3c_get_full_bus(void)
> +{
> +       return i3c_full_bus;
> +}
> +EXPORT_SYMBOL_GPL(i3c_get_full_bus);
> +
>  static struct attribute *i3c_masterdev_attrs[] = {
>         &dev_attr_mode.attr,
>         &dev_attr_current_master.attr,
> @@ -822,6 +845,7 @@ static struct attribute *i3c_masterdev_attrs[] = {
>         &dev_attr_hdrcap.attr,
>         &dev_attr_hotjoin.attr,
>         &dev_attr_do_daa.attr,
> +       &dev_attr_full_bus.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_masterdev);
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 65151991b4ec..8e78ef602c51 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -324,6 +324,9 @@ static inline u32 datbas_dvdyad_with_parity(u8 addr)
>
>  static int renesas_i3c_get_free_pos(struct renesas_i3c *i3c)
>  {
> +       if (i3c_get_full_bus())
> +               return -ENOSPC;
> +
>         if (!(i3c->free_pos & GENMASK(i3c->maxdevs - 1, 0)))
>                 return -ENOSPC;
>
> @@ -689,6 +692,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>
>         renesas_i3c_wait_xfer(i3c, xfer);
>
> +       if (cmd->rx_count >= i3c->maxdevs)
> +               newdevs = 0;
> +       else
> +               newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
> +
>         newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>         newdevs &= ~olddevs;
>
> @@ -867,6 +875,7 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
>         struct renesas_i3c_i2c_dev_data *data;
>         int pos;
>
> +       pr_err("%s(): in\n", __func__);
>         pos = renesas_i3c_get_free_pos(i3c);
>         if (pos < 0)
>                 return pos;
> @@ -883,6 +892,7 @@ static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
>                                     datbas_dvdyad_with_parity(i3c->addrs[pos]));
>         i3c_dev_set_master_data(dev, data);
>
> +       pr_err("%s(): out\n", __func__);
>         return 0;
>  }
>
> @@ -894,6 +904,8 @@ static int renesas_i3c_reattach_i3c_dev(struct
> i3c_dev_desc *dev,
>         struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>         int pos;
>
> +       pr_err("%s(): in\n", __func__);
> +
>         pos = renesas_i3c_get_free_pos(i3c);
>
>         if (data->index > pos && pos >= 0) {
> @@ -911,7 +923,7 @@ static int renesas_i3c_reattach_i3c_dev(struct
> i3c_dev_desc *dev,
>         renesas_writel(i3c->regs, DATBAS(data->index),
>                        DATBAS_DVSTAD(dev->info.static_addr) |
>                        datbas_dvdyad_with_parity(i3c->addrs[data->index]));
> -
> +       pr_err("%s(): out\n", __func__);
>         return 0;
>  }
>
> @@ -922,11 +934,13 @@ static void renesas_i3c_detach_i3c_dev(struct
> i3c_dev_desc *dev)
>         struct renesas_i3c *i3c = to_renesas_i3c(m);
>
>         renesas_writel(i3c->regs, DATBAS(data->index), 0);
> +       pr_err("%s(): in\n", __func__);
>
>         i3c_dev_set_master_data(dev, NULL);
>         i3c->addrs[data->index] = 0;
>         i3c->free_pos |= BIT(data->index);
>         kfree(data);
> +       pr_err("%s(): out\n", __func__);
>  }
>
>  static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 4d2a68793324..3ab31d85bff6 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -22,6 +22,8 @@
>  #define I3C_BROADCAST_ADDR             0x7e
>  #define I3C_MAX_ADDR                   GENMASK(6, 0)
>
> +bool i3c_get_full_bus(void);
> +
>  struct i2c_client;
>
>  /* notifier actions. notifier call data is the struct i3c_bus */
>
>
> Applied on top of the fixes patches from this series except the one in this thread:
>
> 01f99391ab3e (HEAD) test
> 6d3e526d34a3 Revert "i3c: renesas: Perform Dynamic Address Assignment on resume"
> 7256e1a32469 i3c: renesas: Clean DATBAS register on detach
> 1c9e940709a2 i3c: renesas: Perform Dynamic Address Assignment on resume
> 305787a2f797 i3c: renesas: Reset the controller on resume
> d6edb5c5d46a i3c: renesas: Reconfigure the DATBAS register on re-attach
> 88ab25e78d95 i3c: renesas: Follow the reset deassert order used in probe
> 80908175920f i3c: renesas: Restore STDBR and EXTBR registers on resume
> 455ff70955fc i3c: renesas: Check that the transfer is valid before accessing it
> 27bc7a253560 arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
> fd146e7c97f8 pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the
> I3C power source
> 277b0db8d168 dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the
> missing I3C power source option
> de297915b104 pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
> e9a915ca8cc7 pinctrl: renesas: rzg2l: Generalize the power source code
> 34cf6dafc474 (tag: next-20260709, linux-next/master) Add linux-next specific
> files for 20260709
>
> The steps I followed to reproduce the problem even w/o the patch in this
> series is at [2].
>
> Thank you,
> Claudiu
>
> [1] https://lore.kernel.org/all/559b8b0c-412a-4d0f-9872-a4c92f3b9611@kernel.org/
> [2] https://github.com/claudiubeznea/logs/blob/cc6a6e80936b8368a2187c72dd7e23a6a88b5a84/logs
