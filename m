Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6A42F71F;
	Thu, 16 Jul 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212024; cv=fail; b=TZX2VJFzYaQa2o4Zq94k6ucR9hMn0x7HgXYNsP20py4rlVEOnEIcFAMrJogQMUUc0QeXHuujJMpdHP3aNAmqTG42mFYYeG4CLGEcJ29zefgc795AyUZeJDidxNob5lUWBMl23YuOorAfvv3THZXHB0lCB6T9PI6Tgq2594xvtkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212024; c=relaxed/simple;
	bh=Mzr0WNPi8MAQaIJKu2/rRUQdaLq88qjefpboWe+zlDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UAA4PVfHsEMbiikMnNblX+WjGHdYHBqqU55jBi6c/adXo00DKYvm6P3R/HerQGEtOVDXuie9Jp7TEWH+bP884SrqSnwO2RUjiBJpQbqtGlG2dxjIblwz2jtibO+fuVPOPrAF0YBrno38eY/UaWq0xGHoQZdADwPKsqAkqLF2Cu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ltLfHD74; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ltLfHD74"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOt+DtHJi9KPhzCCcLur/KyTQ63U1PCTz280+dRSwRWLQjX4wnJzoIlyLmNQxouBcFHWyxkwlTvie7J/QQEspLLyC9qtQIXbuxBCKtC9m/1H4nQlGz/uGCdshbHuuOu4AY274JH3fpYnDknIu/37+HUObPJBKBs1tUz95CK0LcN54SlvEw2smoN3JgKJQlWR43kY20r4aGfxiTR9jicTUsuN3+TNP/f9GANbNWZ7gDypGUWKcb9kCwzcB2WXZmaVR9XbfTOAtbz7aCrIws09dVHSuZIyah3bstASX2wr67ZLFiqZzWPsoYeHGECz1dtYaOl5VyGCMQhhG8dSdYI45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olLs4zG2FjXERRCsCKPuPrfX/9BhSzp1N4aGQstr+P0=;
 b=P3SEYHcyQZgK8bQKgIyBY3end1HDxGEnsjBmn7JtC/skDsweEh5C5++zDFNqh1KKmqDLKwNUFxyhfvIMhN82LAURiDLrAFqfT79q9vE0Nb2MWqZWJQb5LPdUWT9tG8Od9EDq3xKAj1KntXMcxxiOEUuFESR9CfroXqL5/47CveUbTofHkk2Sj7Oco3yd+1Mc1KzKGSzLA/y16kSagbRr1WIcsl9y8rUllEV8RaQV0ow7qgbO+rdOFH8hA13bzC27r2XF+yvO627huh6UYQ2ve/nRJQHXDIc7drIDvt+/Fhpg2WF7JOw+gKM7YLLqX80uYJxCi7ov6f8/04s9Rnq9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olLs4zG2FjXERRCsCKPuPrfX/9BhSzp1N4aGQstr+P0=;
 b=ltLfHD74OxnpAP7qd4UKBCjPVMq/osIUWnsjwQCBvA9nypX8x0+x0c2FLOjPDT2jBigtwvRbIRCCoxHHR/mker7RT7eXxcnNAFxu4QoRtbo2KQBJ2s3mPtaXwWMBJwNNshrPJibibqxMozvfiJM6VwzOVvIzlvMH850IbT/vZmtZEmtYD9Edx/ArTU7r3gIIIS1Ip7C6fJazTNXPACG4vhbYR/idcEL+flS4rlhX1VqYhpIT7wrNPaDEQMuAAnP8nnl5LPEnnNtpryqgHIGbyOouRCYvykT0pl/63hZAMGtS5cjFmaxvz2ZQCFM1Ex9f9nYMRcLLArPLGR4tFkKEvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:26:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:26:58 +0000
