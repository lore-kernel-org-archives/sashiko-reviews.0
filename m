Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901751A9FA4
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058065; cv=fail; b=P8y+MHXAHVb+nvHZqfBoD6V9ZXN6wlj4bWQluWyUd+EJPyjaeNDGZPaHzyldKqRO0/WfQq1xwl0omnEEXtIgZBhOn0m9hlTR87tOb9VaUBHmCzW+m/GCUFTo93OEdMeQctw2qksQCY6rAUHczXTvZGXvlqAtA8q7JbES9eCajRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058065; c=relaxed/simple;
	bh=UUWKWcY1EYqzpGNjwWRnKnwQX0v33Q1A0nIPQ4++oRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oPntnkxUx2WpgOI2eYP8eXUPzZTSblC0uWdz7nVtAiD5vLI0UFraM4gydyWxtdO+wj4Ce6oj3rgUkGDvmX3x7NioTZfUoeIDF3azkkUm8W3SOjbtKj/EKgfHrrsL9AslzzQptGKsMgO3qErCoqpIIGj7WGjl6VmkMuBb30+B4hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R0LCvcxl; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R0LCvcxl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmeCl+/YdO8cGkpaznMT2EZwnWgf1KYx2H3RcLi666J4rjZlO00iD5p10gDqiLIQRg/y8Rbp20Z5fltDH8eLFBQTrp8AFhc/ZhPPLIwGWYxTuPomvbUgcIYu+ldFEIcD7Ti+3LR+ANtacpNM2CIE6X3kaHmuR7tAo8FNhEVazIBLgyxPq5tDaq36++p6C0onXPE0oPcqFXRkhnI94rU2K+/BDl4PhPQI6glcK7HDO6dWvLmjjWMDpvg///GX3YLg2dvrtVQHGL9NBSxUihSHnKFPG8CHT/kHTmb6lBPP/9vXvoeIiGswDyo/j24TUWztaohLYEEHOhgQFk0cgCPAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xby6GeTeWhE9c6qdiENhBN7bC/CzKfT8ZcOsDmV7aOA=;
 b=eBrkpNUqnjjvbl8fd7n9L6eqXoonqwGo1zdZIGXvcoN2Il2TF0JT+0/GbDiEvLNGmfSDJCePb/82zh1NyOebWIeZ2vIIFpQiVZMrA41AlAgmd5m78cpUv1GadGdCt0KhCEJ6gvS8CrU/+1WH+BC8C2gpYUUNivFB68uGDCWGFLhqZ56MTr5lgtrXBMvOPN8C+VPBAHfnG3spcQrc98xCDV0N1oltG+SubpblVfLWBfaXEB9eRZ/FdMEiF1juzetwgm15qHU9G0gJgsXfz+2WQ6GCHXYhKbrBvhYHS9n9huaoV++hpNgGdlrc/0aH8U+9k7/eYKLM4DuGAijD9OggKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xby6GeTeWhE9c6qdiENhBN7bC/CzKfT8ZcOsDmV7aOA=;
 b=R0LCvcxl2KjZGHroisbEIwbNRELuAgqgLyETv74l/f884uF6KYV6lz1mN0yJk3UaHolOv9vSmtw2vsGWZ6gyj1/tiRoE629msEVv+30JFIu6aUx2Lxx0jbyRqS/E7ox2XYysnyV17gSrMnk/WrIpyo0aNz79iniHMcGl5JF0Hz4S0ozPNVpmGG7GwyxyKJmmrf/5brnAg67Fjxez59sbl71kDuuqZv/i+Aaira8voQihJTIIf86NrbfvEJemRsTQ6BnkGu2MBG24PIJYdwiVTQjte7ATzB1sn57wQuUyM3/9qzUAeJI/0UwhObZXvNDay1ymXaD5Ll/JREVsuk/qmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AM9PR04MB8307.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 12:34:18 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:34:18 +0000
