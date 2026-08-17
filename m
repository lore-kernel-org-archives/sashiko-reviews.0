Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE13B2FF6
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997338; cv=fail; b=mUT1ZXcsLa0QX244mn0QNTJEspihqowHqP9XbuVTxVAfKDAEMWxcT3uAmfuHYBZmtbo5FsJc+X15L88h8xGnmjfC5Qa9zwG6YIq2AoNyYqdw1WLJXy9Luud/sjHIOWsIdlY5mVrjE52tiiXVie7HfDbCsuJ7vf7huI64QILpvuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997338; c=relaxed/simple;
	bh=U2AJbUe2si++qNk/Y6jzqF4JTDeJVUPhMltblgZxHak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TicZAKBPqUdcxE0ccn/DO32vsCCByHp1FIJRRdNuP79BhJ0HZgtYb4Rgftql6ddlsqGPgBkfm6SbWxAL8ApHc4a8SzJ8UDeIFW1ImAeLvwxgRda58Yx03UeXALzLZd0oH74I8vaJ/jtx11PLq3gtd2tPeEaNbPsv7Oy8dUFNBMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WeFBO/7w reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WeFBO/7w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vE/95f5Sm3zzsJl5QJ5gTkg5eNN6HVTztLw1yJGr9BksmvYSIUbABV1jmg3C+0EZJaPU59sawHVIhB9q+OLq+aZBN2p/7fwGAxUSOPDASBUUN7CmgI2DtsBMiEl7AqhyiKFZQNJYVsH6N+gNQOIERag8byN/e8s6rKphaAoDq+FdrKWNQX6uM7JdYePafJB0a39U5lbFLYYiAp7eOD6+eSeyngGs0+YWo80qQkhWPj/+Q1iTpFN/HJuwi8dSnYzKuakeU6KD5R2jZEnKjjD9v/pRpaDlJEnbOkhr+0v4rtvZuUc4MEpUcohAfqpFUFnSTcnFWgOEQ/llvbvieiRAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diBu62Rv8f0hCQIAyhXqqx71lCvcHQoM8lBhWQSVuas=;
 b=Drq+0o9OwZ8uJqePkbF5Mi/6cbhnBCD4omUl3U+z2KLU6VN86jtPD+Y1wRQV5unr8UtyRXrZ9uXAYA/JRiFfTFNRkhfj9XY//VFktltKJ7NsW2fASTCAssOBqUXg7tvR4ayiRZvzBLiLSvbGLnnJEIVzgydLC3jesM+XONHN6HUZ9LOY9QCrgxdcVcnrSfA61HVuI4OjsuFxwA5WMVso8dbDzgrByWEKFGnDiKy6K0iWNslNclbN8FMgqrx2HJRrFiDzYdVaJbdzQgDyj4x8ln9jwDdomcvO+yR1hmrjcDtohutKdf0U8QiSDXNu+ulhXeUbUJhz/dcN8S7dPNNJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diBu62Rv8f0hCQIAyhXqqx71lCvcHQoM8lBhWQSVuas=;
 b=WeFBO/7wnjusOQymtQelfh8Y/aOoS7RyM4YQnoKF9IiWG4Jkf/+mQpNQ73/Pvmj5Ccx+VNjXTVpNAOfuYZS737yjIDuvXVry9gFbRSgXJD4N8ZE1vrILxJt6vmQAauda8T1oBJYZ6kVV09we+WIko/EiqUynfkqkcja5gIdNzGyTLS/Wor+FRCcxZ1cKp8L2s/s4/+aR6wL07vSmo0ZG2MN3Wat1L4nwd3xVX6f4pJhfIsaZkij7Vnfoq7xM9sVDuqGxBPLiTvneXPHNnCSKwKMUr/+xEmGronLl8NIT+dekgGPETpgUkSBn3rf8HvNWhsMp9BcEnMUWn17TCiPZHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 20:08:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 20:08:49 +0000
Date: Mon, 17 Aug 2026 16:08:41 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v15 2/8] i3c: master: Add controller-only device
 operation helpers