Date: Thu, 16 Jul 2026 09:26:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <aljqKuQN096QtUks@SMW015318>
References: <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org>
 <alUICTI-24tREZO8@SMW015318>
 <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
 <alWR66rjt-9jGEOV@SMW015318>
 <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
 <alezsOsf61Zv6F4F@lizhi-Precision-Tower-5810>
 <c9a67cbd-fda8-4016-9cff-9125f3191b74@nabladev.com>
 <alf9pp3c_zI4rwC0@SMW015318>
 <56953f06-2e3d-4137-a51a-ed91e9b0d577@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56953f06-2e3d-4137-a51a-ed91e9b0d577@nabladev.com>
X-ClientProxiedBy: PH7P220CA0141.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 39773be9-ea27-4d4c-91bb-08dee3464b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|3023799007|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WR/a3rHy5K2gcb+wn2HuwkuTGG41mAs8jWR8borKZVPsGJAVV8+wViAnJ/FWeB6t9f4TX2zY+O+VplyyPKFkoRHoWm29gC6k3VedhChMVBy1L/tUGQzatXOMRzbelLL1jEEaCbnXX1nbpGbMlYozaaTB9PU1ZMkiuKjEd9u7OmD/oN1iDLWvNktnclT6o/t9V2OZOtJVBqwodggjs/Q/UPtSGSvTZg8ucWMV3GwyhTijby00wu8QiyIcs4RpVcr8PNbFkr7Ly4pz4H+igHuDS1AXsIW4paZlVZLH+iuMG8OGETSxi7UFmMvA0jDGr/1HqMN/DEf5oPrSE1JDuHzvKclJz347a5f78YeXoSnUUe8ICef3oxOieNMqGqvJfs04cCGmV8JxXx60jZrJeEGQG+UzR4CQ8NWGHlZ0I6sGfR9wPggfZ1lQ6yRcdWVG/NOJxnUxuVWk/qCkT4+22EjPiBBWueJAC9M508SIZW3XxuJ8qSalpOtbnLiJsR7mileYhxdDCyLuY75oDeiALtwcwE9WxdIQdMpeVHQbIHVb6CIBy7O8o3vzuNV3ofUxT4XvYiGqj0ZfniYSziOLeN/uWErlqqn+BONyCqnARkrbTI58gyB4TJ8sLbCOdbICZcRzijsNowtFuLXlOKhVVwa6dpDbBQhoFr5P3mf0oy3fE0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJ9i172YKm5CztHmqemQvumDQdCmsGkGs3F0RyKN9h0MT8MMfSUx4wbJMgc/?=
 =?us-ascii?Q?rOgy+9yGyiaeKi1Fk+YAuFH6RQsZqhlZj0GsqSxQyrFFBWVy1Z9Cnchl68yD?=
 =?us-ascii?Q?gGGCL9mohONTdaG4Tbgd+72EO1npSb3GjTyl18B1WIGqIqT80FBwIdizpqiC?=
 =?us-ascii?Q?/X4GonLCk94n1uNs74ztDNMHwYCesFsYew9VqJTbbt0pt4K8We3xSZVrmmnk?=
 =?us-ascii?Q?40VOjmVMAORELM88ZNEWgXSCX6JttgIlLmFBqdxVVxw3wvwM39x3l8qjt8Jd?=
 =?us-ascii?Q?bc/pMsxVOhVkWc/CaeZZ7kFD+bMY8AKLraWwRCXMWfrddxPTOuEzRh562h0i?=
 =?us-ascii?Q?eC1snhyafW3icFvVa9rRzR2joc9mVHeEWi04l0Jbk2rDj4es7BLBH92s3uZk?=
 =?us-ascii?Q?dCdTk/9DI2WVbE1s3R0It9YNR/bwG3UphDzv5JN7XGY8KnpaP8aXXX+6LZZI?=
 =?us-ascii?Q?peYyCtGreTYiNv92l0TjALAYQKdpRVHjx0ty9x8Yd+zgZq4NfQPsgM+T7XAu?=
 =?us-ascii?Q?k5ptrDY+FsOGIWisw58TcxNVf/6xzXsxabESINAKPBIkzESGoH71sRPJZZKK?=
 =?us-ascii?Q?Hzlt6pApYy4MlRD61MjaKDxtjndbZ9So0wpNUhCfsqEsoxCLImzo3Lo5n0PE?=
 =?us-ascii?Q?c88RY5cnW6NfGJc/TQwHWkEBtTRApMMnU8is4O6gQYXS57L1TgaSqn6A8w9h?=
 =?us-ascii?Q?NutLalb30sRbVIa01FydLKZzlhfMH+aW+TK8W+PtZ+/WiagetK0lZAxieYfZ?=
 =?us-ascii?Q?X+U9vSnBQ9JmySD9a+GxCXJBfJOllMgMO8x+Gi+joO6PbwlgJttfaaR+tNu8?=
 =?us-ascii?Q?WFuEE6AoDme+rqDAve+nsDHXZtXpN2xpzGgOSoxvZFrC9f3JoRsBW8/DyAzR?=
 =?us-ascii?Q?rc5W4SQvdEWi0WnVm6FFP7vdVi4AfHYKOewTxdCaxhCZk2oQPUZ8yZv8jpaO?=
 =?us-ascii?Q?18tUpXDv3owwbI/oWDXWGHRflT/RTc6iH7holo1grnCQkiR/e8LL+YJt5GLi?=
 =?us-ascii?Q?Chexg27rT6Hd3lfIl0aton55T7okRNz3dFEG5ZwskMqfbhl/I6fwwPkIMg0g?=
 =?us-ascii?Q?vCzXrurenhN8pGgHO3garQohvX8l34HCNAIJ+iLzalcZuRxtl2qu33WVU4w+?=
 =?us-ascii?Q?CtHBqrjS0H/nXpEFVnP1H/VpJs3LbvSVg3aTEemml0jlqowz8a6jWyXhlUWD?=
 =?us-ascii?Q?n05p25HCtmgvWyigyDq+oXBv0YZQQkbOI/MYEYjrd6L/o26n/UFJH4POvyWv?=
 =?us-ascii?Q?wMghhyf3mLqWdSVSDkCN3nZ9dXjp1mH1RNG59szNv35/4dYVgZOVkV9IayMH?=
 =?us-ascii?Q?R4gicyg56IEmOtJ/9b9hLfrSVwMwmoiGIZbYCmf24IdBQvRpeT6T1N4RU96f?=
 =?us-ascii?Q?y4Vz1WQWqbuXcaZ5DSb9VYjILP5GMsr/gElgBe6oslgpsAHDGrN22u2GDOue?=
 =?us-ascii?Q?OFA2DRVt9dMVqRtZct3nJenmYxwidcx7Jujlqmwo8rd/e9kWEoXMtubMdzU0?=
 =?us-ascii?Q?Nu2KM6oUqjteQv/jHncPpjzPuQRW4lyPgkWea3tagWyEg7nQNIL40HgMR32Z?=
 =?us-ascii?Q?n2O7GBcgdrMiTCeJ1a9NmU2ZpjMe8kueywc0LR6K3rK0HqghbySPAZp1gyf9?=
 =?us-ascii?Q?rZvFWWsu8N2WbPvpHptlbzMw+447Gv78PfQbKsJds0tHIfntVdbN4wuVi6TG?=
 =?us-ascii?Q?z7tiCBswmUAtmfgQ5nzbIrsmii2RHrRZW4efXpL/zT8OEt+e/2BjAW9aijIT?=
 =?us-ascii?Q?BLq6SoUsWMmY2iRxIw2jBFte7azjUgBkEAVqYaSHyd2WMjY2WDoF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39773be9-ea27-4d4c-91bb-08dee3464b03
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:58.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM5EODsdIZvnrfjZPA9HfMkuq8Kat3lqmdRrb225wwB3Hb5RtJo57T7Mi8xbNpW0iEfZiq/qJ40wixJasMD8eFsfTnTG+l0szcYcC+TOYlhYwIelLU73oBEPGhv5JH61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649

