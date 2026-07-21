Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8C38655D
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653119; cv=fail; b=szI6GCBx4NodqngtmlivlbUVqB7w+g71+URMPQVvIdNFnHNYincQvQDy9cH+TCPC7BbhYAC8IWH2BTiwbHY/huNsGmKY0219bLyK2Kso5yvJq4XbUbYXBxFZPFkUQsCV1V0UwjW4l8u3V8frUkDd1DsGluf5HrtzrmhXV+GCzd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653119; c=relaxed/simple;
	bh=KoaicS2hCr7ZcvM81cqW1thXpxIQCk+b0aauya330zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k4I622can/Fbx2Pc0qcLoVS6TPr6Y3GQ64XVo5QV6OtyItWeZ12YXXDuEIwiBhUxcctLX8qHvZPo6LGsrA8Q+2KA/317cu1ykCcL0t7TBX9T3enKWu7sdxqk8kM0Qn6qGBgtErSxzfx0yNnOyfoKQqwi0MFMvTORKaTI5B2CWTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RjV1XAOr reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RjV1XAOr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRK4+pEhu0y2ursTNpMTyns9DrL6Rlfr9Y1g28RghnX5jx1xI0PQukXcOkC6m91tBcwV/LzPPa5/7USPn3CfjdCc9sQVvnlPqs0Sp/DBxcoh1op8A8fkIxjqHJChQzHuXWy8nLQ2vH567KDKNT8MwEx/5dY/UwHjdF6cL0ch7FoX3Wqi2TuhhOiFSaAL2lsPRIZ5/pkptxTcsDUBu8At5d34cql3p9IvQD1gnaCIDV3eDiioBYqhdB6VHxxyomNEg4xTYkOnoEcPac4f3ceS7trccwbhLJEKQMbcH8bZ9ZkfGQVe3dIB9yjbLCcOS6QpyPPT2F6r/Cb3X/abAXHuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYKq+veDhBBNXsv47hFw4oHUFrFv4ezcrOScxxxaRH4=;
 b=ddt57PLcyYQHFXWO/xZfHVclzzIgmNgMuxK9UwQxh9L+mfYOZyZq900JH6ZQTL5N9w64omdUpRN7OevJ64iqR27ipdy9uBSomnVUX9xhiygLQlbRu5KyO3Gnn+xXpfrzpN7t22RvLRsVfTHUFvxkOuT8k8FrolnP3DG73VrZydDSgd5+B3RxSxB83GTqbujDqb74kBW03TwRaUc+5LatFm48DT736f+fVI4Z4wURbxpr2MTna0rBBO7duON8FYm6J9nd9z83ckFyrlJI5KlM+/9xi3P0m5KMq05WkT6E1m92MqTa2SiR9670QbGF9TNdlZ8gtUGWJxih3oSM6029wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYKq+veDhBBNXsv47hFw4oHUFrFv4ezcrOScxxxaRH4=;
 b=RjV1XAOrnOrAq6HZQlftW7LmZ6YD2wx1T3FA5M75dpAH32NgXek1S0c9WE4FqHZJ7HVbzLIl52qLLddXaRCDucloECSDbzfpdLQiDsxwLqx/edbBTLanlMqe2mrob3drJ0SOV0/8PTOQjg7cys/xElbNroNsR7bbJrGd0jtPQp0Bwk3ijGJ4LYmloYHzXZDyrzGMTjcYhZAwqWVLk8cZPbYsf1ifNixMrLBfwTRXDLQqB3emKfnXEGLNq0F0qbkP7lo9+vNjvlM70ncntPFXPlDjVu0+uzAXfQUGD7IHuArXgqG0KiLw1JXWuVeSSKwd5UVqIe1VncDKtR2Cen9zFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11379.eurprd04.prod.outlook.com (2603:10a6:150:29b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 16:58:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:58:33 +0000
Date: Tue, 21 Jul 2026 12:58:27 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: tze.yee.ng@altera.com, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <al-lM4FdoekyTk4r@lizhi-Precision-Tower-5810>
References: <20260721033159.11789-1-tze.yee.ng@altera.com>
 <20260721034751.35EE41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721034751.35EE41F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4aec62-7553-4cc0-78e0-08dee7494c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+rs9BaLLAXvEGb2evOiZTjw5ErJ1IJ8jGCU6S8sKEaus6i1UIpojOfnzmgEQwD0gLFFIurCWxFpDvIO23fokX/F090gDGLzR7+PiqvCTeQ5vY52T21u+aG9QPaIuEvAR6PF6gqOoKojj6Gu43OJFln6gTrFG3XFLpbrXEwToPRQ0Bh5hfKmfPDirEF+8hDQMOkJ9noF2Z7jF0YBZe7RbEwGmLnpMBhnmuUOTLggxycBaBm7civBu/wv+hPQZF3kvB+QJ+S2vWp6TOSIKfWjv02wzi2h8WAZwSKHibyOlVHBdBH7nyul0GWFvacCKicAuQFRr8h39y9FlEqew7kdIIgOQfnclRnCPHHhSMkRQ1pAbRUGUsqeuNtuNhk0UA5X01JNtQUpAWEtfrNUc85kGtLgS3WfunNtnCwIznUiI8ZTZkAVLIH8fLF4e6kCB3CSRUV88d5EcmQo8J3HEA+jmL/EnxVQGVpX+zhzacvkLRv3SnMOWd+42ic6bJ8FyFYXhPhTzgpUIdb0I2VXDWmJSMBMICnNTk7PRbEGETHZX5bK/PCKzwiBUHW97xbHbsQAx2MyLxcUmoxEFoFSvc4fac3bICWa9UR7j+oA9s0RxWBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Btx5Qx0V+vxd+qoAfD1twdC/1XTpjAO+nJnEoLaS5RrthAqjYaYAdhu2RG?=
 =?iso-8859-1?Q?3xP/w5zgVy55kOEVPq8XNjCkC5Bh647RoiKoTjtpal2AzmA/vTMw1FLyZh?=
 =?iso-8859-1?Q?+qGpbxvKF9xqqBXEL2Bv4laLaU7lTITB5qaWa/ABjHkhCC5WRZRJBlQy5H?=
 =?iso-8859-1?Q?nabIVbNPwvBDrwhYnE1JadDh9IOF3gcq9xolrWm1dR1CBbI23m5I6XhGnD?=
 =?iso-8859-1?Q?roEmJU4OlDvC+XlY4LkbiOouApZYDvtIkkgjBb1DmrBeGi3kNvfCi3da7/?=
 =?iso-8859-1?Q?Qx0huaYEY3Np0e2/C4DxlxMsiVgVYfwhdUAybYYA38yWannXn1hkrNE0pB?=
 =?iso-8859-1?Q?+a/MXeVXhGSAyLOWN0s6omd6dSqbDZ/LVgAm+DFlEiGQ8SSN/6FHkYrMhN?=
 =?iso-8859-1?Q?qxeuC4bnxkiVZQg4BPSGUxN8C0YoHw/sPY7LmH1Rm6rTrHRNoX/1onNZgG?=
 =?iso-8859-1?Q?ekezQ1e7D5PUTfgSZQ6Wlr7YHDY0rOvEXtrKHAcv/OUxBdFK2ni2k2Z3Va?=
 =?iso-8859-1?Q?n5YyqvSc14fL51lbNbRIkxqZjWgFtCMS0IFiGqz4VVwMr5SzV+veaxrkau?=
 =?iso-8859-1?Q?NZ/lhUQl59az8dyC/+Ljw+n40dQ0RVb7YqxLP+278deMwrJODMa4C+9q9S?=
 =?iso-8859-1?Q?ojXtdZ09GE0zLqI74UdexJoQTxIq72DkPQobdghLokwqySaU0Ij079LgvF?=
 =?iso-8859-1?Q?S4uzYAYBPRhSryRQ3J8fFEqbNDqsBPbZSUkSj+LEENF99u1dJ35a09PwGe?=
 =?iso-8859-1?Q?H6AZNw2Gqpzo7jQK2dGbstAX2wNIMsePgLCgLFh31JTk02fW0/OJe0c6Kq?=
 =?iso-8859-1?Q?2KbeH+hIswfSSc/mnpldS+Jcclk0APMBpQKcpozihHid2ofk+donEz/YrZ?=
 =?iso-8859-1?Q?7xb5co0hDJNDLoQx7l3YwFu/fQsrzZtTNQZDe3eid/VKyEv6DsfxGQ5mBc?=
 =?iso-8859-1?Q?1ES6pBD5bvSt/qOJTgKDAyhQJStHiNL1iR8PfVzVA979edCHvU15LQKnr6?=
 =?iso-8859-1?Q?M//f7eji8uPPg+VnbE+zjCTil6SFP4SOaWjl910nJJJ40jdLuDtB9821RU?=
 =?iso-8859-1?Q?leCI2SKZw0L7SFH4XxHs+2aUTt8INY0qpYT6TeIrgs+4uFnV2ULsZbkwom?=
 =?iso-8859-1?Q?SpKO5QbMJ8+pt8+jksSbKv7rX+3SmjcXVsUF3O1ZRGd4tSdd6g8tnUQJMA?=
 =?iso-8859-1?Q?2R/NCJM/12h2o9PDjH3DuRJcJKL/OmkEYnVEluDaRhBaUZNsLtF5KehUNB?=
 =?iso-8859-1?Q?HmYcrQgx2zZGCgemkNeGfSvlt9wR6KAvKb5ia5t12pMa32DOjJYT0sK1hx?=
 =?iso-8859-1?Q?It3qAyIc689CvoLWPyV+Jh3dLr/wohEFWoEHh4098BTIk1YCS2atA4DFKP?=
 =?iso-8859-1?Q?Fh1yQGj97sIoPNqybCQuR6U9szbCoGfBfhAbH/WSbTkBZMET8tYtsAYl5G?=
 =?iso-8859-1?Q?+75GiF4Ek4RHaxFHbgBTaJkXzsKbCW5xvsoQ7jU2aJerOf9Z2heYV2lQqs?=
 =?iso-8859-1?Q?KAoVgnUsT8n8bKk1B49iJ38hrgR3DwcsIQjii4tePagGS7NkPNxEkSeJ3c?=
 =?iso-8859-1?Q?dwdXZ8CLdRwGBMakcbnLoZRacwAF46tTZ9ftNZWqo3h0G7zT5yt96O1pNx?=
 =?iso-8859-1?Q?UqGuRNS1JUY057lOZL9PvW7TARnNuc2cR91CB2zVcOfZxtoMZYrEvd1OTO?=
 =?iso-8859-1?Q?s0CEcvgo3uuUTNiV1bYGD8Hk+dlxWpOxIBxKY22NkG4a/yeqB3wq6rZ/Vu?=
 =?iso-8859-1?Q?ZniKQAALT4RseDp3rzsib2ZHiVaS43g4HnvsYLoojRJLyofVp9BWuCwBeo?=
 =?iso-8859-1?Q?wbJMNtCZS3cA8SwMxI2Nu+W5dfXiDvCxfMvL1IwVLmEc5m0L2Od6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4aec62-7553-4cc0-78e0-08dee7494c53
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:58:33.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUCzGO/WPZMMXQrt7mpMsioAEqMpSwT/CHWZQ1depkGSMvlQTExcVAABZYvMxeJgtpPHiU8id+jYhUUH2mehdPVKbOkUPgGJcucd0aeHIXauTukotq6t9/pi1dNuiDAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11379

On Tue, Jul 21, 2026 at 03:47:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The calculation for `od_hcnt` can silently overflow its 8-bit capacity if the core clock rate exceeds ~1.28 GHz, resulting in an inappropriately fast open-drain speed.
> - [Low] Using DIV_ROUND_UP() with a 64-bit numerator or divisor causes a linker error (__udivdi3 undefined) on 32-bit platforms.
> --
>
> --- Patch [1]: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first broadcast ---
> commit b82f29a59ae98bd18cbb544ded9a3bf8f8d60fc6
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
>
> i3c: master: dw-i3c-master: fix OD timing for first broadcast
>
> This commit implements ->set_speed() to switch open-drain timing for the
> first broadcast address according to the I3C specification. It caches the
> normal OD register value during init and uses a separate od_hcnt for the
> slow path so SDR extended timing remains derived from the normal PP hcnt.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 84ffcb1893389..077f2bf4b0b3f 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
>
> [ ... ]
>
> > @@ -1513,6 +1519,48 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> >
> > +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> > +				   enum i3c_open_drain_speed speed)
> > +{
> > +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> > +	unsigned long core_rate;
> > +	u32 scl_timing;
> > +	u8 od_hcnt, lcnt;
> > +
> > +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
> > +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> > +		return -ENXIO;
> > +
> > +	switch (speed) {
> > +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> > +		core_rate = clk_get_rate(master->core_clk);
> > +		if (!core_rate)
> > +			return -EINVAL;
> > +
> > +		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> > +		od_hcnt = DIV_ROUND_UP((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS * core_rate,
> > +				       1000000000ULL) - 1;
>
> [Severity: Low]
> Will this cause a build failure on 32-bit platforms?
>
> Using DIV_ROUND_UP() with a 64-bit divisor (1000000000ULL) will likely
> result in a linker error for __udivdi3 on 32-bit architectures like ARM32
> or i386. Should this use DIV_ROUND_UP_ULL() instead?
>

make sense,

> [Severity: Medium]
> Can od_hcnt silently overflow here?
>
> Because od_hcnt is declared as a u8 at the top of the function, if the
> core clock rate exceeds ~1.28 GHz, the calculation will evaluate to a
> value greater than 255.

less possible, but suggest fix it.

Frank

>
> This would truncate when assigned to od_hcnt, bypassing the minimum 200ns
> requirement and potentially causing spike filters on devices to drop the
> broadcast.
>
> > +		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
> > +			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
> > +		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
> > +			     SCL_I3C_TIMING_LCNT(lcnt);
> > +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> > +		master->i3c_od_timing = scl_timing;
> > +		break;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260721033159.11789-1-tze.yee.ng@altera.com?part=1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