Message-ID: <aoNqSW7WDZBesI1u@lizhi-Precision-Tower-5810>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-3-lakshay.piplani@nxp.com>
 <20260817105100.462311F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817105100.462311F00A3D@smtp.kernel.org>
X-ClientProxiedBy: SA9P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f26b78-bb58-4f76-71c0-08defc9b59c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	AaKMTZnNHh8l1h+ffje46Nx4LL2Cgxy5881d0YLf7BmmwuZKUqa8yyn4/BMAVpJa+upOpb/HLBGgMWcqAR1tfx7Cc+PXrGG2p95aAS1lFks/+iiVqd20ki1uwDORM82oHv7fDCq4EM0SqMvIzR3mHLoQJTkQdVzVQOQXthQYHJMuTQeP/EZMTD8Aljlz4S+gpQ6CPC7LeQV0olHjnvCKV9OTT6tSa2kmGqVcioOD8Rl4UgSHBh5gHRLqSWb/sznHqjA3/mhF9aPKd/3oo4N0akTNsLYLK9n3+NkPqYMIE7GHzHPG8VEE3IROjU6LKZ99OeCUTrmFxD9Wz42BBbJWzwrMiInJh7y0NDyzvO6AitGsAk6gmE6pGgwILjHoTOylWGNR+3r2ymNKhUDceKIzHhalgv1H2Wl1caMKcIRuMGSr0w0gDARtSFOlIC3+OA5LOagsqo5wNWWYSz1Vd97tpV6EPfJmD5CXuF534+PXn3LAlaOVzWiYWqR4CBPL78uwzGFblTzNEZP9rT5ANZsZvFQzFzhqOWUvrAmTMc2EaFg7Ju6yEp4SmK8/Z8mXPLGPZX1s6/oMijfeSAVGoKo3RBe/L60+egzDjZ8jbE+lzJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zGIMIt8c9frKncLhMkc5ZiW0KFlBcHBAsLcpHp7SrdShgZ3fKr+5NufLdT?=
 =?iso-8859-1?Q?ekA+3/eiA5CjohEyPCrKmbKkQuydmqBGlTpxoiyvUBt2g5d9fnor5cAeqi?=
 =?iso-8859-1?Q?dnM1KiEmIba9O2cia3ceG3iXhy7XYcmgym685CB+GfYJu24v5B9yw1liQi?=
 =?iso-8859-1?Q?qjHqK92Uy1Hanl4tWJQS75AA+GMcYVPTuM3f7mE3hkBZS8XNvi8Z8wywqr?=
 =?iso-8859-1?Q?WYFPKkI0MD+ar2w4rCqPtAX/eKLsv3tIJLBLaBz9Bgw5dSNj+5WNVP9olo?=
 =?iso-8859-1?Q?gNo7RNMgpJWnES22abNzjyyR/77yras/lHXMXAxeieoX8cAQdzA0KyK1IW?=
 =?iso-8859-1?Q?iinC/rcgc6LUkGMAwgJKh6l9zuvKchkWLH7C2p/Trmeey3C85Nr7mTTw5T?=
 =?iso-8859-1?Q?ASQnlABGBS8XEL50BcwGZ7CeBZW7D2gVovmw4cPt31O8i38PoRLs+GmlpO?=
 =?iso-8859-1?Q?pIftPBGR6pxonCwR6CA08WAijEac6qivuXqXtfwwLKC9NAWiEzF+ygvPyb?=
 =?iso-8859-1?Q?hdf9E/cPQwLSymAUBDRO3H5saD7d+iHFfif4Ktr+LjuFzIAqcSM1142t0E?=
 =?iso-8859-1?Q?CInw3Mc7T7M/IDLfAouwZUqrIp5Rf5kV7Q4dMlt8pvMoWYL8G6fGCsjae4?=
 =?iso-8859-1?Q?57u7stpVXD6RVDGynUnKM55KkpsGb4jJ3nlI8gBgQUJQ2gH6FUhkrxhiFA?=
 =?iso-8859-1?Q?SvMeVPXsGAoCZOENaAi3XTpSMJHVqQQTd3D1dbWvqHanGX1T5ilAj1ZBac?=
 =?iso-8859-1?Q?e8+P66zjLlL3NphVl45VLjBl8vxW08mAp1vw1XNHTL63VyOqtpR0CeEq85?=
 =?iso-8859-1?Q?QIZbhJkSIbBPesioRsfxOGLNmZaKq0VZN5cTwTrtygMsw36yr6hr40CXC9?=
 =?iso-8859-1?Q?0ke0IoCT7WCwKBdnxYROz3JTEamfoOaqaQlpRMGFhm5FhMUBy8URHU+LTt?=
 =?iso-8859-1?Q?ySxHBglS2CHQ7+shJU0dTu+IDrdAqGCgnXuEUsUOPtT8vsXyeQgNhT3hx2?=
 =?iso-8859-1?Q?UMdghOM1rmeleoVyimfBz+JnNUO+EgdBgylAiqHOVWJTG8l3awQxuuhKW7?=
 =?iso-8859-1?Q?a7iUpdlFEeULHmwSMkYMlTTi20wAvshssuuLVIuoo325loyZZ1D039dvJ0?=
 =?iso-8859-1?Q?eDdZj21O9D6JuCPrH9nPAvItI4C6Uf2n5YoNYaGe7SOXV6KsYTGlKaNC2M?=
 =?iso-8859-1?Q?B9lpk+A9XGhLd4PiME/cafgVt4osmcZ5hL7Kkulm0QqU+HStV86d6i+S63?=
 =?iso-8859-1?Q?ll5lEPadb0ZC5F+70rvW5W54WN2KOOcO0Jiod7JVOokUhi5aV4bZP1mP3O?=
 =?iso-8859-1?Q?s78P4tZ1v+aBtDUwnmOyvuLWGwUfB9BFuG+rhtCrR3qRvpen6UbXkmgowa?=
 =?iso-8859-1?Q?fmr1QHOF0zGyGsWrupFzd3R4oTfy9T7QZpfZKVTMB0ss31/fTFRrE4sShW?=
 =?iso-8859-1?Q?6mCK33TMqDBF/lp410dw5IOxGoWRy3aFAVSCGZbfuoTARlToMzNXrpuZgq?=
 =?iso-8859-1?Q?26iLHndhARFoTonFpQanfB5k/AHXm//wSypSc+GX0hYsytqSuuxSYLjpy/?=
 =?iso-8859-1?Q?c+TxDfOS2XYzNlDOt2o6zeb/jaxJerM4MgLonsHOt6g5tMTc9nKHj4q8VP?=
 =?iso-8859-1?Q?yDX///r5sgp/nWT+7xj0WM6p2HUdHFKOPGfhiGmmOggLzkrPNTwt4i1Jjl?=
 =?iso-8859-1?Q?tY2eiKmS3N37ZFHSxAIxQ6bbzdVhGZyvUqyJsX1JuLNyBBm95qy5hWi+PD?=
 =?iso-8859-1?Q?Dx8TENmBLxTlQv0BpbL7zi/JqF/TI1WzZ/KKjvp4c/68+sK/rg7B6phwDZ?=
 =?iso-8859-1?Q?DxAOvFFlpYKGLbUVaekNzupYQM2StqwzjcbvyUXSpOPb3bPKT+Jc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f26b78-bb58-4f76-71c0-08defc9b59c0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 20:08:49.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibVKILXTXN4bycYwsA5knv+h4Miz13q/B0j4gJl3ryzMMlKr93eU7455vD6SKVPlQOcKjuQ+/WfD/GJzDFBNbwqLDoyWQbRmSUKDxduhjQKU1cZbvpUtCdQm50YcDVI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297