On Thu, Jul 16, 2026 at 01:30:17AM +0200, Marek Vasut wrote:
> On 7/15/26 11:37 PM, Frank Li wrote:
>
> Hello Frank,
>
> > > > > > > > > [Severity: Medium]
> > > > > > > > > Will this node name bypass the driver's carveout exclusion logic?
> > > > > > > > >
> > > > > > > > > Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> > > > > > > > > specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> > > > > > > > >
> > ...
> > > > >
> > > > > never existed in imx_rproc.c:
> > > >
> > > > AI refer old version code, but problem is the same
> > >
> > > No, sorry, the aforementioned piece of code never existed in imx_rproc.c
> > > according to git log. There is no old version of the code that looked
> > > anything like what the AI produced above.
> > >
> > > > if (strstarts(res.name, "vdev0buffer"))
> > > >
> > > > >
> > > > > "
> > > > > $ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | grep
> > > > > vdev0vring1
> > > >     ^^^^^^^^^^
> > > >
> > > > vdev0buffer
> > >
> > > The AI generated review content above does refer to vdev0vring1 , which is a
> >
> > No, AI talk about "vdev0buffer" at beginning, never said vdev0vring1 at all.
>
> This is the code the AI quoted in the review feedback:
>
> "
> 	if (!strcmp(it.node->name, "rsc-table") ||
> 	    !strcmp(it.node->name, "vdev0vring0") ||
> 	    !strcmp(it.node->name, "vdev0vring1") || <-------- HERE
> 	    strstarts(res.name, "vdev0buffer"))
> 		continue;
> "
>
> It does not matter which identifier we use to look up the AI quoted code
> snippet in git log, the important point is, that the aforementioned code
> snippet never existed in the Linux kernel as far as I can tell.
>
> But as far as I understand this, I should adjust the DT to cover the test in
> the aforementioned non-existent code snippet ?