Date: Fri, 29 May 2026 15:34:15 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com,
	vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH phy-next 12/13] phy: lynx-10g: new driver
Message-ID: <20260529123415.pmeau3f33zwj6caw@skbuf>
References: <20260528172404.733196-13-vladimir.oltean@nxp.com>
 <20260528182030.9027B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528182030.9027B1F000E9@smtp.kernel.org>
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AM9PR04MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd462a7-7c11-4403-9e5c-08debd7e9a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|10070799003|1800799024|366016|18002099003|56012099006|4143699003|3023799007|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JyAUxlmIooMpuXPXIpsGMkeahkqqXF6IH9CegcIR2bikXDEIdt7wn73X0TNPJ9rVMGu+wMyt4vBUekYBseIt/0iTaUQF8D93tXiKrEgY0/7KyNfcDDKuEiPwV5B+nAkGpg0VZEOl0Os2S8f8k+gZfHmDMSH6JGT94fipdOpHmOyyd5ByY47Hd5WIspn2GjopohwO7nFRAudw3KMOlnj/E+15pVY1CXhGKvH1+m9wLpTuvrw/azlLctICWRBykPwoHmi67HwUNru3726cJ81K0qjRZVwz89XBF5kc9Cy5iYlBQOPfcevKq1q9eEO2RsT08F62YsD516yCcmxLl2vTBpralmDR++d/WaKadgIQe5LmIM/F2xa5M3+B2+xxlDexiOb1JImKt5sFK/zP1RigPRqOrlsSiVP4ju7dq4BC9cUC8g7c4eTkWfSuPxuHSxHMi3JWmL/HMIkBE5QsT3rI/GOX0e16JVP1wCajGfusVOBZYBB+8xuBsEmHdxNiUARm8jLcnlfkR8/BdPpdoKhTv2KfWXeTec4f0JgEWwSuagDWe0gl/4UAz7Hssf60XSFfFyd92Lb7VgRwQhQUIawP9i6SKPbjQMp+Uz9GtjfI8to4pLegiXz19VEQPTEqbRFJtvvx78Y8itFKsh4FaEmTfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(10070799003)(1800799024)(366016)(18002099003)(56012099006)(4143699003)(3023799007)(11063799006)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?urDZHE4TI9HbBPjBqvDX8VyvpTboUqcIg66EOCO1l0PRE/gi/AR/dAvrt2?=
 =?iso-8859-1?Q?dOuO44FGziiNVvA3MXCY1o26StMPU3BtLJgt+84PSdSjBbbGo9QQDoiz9X?=
 =?iso-8859-1?Q?S1sHvYsCtE9ry9kCOBMj1NC+hO9mi6yWJpGGmY9KqiobT57NxeUEh3DvNq?=
 =?iso-8859-1?Q?6d6QVi56hgxTlyzshSBrSkrJKDyX+nLVZiDH4Aba1gaxTyEP7Rrz7m+N9p?=
 =?iso-8859-1?Q?GoQO6CD6AVa6VpIeWdcjNKNBfZkkl+m46w4pPP4CYLSl6RKLPLs+Gvm5Ug?=
 =?iso-8859-1?Q?TJfKBWcRzI3eILmTdsQ5py17/74KlVv9cFfwvDBmlD54DrXh6Cq+83MRaW?=
 =?iso-8859-1?Q?CG5v1CCVLiJLFGRTPCs7uxS6fDLHx/uL4PbdetAgEo6hf8l/7PV1O7KgS1?=
 =?iso-8859-1?Q?qWzETnNv9n6pV4UloI2DFvRsqPTc7Zn4VMZel90IQ41AQ0Ig8HkUFI0E11?=
 =?iso-8859-1?Q?fp5QDW3JaTnq7XdyA31/byLhGPWt1Td2DmvnZ8O4G1hwmVHAmnFMg7rRqH?=
 =?iso-8859-1?Q?OEVkAfObb6PYRapjtcjx+m8q30Se7DexMxufuU01TnrzmaIqzB/xdF/f+k?=
 =?iso-8859-1?Q?B7+LLyipyUbDSImgXBKqhdxH/mJtMYsvxMTuODFC8Q9YryGZG2NXtDrkox?=
 =?iso-8859-1?Q?bXOoEp/2voqMigD56JN6rKTCHOl4ylix5uAvVA60kOiXzA0KjM9iAhFZnN?=
 =?iso-8859-1?Q?v4sW4DvnsauMtR1EL6a0jp0YwLGkCE2x2QVcdC/sQh+7kOCJZTiHTY6aSd?=
 =?iso-8859-1?Q?cGSclLW9wN3+AjgDflObFzXHIXfaT4v+eMH4qa2uqJcYXLcVQwY3/pe3Tg?=
 =?iso-8859-1?Q?GOa7bWixA9MAfBVBFyhh0zxsK69tGVRZDlebCJ6R3vsVbe4dpihVEQQcU7?=
 =?iso-8859-1?Q?AU2eZ7OMkXwhd6yAl3wZ9I7y+/P++bTSNYJnB8pqOsi/AilkbOIgssgrMm?=
 =?iso-8859-1?Q?L2RddTBjcto7B3/qjZ5CzsoU9h0PxQT5OCUJZmkLh2Y/wwkdCdEuu2xFLk?=
 =?iso-8859-1?Q?T0dqQpmHvzJqTWaG9r9I9zRwh9ZaXkKj3esPjUh3t7yVSojmMp8NfqwAQX?=
 =?iso-8859-1?Q?AeheP/wMIbBf8GBpeT2pS3PUz45bVVXaRovv6vS/HDQYp+7tUVk8r6ZFY0?=
 =?iso-8859-1?Q?pVZJkwVsrr7x9FBkLpqIBmFw5ukITkm6aHJArnVHdC7kCN5DBf659tpUuG?=
 =?iso-8859-1?Q?sAi63YTClNSKpgBqcx05SqbwwxdfyqrefR9Jcp+S8BIuBAGIhpBbx/bk+0?=
 =?iso-8859-1?Q?Eo16sUx5JclxsEufMtVBH6gF9IaUGzASnXkQTRq3VfTJr7Q6L0K8SBUU5e?=
 =?iso-8859-1?Q?2tGrqVeUEbHzADX4UWZiGUzoZXBZg35vjFf2z4E+3xCPLI9ztw9BDNwOig?=
 =?iso-8859-1?Q?jm9ImHJgheMqI+YUoXEUwk/FP6mLHXEepHcM2Ip1BENQ/pDkVc85wlKwfT?=
 =?iso-8859-1?Q?C4XqzQbb0jjaKrcOa2MfZS7s/po3GEEglHz/dUTStLQYOhViQCHIC+b2RM?=
 =?iso-8859-1?Q?5nXjLSbWvgOHKN9QOpUktg+o5sz4Flp05vtJ6nuZ7ct9sQ4e2SlNWk5gDZ?=
 =?iso-8859-1?Q?6sbCT63fYUD3MzUgj3PQOcCyTnIfD2N+5zVoyVfXJQWAcZmiGGjz22nWpz?=
 =?iso-8859-1?Q?Fx8FeVNh6po002ND93OyizRj5YUX55SxlCldqb2M6uz0dw/FwWy5aEc1k/?=
 =?iso-8859-1?Q?Gy3ZQpzsnoed+wbzC9nq7ns/Fe+PkQShCP0ndO0VIeu4lBO/He6XiwKYnH?=
 =?iso-8859-1?Q?AiJrV3KCvfAKRvp2WPQod/rCWW2M+uB8ibqUszw/Cd9ECxirj0iE6+X8ab?=
 =?iso-8859-1?Q?QasQu3w/Wm3arC1p6klWE+cbel5QNWabUVcc9TYyNYJP677aMUG9S7yb48?=
 =?iso-8859-1?Q?cc?=