On Mon, Aug 17, 2026 at 10:50:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [Low] Incomplete refactoring: `i3c_master_handle_ibi()` bypasses the newly introduced `i3c_dev_recycle_ibi_slot_controller()` helper.
>
> Pre-existing issues:
> - [High] Missing memory barrier in `i3c_dev_disable_ibi_locked` causes a lost wakeup and indefinite hang.
> - [High] Use-after-free on error path in `i3c_dev_free_ibi_locked` when workqueue is drained after resources are freed.
> --
>
> --- Patch [2]: [PATCH v15 2/8] i3c: master: Add controller-only device operation helpers ---
> commit 85e9cb3ce264f7889b2b4406bc379307ad054a14
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> i3c: master: Add controller-only device operation helpers
>
> The generic I3C device attach and IBI paths perform both core-level
> bookkeeping and controller-specific operations. An I3C hub, however,
> maintains a logical device descriptor on the virtual downstream bus and
> a separate parent-facing descriptor used by the physical parent
> controller.
>
> >     Add helpers for:
> >       - attaching, reattaching, and detaching a device from a controller;
> >       - requesting and freeing controller IBI resources;
> >       - enabling and disabling IBIs at the controller;
> >       - recycling controller IBI slots.
> >
> >     Refactor the existing generic core paths to use these helpers, keeping
> >     the current behaviour unchanged for regular I3C devices.
>
> [Severity: Low]
> The commit message mentions refactoring the existing generic core paths to
> use the new controller-only helpers, including the one for recycling IBI
> slots.
>
> However, looking at the code for i3c_master_handle_ibi(), it appears to
> still bypass the newly introduced wrapper:
>
> drivers/i3c/master.c:i3c_master_handle_ibi() {
>         ...
>         if (master->ops->recycle_ibi_slot)
>                 master->ops->recycle_ibi_slot(dev, slot);
>         ...
> }
>
> Does this function need to be updated to use
> i3c_dev_recycle_ibi_slot_controller() to ensure the virtual controllers
> in the new I3C hub framework can properly intercept these operations?

