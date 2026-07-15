Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3B3624C2;
	Wed, 15 Jul 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146353; cv=fail; b=jZ4jXMJlc/TbkFb7+1rgHCxnQ5mUGb+MJdm2AkSfmW/g6BIWrhzzKDxE1NwY8GZXGxypVlDRxdQBPVVJDPNZ34kanUrFIOxKbeOkWnuoVRHMuu3kt6B72oEudZ7ynMCC5s34BtskUVvwVkmbc1Q/f2cL522j6YIeDMM7bUusoAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146353; c=relaxed/simple;
	bh=v9tKo8bGP/e1Sh3G3vPcZN5Mnsa06UXjDBK3mMPmwO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mj/8bPPstvIPxp9cyYeKOmkty3Q7fwUjTkpqROky0sDBkC+689ClagQvUvqS3x6ahH6BGywZxnuVYwkQE6zBdeS1T6QKgSdphww7hPVn10zfCtj4KRY7DmfxagjMMHeZktWIDx/5kjQ72EEQSr94I8qRZe23+oPp+weHUc8uHI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OmnrnxQk reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OmnrnxQk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNgomUim8jRqeSglMGHc4OCjWvg5eMpXnCbGPC1A4ytcNZkHjUsgs6NJ3ulIdTXVGeVt/tzAd+QUnv2eakuhV8sRr6Vgzp7zKZuY2o3eWmzVxAll5fM25LACuewvVGbLLNm2S6DhbYVuVYk01Kd3rBRpqj5Cv54lGLuyqghaT8As+5Q/Ywc5gw9SnjP8AgUj9x1GfP40cCo7Y9g0qe7TBNe+eTM/feB7c8gLCMNFb+o9FiQc2yxwjGy2fzvLp64ngaj0yjPJigFU3zv+LYXgFoo1CykrtOTmBnHXJU0dLgZGEOrYbLEscxpV/qp4sdlYVZF6mlyYAjyZ/V/cUr/8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWt0ECucVWPs6sa6W/zYXSvFV9moo3O/cRxNYnLH+Fo=;
 b=VYPT6s2yjG4ysQaJyfvplq1VBBPBWDYtq8RenNC1wr+jXAnKWq+8Rh2U3tnljQDrZ72bTqvGrOoR4ZES2SgIw7OCQcYYwBDJq+1Mgs9owHlKZowNLAEQAtnH9UoB4TwxA30cFuySEWlYSv8h5M61zKw3om17nlI7dZABpDn+1ZLDGUS//5fox/zGkbZX7WXRUfEzc4NaQIQ0Z9Bw+BZY7TFQ2qTTLLKnfroMLB+TPx5AfxmDMUTd3W3vxgmzZkhB4/Ok/OV3tggYwzT1YpAZ/Ayyf2bCA+P7wOyD1hv877ezb8qJXvxrtgcoUYlkYDb+dYnxG+t/rNQd5cTBCYjIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWt0ECucVWPs6sa6W/zYXSvFV9moo3O/cRxNYnLH+Fo=;
 b=OmnrnxQkM+EX57wnUW6Cuo2qeaTIe+qCyl43pJWBEiF+1GewFc/myQ0YnGMlW4o7d9wmOLsrqxueli+55bqm0z6GhiljgrkUoH7LZYCRUPx+b83hAMKnF6UUq89RZtxAt/6yyucsMsW+tY26xgqZ8ZVLHM7LNgor5umucMnluJrqvrRf47eWv4OwF1suMKH8Wf1WDun+tfk2S/2vf78OFKpRwdH7RtSgal7EpsN6qc14kLgxfBFighXI6nMydCijD4bTqahC4zg/tayRriSmq45ee9GJ2BB6akcfFdG2qHJ3kRIU4HNkE9OHm21RG3jKUUIGV578/4q4fis8CquD5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9792.eurprd04.prod.outlook.com (2603:10a6:10:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 20:12:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 20:12:28 +0000
Date: Wed, 15 Jul 2026 15:12:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use
 mux_state_try_select()
Message-ID: <alfppbOGE4bC5h2s@SMW015318>
References: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
 <20260715195143.DEFC81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715195143.DEFC81F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:510:323::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a95769-663d-4174-8952-08dee2ad64f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|4143699003|5023799004|56012099006|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yfdCD5YiqSGJPOW5eLjqgpjo9JXuVtua5N1M6/1FVypSEbhyvbOJARDEFZ3Yv+yFyys8dMSLmvPlJhQH2GPt3DTHguDsTDbvS+pIeD682zot1prdDHzibKE+Mk2M/95bt1Ih66u+6s2K9u6dr0gzxqeDBWKNPyy4MqAQeQXhmcJBZV1Mqp0mSqaCJbEcRhyMjwFXsH3El3cQQH7m57yKIRxmCi4lFXx/SMkYxKc2xj1POxbxHvLnFg7DuuDMbmQos9B7N25Aq0eiXy32nsPWikpuqAtJJwgxD2SRg2aGpG6LIj5fTfvb3fNys36UHwDoPRlkh5lj6UE/vOIwUD0Y1X2FGSlQG9P7hnyllNCfN56Io7tlkaBN2LDTZHwSwP1NTalNhcI2WbrD91PIqrRVqIrYrH/nlvtHZ6h1BMwY4Xwtd5xcT0LLM17LvqDQ7gkZYZvtnAoRs942IDTcitg/A6QRFpkM+do1RBXeLcp58I870+H2sNup2SPLAZIQr2+DTxUfI0cUzfd6CcFEP2evxamFFiXL8SnwEkDbrQZK0aUXUD58ICcMUYz7Yl5uwyY6tYpJJ6wqBRic2QHg+poBwfjNUar72ycP8Xxr+rU2Lf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QikbtZmvqSsaaCdAN0hDsrGbQb5vpQarQXb0EVfDI70fPkKqS4jLdmp4nh?=
 =?iso-8859-1?Q?3qZKoDi18G7nWgysWj4xaITxe/S3l75hx9C7SC+aGwUvXwcBkc25s56I92?=
 =?iso-8859-1?Q?1KR6scuw9wdezaoBzXGPZJuNKYhI95GqVkhIq0+cwtch7knM/rHUlPwS6k?=
 =?iso-8859-1?Q?gvUJofnW+lxLgmZ5FL1GkCSY1yWNugfGtSc9fD1tG5r5TBcs+j72pdX4QR?=
 =?iso-8859-1?Q?BZfPBflrfdWM39ALmXieqz9BmqtJ26C9XDD1KlBUVwlP4f8CqkMQ9NOYSL?=
 =?iso-8859-1?Q?rv/mJ8sICeucnaoCu4NhvaL1YmXX2lQT5FFJYBSTpMxmcxFwUECxrX/TDX?=
 =?iso-8859-1?Q?X5TsuJnaZ/xum7j1LCTk8/QRJW/B4Bjo+BYVsykP7Vq84Yb0VKV7ilbOz5?=
 =?iso-8859-1?Q?T9nBa7TsPQPxkZ65xwbk2W5t5htk5iIFNRrUxmno8lrE4esiYZxaaa8f4R?=
 =?iso-8859-1?Q?DTHNs+1qfIegVELP5sOXKXlXeXoJOJR0/69972PFJgG0Vt7b/v13e4pAfO?=
 =?iso-8859-1?Q?G8PLiFrpKa8vLq4le7FDH/FASpt3dA2yeh6VCulmK+7FnjbKsbHnQJzqLs?=
 =?iso-8859-1?Q?A3utTE6KMFHVucS9q5nwwWFsDYtmlSK45WwK/jEImIDva4B8PqMujUk4fM?=
 =?iso-8859-1?Q?r98g1CM2KlSTOhb44iUtrDhANabDGxifqz1Jq271XzZf1zgeLO4DPwehZQ?=
 =?iso-8859-1?Q?bg2UCCyR4RIgxDgse9glgv2dtHAKqTVaing1khQC5E731K592iMmfyDk1q?=
 =?iso-8859-1?Q?dO/NG9eXfoM6c2W2HoQgQVhcK7zPwHgP0KiC2bpZs1kQKbAx9KV6c6CgB/?=
 =?iso-8859-1?Q?UYMGNT6ytvPSg7vxlC+WqCxpCSuF+I3hh6rDkahf0bdt0ELJKSkxs/aKI+?=
 =?iso-8859-1?Q?6ATI+9nkwwa1aCPOYsjtAaRUcV+lsP6cWZv/UOGRvkzJEEUOr9l//mAcfW?=
 =?iso-8859-1?Q?UyoVWLXf0f0cvt01rh67MTF13sqge2eYcighrLHzZ+l+Mh9B3miKkaQi7W?=
 =?iso-8859-1?Q?cdQQ95akZu1sJDquDRiNHZLfXoWZZNAZ+ol6kjHfEb1N6MHDCGtcvET87V?=
 =?iso-8859-1?Q?1hAjGxcSUKtTTi7EcvoY8VjAAWuQuwQVJ/Rfnz4NAwvkSwlMH3SE/S/DVu?=
 =?iso-8859-1?Q?E0Oaa/0dTcKAeb8EZ1lZkV76J0tOTdUU1s3vsmGnrDbQDNk3YsxgZzTFz8?=
 =?iso-8859-1?Q?Mj+oudcSxPs8Ah+EOH76c5aMugcEw/KrMUGQJOAkdcV0bLC3kwIxjbw/QR?=
 =?iso-8859-1?Q?jiQ8OifZ1v29q2BET07VgmGf4YEc808YaF/h/e/EjfBJ0LNtRw0sDIEtHv?=
 =?iso-8859-1?Q?r3QtTYAIH2k7RJEqO6HSzHqew4OWKbSkj7pScXGF13TWOtrYbpF8rRzHlH?=
 =?iso-8859-1?Q?pYZV53ADdMnDxaoganzIz8l+2jLAUOSu/iTJckK4FAnTnDqc7Mc6k7lzp+?=
 =?iso-8859-1?Q?6NMBz5t2OdBZ6mVGRmiwWOZlcBilLS30KFq+x1rYmShNu153heJl9UhGCJ?=
 =?iso-8859-1?Q?4MUh0WGfQmc+fZ0fZTpeT7J+ztQLddPS5s+2OWrej5pvaSuPH0aX7Llu4+?=
 =?iso-8859-1?Q?dd/o9jKiY7LbRNWWNd6Ig/lcpma/A8hzDxEfHndyZCMF+KuOiLWK/liWUF?=
 =?iso-8859-1?Q?LzkN/wrQOZGH30ph8Rl4SuntyrnWM0ExD5Rhmb2nu994qyatofhtYLMYE/?=
 =?iso-8859-1?Q?qFLsjBn+nD413cdoha/FGnfWpR5Ub60WM/8R72k2RE6q0zdift62K/8nH3?=
 =?iso-8859-1?Q?TKrCzNR2yxlamaAhv8C6XHchMlaUrcOAba597iO+qPlJTyeQDYT8x2mcOO?=
 =?iso-8859-1?Q?cKXRgAL24jH0B00ZbrCUgrcilkOOk/X94HcVCiCXI4cuSqL/La/w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a95769-663d-4174-8952-08dee2ad64f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:12:28.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6x95OXlD1LYaGhJgKgMhS32w3f98h/vLNcS7q2Ln8npjGug2OMtGxQktrqZzyCli8r157kelzHx+At5DD1mCSpw7z0KKq8WHgurCJD/K/PN8yiM0jZi3c9T7FhHbtf7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9792

On Wed, Jul 15, 2026 at 07:51:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Replacing `mux_state_select()` with `mux_state_try_select()` causes silent pin configuration failures during driver probe.
>
> Pre-existing issues:
> - [High] Concurrent radix tree insertions and data races due to missing lock in `mux_pinmux_dt_node_to_map`.
> --
>
> --- Patch [1]: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use mux_state_try_select() ---
> commit 8b69728953c0e1594fa409568136b389105c9d0b
> Author: Frank Li <Frank.Li@nxp.com>
> pinctrl: pinctrl-generic-mux: use mux_state_try_select()
>
> This commit updates the generic mux driver to use mux_state_try_select()
> instead of mux_state_select(). This prevents the consumer driver from
> blocking during probe when the mux state is already selected.
>
> > diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> > index da5a5ec015833..202b72351efb7 100644
> > --- a/drivers/pinctrl/pinctrl-generic-mux.c
> > +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> > @@ -93,7 +93,7 @@ static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >  	function = pinmux_generic_get_function(pctldev, func_selector);
> >  	func = function->data;
> >
> > -	ret = mux_state_select(func->mux_state);
> > +	ret = mux_state_try_select(func->mux_state);
>
> [Severity: High]
> Does returning -EBUSY here lead to silent pin configuration failures?
>
> When mux_pinmux_set_mux() returns -EBUSY on contention during a consumer's
> probe, the error propagates up to the pinctrl core in pinctrl_bind_pins().
>
> Because the device core intentionally ignores most errors from
> pinctrl_bind_pins() (only propagating -EPROBE_DEFER and -EINVAL), it
> swallows the -EBUSY error. As a result, the probe silently succeeds while
> the device's pins remain unconfigured.

It is wrong, consumer driver return failure.

fsl_lpspi 5a030000.spi: error -EBUSY: Error applying setting, reverse things back

Frank

>
> >  	if (ret)
> >  		return ret;
> >
>
> [Severity: High]
> This is a pre-existing issue, but is it safe to add functions to the radix
> tree without locking?
>
> When multiple consumer devices probe concurrently, their execution paths
> can run in parallel and invoke pinctrl_dt_to_map(), which calls
> mux_pinmux_dt_node_to_map() on the shared generic mux:
>
> drivers/pinctrl/pinctrl-generic-mux.c:mux_pinmux_dt_node_to_map() {
>     ...
> 	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
> 					  1, function);
>     ...
> }
>
> Because pinmux_generic_add_function() modifies pctldev->pin_function_tree
> and increments pctldev->num_functions without protection, concurrent
> insertions can structurally corrupt the radix tree.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715193546.2852108-1-Frank.Li@oss.nxp.com?part=1