X-MS-Exchange-AntiSpam-MessageData-1: bzrDSLC5b2rrAW+VkzliHbI0ocDycZMV514=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd462a7-7c11-4403-9e5c-08debd7e9a2c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:34:18.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwLD3nsRLRQzkcn47rKFBB6gfESVupcmyHSMlg8cNaJbDXDs6gAhf94hoc3lGHsm4FbWRgZbO0KOuYZymJ8f6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8307

On Thu, May 28, 2026 at 06:20:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Lockless read-modify-write operations on the LNaGCR0 register create a data race between asynchronous CDR lock checks and PHY configuration.
> - [Medium] The return value of lynx_10g_lane_enable_pcvt() is discarded when called inside WARN_ON(), masking hardware configuration failures.
> - [Medium] The return value of lynx_pcvt_rmw() for the CR(0) register is completely ignored, masking potential hardware failures.
> - [Medium] lynx_10g_validate() incorrectly permits transitions from LANE_MODE_UNKNOWN, which are later rejected by lynx_10g_set_mode().
> 
> Pre-existing issues:
> - [Critical] The delayed work priv->cdr_check may unconditionally re-arm itself, leading to a Use-After-Free upon device unbind or module removal.
> --
> 
> commit 8617183053a524e1cbc4453e0e8f8e478c4cf8ef
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-10g: new driver
> 
> Introduce a driver for the networking lanes of the 10G Lynx SerDes
> block, present on the majority of Layerscape and QorIQ (Freescale/NXP)
> SoCs. The consumers use the Generic PHY framework to reconfigure the SerDes
> for requested link modes.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> > new file mode 100644
> > index 0000000000000..28b0823574684
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
> > @@ -0,0 +1,1319 @@
> 
> [ ... ]
> 
> > +static void lynx_10g_cdr_lock_check(struct lynx_lane *lane)
> > +{
> > +	u32 tcsr3 = lynx_lane_read(lane, LNaTCSR3);
> > +
> > +	if (tcsr3 & LNaTCSR3_CDR_LCK)
> > +		return;
> > +
> > +	dev_dbg(&lane->phy->dev,
> > +		"Lane %c CDR unlocked, resetting receiver...\n",
> > +		'A' + lane->id);
> > +
> > +	lynx_lane_rmw(lane, LNaGCR0, LNaGCR0_RRST_ON, LNaGCR0_RRST);
> 
> [Severity: High]
> Can concurrent modifications to the LNaGCR0 register corrupt its state?
> 
> Since the priv->cdr_check work runs asynchronously, it could call
> lynx_10g_cdr_lock_check() and modify LNaGCR0 at the same time the PHY
> framework calls phy_power_on(), phy_power_off(), or phy_set_mode(). These
> functions also read-modify-write LNaGCR0 without per-lane locking,
> potentially dropping reset or power-down bits.

This is why lynx_cdr_lock_check() acquires &lane->phy->mutex prior to
calling priv->info->cdr_lock_check() (lynx_10g_cdr_lock_check). The
concurrency is blocked, this is a false report.

> [ ... ]
> 
> > +static const struct lynx_info lynx_info_ls1028a = {
> > +	.get_pccr = ls1028a_get_pccr,
> > +	.get_pcvt_offset = ls1028a_get_pcvt_offset,
> > +	.pll_read_configuration = lynx_10g_pll_read_configuration,
> > +	.lane_read_configuration = lynx_10g_lane_read_configuration,
> > +	.cdr_lock_check = lynx_10g_cdr_lock_check,
> 
> [Severity: Critical]
> This is a pre-existing issue, but can the delayed work priv->cdr_check cause
> a use-after-free upon module removal?
> 
> If lynx_cdr_lock_check() unconditionally re-arms itself with
> queue_delayed_work(), cancel_delayed_work_sync() during remove might wait
> for the current execution to finish, only for it to queue itself again.
> After device memory is freed, the newly armed timer would fire and access
> freed memory.
> 
> [ ... ]

I asked an LLM to look at whether cancel_delayed_work_sync() protects
against attempts from the work to reschedule itself, and it looks like
it does.

  The disable count is incremented at the very beginning of the
  cancellation process and decremented just before the function returns.
  Here is the call chain in kernel/workqueue.c:

   1. cancel_delayed_work_sync() calls __cancel_work_sync(work, WORK_CANCEL_DELAYED).
   2. __cancel_work_sync() immediately calls:

   1     __cancel_work(work, cflags | WORK_CANCEL_DISABLE);
   2     // where cflags is WORK_CANCEL_DELAYED, so this includes the DISABLE flag.
   3. __cancel_work() performs the increment:
       * It calls work_grab_pending() to claim the work's pending bit.
       * It calls work_offqd_unpack() to read the current state from work->data.
       * It calls work_offqd_disable(&offqd), which increments offqd.disable++.
       * It packs this updated state back into work->data using set_work_pool_and_clear_pending().
   4. __cancel_work_sync() then waits:
       * It calls __flush_work(work, true) to wait for any currently executing
         instance of the work to finish.
       * Crucially: While it is waiting, if the running work function tries to
         re-queue itself (like lynx_28g_cdr_lock_check does), the
         queue_work logic checks this disable count and fails the
         enqueue.
   5. __cancel_work_sync() performs the decrement:
       * At the end of the function, it checks if it should re-enable the work:

   1     if (!(cflags & WORK_CANCEL_DISABLE))
   2         enable_work(work);
       * Since cancel_delayed_work_sync passed WORK_CANCEL_DELAYED (which does
         not include the persistent DISABLE flag), enable_work(work) is called.
       * enable_work() calls work_offqd_enable(), which decrements the count back
       to its original value.


The LLM then makes a note that since commit 86898fa6b8cd ("workqueue:
Implement disable/enable for (delayed) work items") from kernel v6.10, a
new disable_delayed_work_sync() API function exists, which as opposed to
cancel_delayed_work_sync(), does not increment the disable count just
for the duration of the function call, but rather, leaves the work
persistently disabled, such that no future attempts to queue it from any
context will succeed. For this case, though, cancel_delayed_work_sync()
vs disable_delayed_work_sync() makes no functional difference, since we
just schedule the delayed work once during probe, and then the only
other reschedule source is itself.

> > +static int lynx_10g_lane_disable_pcvt(struct lynx_lane *lane,
> > +				      enum lynx_lane_mode mode)
> > +{
> > +	struct lynx_priv *priv = lane->priv;
> > +	int err;
> > +
> > +	spin_lock(&priv->pcc_lock);
> > +
> > +	err = lynx_pccr_write(lane, mode, 0);
> > +	if (err)
> > +		goto out;
> > +
> > +	switch (mode) {
> > +	case LANE_MODE_1000BASEX_SGMII:
> > +	case LANE_MODE_2500BASEX:
> > +		err = lynx_pcvt_rmw(lane, mode, CR(1), SGMIIaCR1_SGPCS_DIS,
> > +				    SGMIIaCR1_SGPCS_EN);
> > +		if (err)
> > +			goto out;
> > +
> > +		lynx_pcvt_rmw(lane, mode, CR(0),
> > +			      SGMIIaCR0_RST_SGM_ON | SGMIIaCR0_PD_SGM,
> > +			      SGMIIaCR0_RST_SGM | SGMIIaCR0_PD_SGM);
> 
> [Severity: Medium]
> Could this mask potential hardware failures?
> 
> While the return value of lynx_pcvt_rmw() for the CR(1) register is checked,
> the subsequent call for the CR(0) register discards its return value. If the
> register access fails, the error would be swallowed here and similarly in
> lynx_10g_lane_enable_pcvt().

This is intentional. The reasons for which lynx_pcvt_rmw() can fail are
not time-variable, so a single error check is sufficient. If the LLM
looked at the errors being propagated it would have seen they are
because we were unable to get a protocol converter for the lane mode,
which would be a code bug. The "potential hardware failure" being masked
is a hallucination.

> [ ... ]
> 
> > +static int lynx_10g_validate(struct phy *phy, enum phy_mode mode, int submode,
> > +			     union phy_configure_opts *opts)
> > +{
> > +	struct lynx_lane *lane = phy_get_drvdata(phy);
> > +	enum lynx_lane_mode lane_mode;
> > +
> > +	if (mode != PHY_MODE_ETHERNET)
> > +		return -EINVAL;
> > +
> > +	lane_mode = phy_interface_to_lane_mode(submode);
> > +	if (!lynx_lane_supports_mode(lane, lane_mode))
> > +		return -EINVAL;
> > +
> > +	if (lynx_lane_restrict_fixed_mode_change(lane, lane_mode))
> > +		return -EINVAL;
> > +
> > +	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> 
> [Severity: Medium]
> Should validate() explicitly reject transitions from LANE_MODE_UNKNOWN?
> 
> When a lane is initialized to a non-networking protocol, it defaults to
> LANE_MODE_UNKNOWN. This function permits the transition because
> lynx_10g_lane_mode_needs_rcw_override() returns false. However, when
> lynx_10g_set_mode() subsequently calls lynx_10g_lane_disable_pcvt(),
> the underlying get_pccr() function returns -EINVAL for LANE_MODE_UNKNOWN,
> causing set_mode() to fail.
> 
> [ ... ]

It seems reasonable to reject transitions from LANE_MODE_UNKNOWN in
phy_validate(). First and foremost, the lynx_10g_proto_conf[] registers
will most likely not be sufficient to transition a lane into a supported
protocol. Only supported <-> supported protocol changes have been tested
and should work. I will add a test both here and in lynx-28g.

> > +static int lynx_10g_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> > +{
> > +	struct lynx_lane *lane = phy_get_drvdata(phy);
> > +	bool powered_up = lane->powered_up;
> > +	enum lynx_lane_mode lane_mode;
> > +	int err;
> > +
> > +	err = lynx_10g_validate(phy, mode, submode, NULL);
> > +	if (err)
> > +		return err;
> > +
> > +	lane_mode = phy_interface_to_lane_mode(submode);
> > +	/* lynx_10g_validate() already made sure the lane_mode is supported */
> > +
> > +	if (lane_mode == lane->mode)
> > +		return 0;
> > +
> > +	/* If the lane is powered up, put the lane into the halt state while
> > +	 * the reconfiguration is being done.
> > +	 */
> > +	if (powered_up)
> > +		lynx_10g_lane_halt(phy);
> > +
> > +	err = lynx_10g_lane_disable_pcvt(lane, lane->mode);
> > +	if (err)
> > +		goto out;
> > +
> > +	lynx_10g_lane_change_proto_conf(lane, lane_mode);
> > +	lynx_10g_lane_remap_pll(lane, lane_mode);
> > +	WARN_ON(lynx_10g_lane_enable_pcvt(lane, lane_mode));
> 
> [Severity: Medium]
> Does WARN_ON() discard the error code returned by lynx_10g_lane_enable_pcvt()?
> 
> Because WARN_ON() evaluates to a boolean, the actual integer error code is
> ignored. If hardware configuration fails, the system might proceed as if
> successful, incorrectly update lane->mode, and leave the driver in an
> inconsistent state.

Intentional. lynx_10g_lane_enable_pcvt() fails for the same reasons as
lynx_10g_lane_disable_pcvt(), reasons which are not time variant.
We already checked lynx_10g_lane_disable_pcvt() above, so there is no
reason to check lynx_10g_lane_enable_pcvt() too, and complicate the
control flow.

> > +
> > +	lane->mode = lane_mode;
> > +
> > +out:
> > +	if (powered_up)
> > +		lynx_10g_lane_reset(phy);
> > +
> > +	return err;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260528172404.733196-1-vladimir.oltean@nxp.com?part=12