Yes, please update it also.

Frank
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 03fb41f0786c5..7ae6b3aaa9b4c 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -3534,14 +3632,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
> >   */
> >  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
> >  {
> > -	struct i3c_master_controller *master;
> >  	int ret;
> >
> > -	if (!dev->ibi)
> > -		return -EINVAL;
> > -
> > -	master = i3c_dev_get_master(dev);
> > -	ret = master->ops->disable_ibi(dev);
> > +	ret = i3c_dev_disable_ibi_controller_locked(dev);
> >  	if (ret)
> >  		return ret;
>
> [Severity: High]
> This is a pre-existing issue, but does this sequence lack a memory barrier
> before checking the pending IBIs?
>
> Right after this return, the code does:
>
> drivers/i3c/master.c:i3c_dev_disable_ibi_locked() {
>         ...
>         reinit_completion(&dev->ibi->all_ibis_handled);
>         if (atomic_read(&dev->ibi->pending_ibis))
>                 wait_for_completion(&dev->ibi->all_ibis_handled);
>         ...
> }
>
> Since reinit_completion() performs a plain store that can be delayed or
> reordered after the atomic_read(), could a concurrent IBI worker
> decrementing the pending count and calling complete() race with this?
>
> If the worker executes between the load of pending_ibis and the delayed
> store, could the store overwrite the completion state back to 0, causing
> wait_for_completion() to hang indefinitely?
>
> [ ... ]
>
> > @@ -3667,7 +3835,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> >  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
> >  	}
> >
> > -	master->ops->free_ibi(dev);
> > +	i3c_dev_free_ibi_controller_locked(dev);
> >
> >  	if (dev->ibi->wq) {
> >  		destroy_workqueue(dev->ibi->wq);
>
> [Severity: High]
> This is a pre-existing issue, but does this cleanup order create a
> use-after-free risk during an error path?
>
> If disabling the IBI fails (for example, due to a hardware timeout), the
> error path continues and calls i3c_dev_free_ibi_controller_locked(),
> which frees the underlying controller resources like the generic IBI pool.
>
> Then destroy_workqueue() is called to drain the workqueue. If there are
> pending or executing IBI works still in the workqueue, won't they try to
> access the freed slot pool when they run, resulting in a use-after-free?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817103844.2142802-1-lakshay.piplani@nxp.com?part=2