AI is not 100% accurate. Need focus on the problem itself. AI find the
problem, vdev0buffer, not vdevbuffer, which is really existed at kernel
code, which use strstarts(res.name, "vdev0buffer").

But AI's provide reason or create refer code is wrong, like what you quoted
AI review feedback.

The same problem, AI provide difference report at
https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.kernel.org/

Or another words,  AI found the real problem, but provide partial correct
reason.

We focus on the problem itself, not partial wrong part of reason.

Frank

>
> > "   Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> >     specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> > "
> >
> > > unique identifier, but that unique identifier exists only once is the entire
> > > history of drivers/remoteproc/imx_rproc.c and that is as a code comment .
> > > That proves my point that the aforementioned AI generated review feedback is
> > > not based on code that ever existed in the kernel.
> > >
> > > > >       vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> > > > > "
> > > > >
> > > > > It seems the AI hallucinated something which is not based in reality ?
> > > >
> > > > git log --follow -p linux-next/master -- drivers/remoteproc/imx_rproc.c | grep vdev0buffer
> > > > -		if (!strcmp(it.node->name, "vdev0buffer"))
> > > > +		if (strstarts(res.name, "vdev0buffer"))
> > >
> > > "
> > > if (strstarts(res.name, "vdev0buffer"))
> > > "
> > >
> > > and
> > >
> > > "
> > > 	    strstarts(res.name, "vdev0buffer"))
> > > "
> > >
> > > looks like different code , and the AI reported "strstarts(res.name,
> > > "vdev0buffer"))" which never existed in drivers/remoteproc/imx_rproc.c as is
> > > clearly visible from the command output you shared above.
> > >
> > > So, what exactly is the problem here , can you please clarify it without
> > > referencing the AI generated content above ?
> >
> > The problem is simple, node name should use
> >
> > 	vdevbuffer: vdev0buffer@b8400000
> >                          ^
> I see.
