Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA836195F;
	Thu,  6 Aug 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033905; cv=fail; b=qMylpKBWvuQdHKFElfC2lSged8aHY1qXYW2CFklIOoupGmtKVnvbSZQtiMu3tb7bhbcwG2i9n3QfMDdOcORB5E2BYkntV2Y52eGsU9fBIxR3WoUAzw0gP2pibNR2d2bfS5vV5eYf6wY/IRLYyzv+lcHe/SKo8uoFfwWMOHs+qYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033905; c=relaxed/simple;
	bh=RmQU2Lgqs6+v/syIsjYLdpxoaDAxa0ahcbUpyYnHwj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XTBoPHpR64jYKINm4nvY5Run181RSqXS5SFqWsxuElF+8YV1xjQnRwirpZfdCjIjGdacpx86WeCoAwzVTTXDPZyPqTov2FT+uf8u+Ci1QOZ/NwrEgfjXux4lnQ43esDAyj72TgDTyeY94FzsZjC0dlYy0sLxqXrsUA2JBIIN0aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tpM1s2lg reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tpM1s2lg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMjYFs5i7Qfn/nvbTDUNUImkdwA6DhoX5imKVbttG7HWU0S7dyzKiaS2Lzp71o7M9/SnxS3AUJ/1LDXpIRVTIq3D8W0hOG+rgkwsKk7XVTRF+GAAUS0jzCiONUL4pvY8TKfpFIObgNhJQpEP5B6PB4nO7JsKWhVvJuSeh8B1PwddVOonSDNLU1AHR806I9vy1GIf/DtPyECFSNDtCuOcd27IZy1MiAGiYyjerXDCPALvXeoqYqbgQKknbSIeLWFIyBaQU7cmkkyLa2zsx7a6Fmub4Se44PBgFNm9rrdktbhNyNVgFaEYsuNapfMq8tdBWs58UuFdHrZOqjgsxq36LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htS2cDh2I5X4vxfoJNYcBY8vdB/uDofkhHL8chNaTOE=;
 b=NOHDGkU4clHZHDup1EnWHFJKP0RnC8NoVQAg4Jn7Nm6xQCP4Vaua1zMcShwHIhVq+elZz9DF/Thg0Vfuh2mQwSouteFSVlY+Wvoj28pT87Yr/tuuWZaJ7EOSzJ2oG6RNbyeRbBxQblq/3NdV25/UqAl+9B+HGI4JjY8gN+RAHD0fezs/W+1DV8huCAw9zfX9zsndoM4f6kTd/pTqJKC97ygyvYjCK9aM9534ZnR+mqBRzC0gKfy9NKcvOXPIqR24FMmtSZM8Fc1xFt3lkWwYJX2iPMINBLZlFcABN6MmmgDDmRgJmUK7TPSEIHnfkiFbiZsi31gp6Yg76Fd1TbQaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htS2cDh2I5X4vxfoJNYcBY8vdB/uDofkhHL8chNaTOE=;
 b=tpM1s2lg9Bio5U4v0FNUVLlYeltVFkYnkUtEo/JoqU61qPfptMI41kXtHbAVXvUyASnGbD8Y/ZYewW36N96nFRo1fhUMTENu+3z46o41wP7Luq8yp5LViQQGV183rHveeNkTj/y98G0m37/9KH+h/vQbhGgSf9+iRM3i97sqPF0ctThWKpm4pd1U71oSpz+Dec/lkvAXGXJPBs2f0HxzC5A6KFDA2NcwBONFqbP06DjJpAoI6va7IzFJ29xwMAQmHL+awHlLX8J/o9MwkPXV84urOvbozmBYzrVgxyt8yQ6zBNbvb1q91q+DJ8z9x/XkGIUwuT0HYq5oS9Y7gLcphw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9877.eurprd04.prod.outlook.com (2603:10a6:150:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 16:31:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 16:31:36 +0000
Date: Thu, 6 Aug 2026 11:31:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, Frank.Li@kernel.org, imx@lists.linux.dev,
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v35 5/7] firmware: imx: adds miscdev
Message-ID: <anS24Uf5jI7auJxS@SMW015318>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-5-11b25bb308ef@nxp.com>
 <20260806112724.89B351F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806112724.89B351F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:21::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d5d3d7-af30-4e39-16c3-08def3d82f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|4143699003|11063799006|56012099006|3023799007|10067099003|6133799003|13003099007|7136999003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YcJaOHBTaqTQ544QDD77dCDI5ztezIxAdeNl1sFRZW1sEpEdhq6FKHly4Cpd1XAGP83ahDTOh/ApbDwhMgi0AzppEJ9tcIK9a5KjtJY8G2p1TAkyc7RFfO7GY4gMo2kwxBUzmb6lFKB6q/bpDcHKuGjEhxpxF3EvXw6C6sSAQx5VotXEroke583r8H/XanvNqcdLARDRmDACjAMtJr7MRj7DQcd476iYKcUaoDGuftEu/Yea6FYaMNqLNpHNjW0Uok3UuYstq+HDETqkmTXEwyX1oqDoDoRlL23DzLZjsWp8jDTt2mSx6J7OOR1ByCNbCwRWk0r5pA436nudSzbiYsprPJ1cgn/gkJaO7JEcm3gxreis6jZNHvko2N0QpfJeh9moQuys1khVSzYhsAV8jIb6sbA58jKx0Zhg+y3wancN9jORwjzuW6mg3TsN7gqh3a9lBULWYJGiewawKIYtqhVds77HWJ78Lg/4fw1hD1EJVEebBAwtPG4X/zbMYzpMFS0k/1dASygs1Hs/ybosCuAOgzeRBuip4R3hDej5hfXEBjhXos8WKTHP1srmfD/WX2KUJP0i5LyNaFMrAEvmmMWguelKlnQ5dVhuqPchyfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003)(13003099007)(7136999003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TNpxBsISFEHza9iVRRGGJIYtGtrrG7jFhn1nwOkN2G7TTlUIhYUUMKqVCk?=
 =?iso-8859-1?Q?ursfDn8rzOCOdD63InYYJmNErZgcwyTxshqF+9tmDl3MQ6P6HR2BxHYtqz?=
 =?iso-8859-1?Q?V+IQkUf442DIjZrFoSFE++Yx+S1Nwt4cia088HZBTgkNZAPqdVjKBJ/vsO?=
 =?iso-8859-1?Q?p3VpiY/FQ0wZUUcMj6hJ/XPWCqICgBaNX+AQGK5/xoB3lGYUsae/DcdiLs?=
 =?iso-8859-1?Q?SwGVRyAEJZlIwq25Hp/hVSPQW1G6u1Zq2/9Kb8u2dZK55cFLn7VBmlGF8n?=
 =?iso-8859-1?Q?1HW9lP8dEOo9DM04SXah7/iXNtz2End6z1PgjgJOW6v7Hz4iZuj0J8KOBy?=
 =?iso-8859-1?Q?+4vANxni+2IBPtZ+0XBWnecw5vc6eQXYb5I/X//q3CkzlbIFnGkzFwi0dG?=
 =?iso-8859-1?Q?PlnkyzdZPwlne7Ra6TYWHnskR1vYcGOzV74HfIpM/X0NpgVVOFI5PCiS7p?=
 =?iso-8859-1?Q?imkihdf8fvVafmQCwmi/R9plgjl/FQI3oKrf6OdcsK8XypaldTTPgiB39S?=
 =?iso-8859-1?Q?lDQ5sC9ooj+Ch7yJ+8RQ2jQ8Byst/VH/+DJfN5Ri5fQ1QFCWKaOvnAGl4I?=
 =?iso-8859-1?Q?7d+2VPeca2h19tkuFDliGfgphjq3tWy0+MqgAglAm7ufpVy4tBoE+Vc44R?=
 =?iso-8859-1?Q?rJ73j3P4VpUlwFsl9g5eZ3pNcgGHaqkrHM8JzXvqaxuu/yVurYUIz/wULp?=
 =?iso-8859-1?Q?19N69cHmoETf5bKzZj/hKK451CoLVAIJn6LrhYfYefutObjA9+jJa0uruq?=
 =?iso-8859-1?Q?Sb4X2COJy5CySo3ARAnm8yyNNnVA/A5jfIzSq1Z9k9u1jQPFFli8LjctD+?=
 =?iso-8859-1?Q?y2EuOAw3nshXnoVw5OSxXFDAbz4hOMQeMhkAAxVR5MnjlUm1tbu2TwAz2E?=
 =?iso-8859-1?Q?QY57o6XXgXnXt8ItznBhPwxxWqAoxx+gjUSF+S1k5zkbq7WBH2U/Cv0HVc?=
 =?iso-8859-1?Q?9ciYI/JbCw7945NEm4lpGeiNEGg+1DdDj1Y3P+VbNCG2fz5F7GZCkU+hyt?=
 =?iso-8859-1?Q?j9KnAvhcNhFGLlAeKOrNKFFhT3vVOnZSRoYfIeXSrN4gQRQR3c1BR1m06m?=
 =?iso-8859-1?Q?excRpTeSy1ig1j0RoHxpoPY7t5SWUqlyECVMt8M3aKs4fnlzKzWQUuGuzv?=
 =?iso-8859-1?Q?US2qIYURpH/f1Y5fwva3yLAGPB8Y2ftz41EeE1BbLYulPe+cyjcUjF9y9p?=
 =?iso-8859-1?Q?UkOfD3VMJepHj/DEetpP6Z8I8W8W5fnDiVXqKUro3X8h9kehr6UQofcmBP?=
 =?iso-8859-1?Q?T6pKZAQElE6jq0L3akICEiuk5xKvt7YH+rJKY1rHAb4221tlo1zJfuDzDX?=
 =?iso-8859-1?Q?518jGObfQUGyv+VA0gA31RttPyW1lGLdzRo8NzVPrVFbrS0YMs9D6Vf0if?=
 =?iso-8859-1?Q?eetLdNk52mHG0zGBgHholY4jhl+Mao0uI0gOpaj5Og8gg8z5DgoYlDapxw?=
 =?iso-8859-1?Q?X42AXbWKkKYld97DTJFiQ981hFmVZi4MslFIRb0XEZCZuk6iGIdK8gsLGJ?=
 =?iso-8859-1?Q?RMxhYRj+hpEOA9qpfNySgK9UWjDQ7pUxYKhv6kFYwWSSSi/E7E4Pyj5egT?=
 =?iso-8859-1?Q?kbE9AQRFrwuFaTnC3YczLApPpEnKMEMUGVoMNnbKhA67ZLcjB7jL4Rxeq/?=
 =?iso-8859-1?Q?nefIitipIewez2IrXWjtNM/l+DHpFk11ViqJiMYjkos4S1SD8QcziB4dDz?=
 =?iso-8859-1?Q?gzJZYFCSEMI9Ko59d90xlWv1zXtstsn0n8HqQ8C/30+cf9lfD2pM2EDyKK?=
 =?iso-8859-1?Q?+WgrFqxyzmCulYDtueE6+A+iHWfoOHsqeNX8S41KnHn2kArCJZFERTXEI1?=
 =?iso-8859-1?Q?EVYIzftG3u3gXjX57v8BFXHnHBufXr0Ow6mErdMYznjYG06eGL62?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d5d3d7-af30-4e39-16c3-08def3d82f0d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:31:36.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DtHgIqQywPuQ7OTH6ap9BGVCYGnIdELpFzyhz6/8t3BI5hfDdXxo/Si7885oig6rj8KPt3sQA28JBBlX9U6rWAPfL0dT8oYoPIh1kX1UkpvS/W9CkHrc7/zb+isMOqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9877

On Thu, Aug 06, 2026 at 11:27:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] The driver allows userspace to embed arbitrary DMA addresses in permitted firmware commands, enabling arbitrary physical memory overwrite.
> - [High] The `se_if_open_gate` structure can be accessed after it is freed if an `open()` system call races with driver unbind.
> - [High] A concurrent `close()` racing with driver unbind causes a Use-After-Free on the mailbox channel `priv->tx_chan` due to premature unlinking.
> - [High] Firmware session and storage handles can be permanently leaked if response validation or userspace memory copies fail, bypassing the tracking of allocated handles.
> - [High] Signal interruption converts an interruptible wait into an unkillable uninterruptible wait for up to 5000 seconds.
> --
>
> --- Patch [5]: [PATCH v35 5/7] firmware: imx: adds miscdev ---
> commit a678d58783e842f1a853a0ba674864702cf30910
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> Subject: firmware: imx: adds miscdev
>
> This commit adds a character driver to communicate with the NXP secure
> enclave hardware. It provides an ioctl interface for userspace applications
> to send commands, manage shared memory, and restricts invalid or disallowed
> firmware commands.
>
> Closes: https://sashiko.dev/#/patchset/20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com?part=5
>
> > diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> > --- a/drivers/firmware/imx/ele_base_msg.c
> > +++ b/drivers/firmware/imx/ele_base_msg.c
> > @@ -15,13 +15,57 @@
> >
> >  #define FW_DBG_DUMP_FIXED_STR		"ELE"
> >
> > +int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
> > +			      struct se_msg_hdr *header)
> > +{
> > +	switch (header->command) {
> > +	case ELE_PING_REQ: return 0;
> > +	case ELE_DEBUG_DUMP_REQ: return 0;
> > +	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
> > +	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
> > +	case ELE_OEM_REL_CONTAINER_REQ: return 0;
> > +	case ELE_FW_LIFE_CYCLE_REQ: return 0;
> > +	case ELE_READ_FUSE_REQ: return 0;
> > +	case ELE_GET_FW_VERS_REQ: return 0;
> > +	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
> > +	case ELE_GET_EVENT_REQ: return 0;
> > +	case ELE_COMMIT_REQ: return 0;
> > +	case ELE_GEN_KEY_BLOB_REQ: return 0;
> > +	case ELE_GET_FW_STATUS_REQ: return 0;
> > +	case ELE_XIP_DECRYPT_REQ: return 0;
> > +	case ELE_WRITE_FUSE: return 0;
> > +	case ELE_GET_INFO_REQ: return 0;
> > +	case ELE_DEV_ATTEST_REQ: return 0;
> > +	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
> > +	case ELE_READ_SHADOW_FUSE_REQ: return 0;
> > +	default:
> > +		return -EACCES;
> > +	}
> > +}
>
> [Severity: Critical]
> Does this allowlist permit userspace to embed arbitrary DMA addresses without
> kernel validation?
>
> Commands like ELE_GET_INFO_REQ accept physical DMA addresses directly in
> their payloads. Because se_chk_tx_msg_hdr() only validates the command header
> against this list and performs no payload sanitization, could an unprivileged
> user embed arbitrary physical addresses (e.g., kernel text) leading to the
> hardware enclave overwriting arbitrary memory?

This one may security hole, you need check payload to make sure DMA
address is in ranges.

>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> > @@ -71,7 +122,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
> > +		if (ret == -ERESTARTSYS) {
> > +			/*
> > +			 * Record that a signal was observed, then continue waiting non-
> > +			 * interruptibly until the response arrives or the timeout
> > +			 * expires. The caller can surface the interruption to userspace
> > +			 * after the protocol transaction is brought back to a
> > +			 * synchronized state.
> > +			 */
> > +			if (is_rsp_wait_with_timeout &&
> > +			    READ_ONCE(se_clbk_hdl->rx_msg)) {
> > +				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
> > +				wait_uninterruptible = true;
> > +				continue;
> > +			}
> > +			break;
> > +		}
>
> [Severity: High]
> Can this loop trap a process in an unkillable state for a very long time?
>
> If a process is interrupted by a signal while waiting in ele_msg_rcv(), the
> code converts the interruptible wait into an uninterruptible one by setting
> wait_uninterruptible = true. Given that SE_RCV_MSG_LONG_TIMEOUT_MS is 5000
> seconds, this could leave the task unkillable for over an hour, potentially
> triggering the kernel's hung task watchdog.


This one need double check.

Other high problem need your judgement.

Frank

>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> [ ... ]
> > +static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> > +{
> > +	struct se_if_priv *priv = dev_ctx->priv;
> > +
> > +	if (is_fclose) {
> > +		scoped_guard(mutex, &priv->modify_lock)
> > +			dlink_dev_ctx(dev_ctx);
> > +	}
> > +
> > +	cleanup_dev_ctx(dev_ctx, is_fclose);
> > +}
>
> [Severity: High]
> Does unlinking dev_ctx before executing cleanup_dev_ctx() open a race
> condition during driver unbind?
>
> In se_if_probe_cleanup(), the unbind thread iterates over priv->dev_ctx_list
> to gracefully close contexts. By unlinking the context here before the
> cleanup completes, the unbind thread won't see it, won't block on fops_lock,
> and might call mbox_free_channel(priv->tx_chan) prematurely. This could cause
> the concurrent close thread to send on a freed channel in ele_msg_send().
>
> [ ... ]
> > +	rsp_status_err =
> > +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> > +					cmd_snd_rcv_rsp_info.rx_buf_sz,
> > +					tx_msg->header.ver == priv->if_defs->base_api_ver);
> > +
> > +	if (!rsp_status_err) {
> > +		err = se_dev_ctx_cpy_out_data(dev_ctx);
> > +		if (err < 0) {
> > +			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	/* Copy data from the buffer */
> > +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
> > +			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
> > +
> > +	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf), rx_msg,
> > +			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
> > +		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
> > +		err = -EFAULT;
> > +	}
> > +
> > +	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> > +
> > +	if (cleanup_err && !err)
> > +		err = cleanup_err;
> > +
> > +	if (!err && !rsp_status_err)
> > +		fw_api_specific_ops(dev_ctx, rx_msg);
>
> [Severity: High]
> Could this error handling sequence leak firmware session or storage handles?
>
> If the firmware successfully executes an ELE_SESSION_OPEN_REQ, it allocates a
> handle. However, if a user submits an intentionally truncated rx_buf_sz
> (causing se_val_rsp_hdr_n_status() to fail) or a bad user pointer (causing
> copy_to_user() to fail), the function skips calling fw_api_specific_ops().
> This leaves the handle untracked by the kernel, preventing cleanup and
> leaking hardware resources.
>
> [ ... ]
> > +/* Open a character device. */
> > +static int se_if_fops_open(struct inode *nd, struct file *fp)
> > +{
> > +	struct miscdevice *miscdev = fp->private_data;
> > +	struct se_if_open_gate *gate;
> > +	struct se_if_device_ctx *misc_dev_ctx;
> > +	struct se_if_device_ctx *dev_ctx;
> > +	struct se_if_priv *priv;
> > +	int err = 0;
> > +
> > +	gate = container_of(miscdev, struct se_if_open_gate, miscdev);
> > +
> > +	if (!se_if_open_gate_get(gate))
> > +		return -ENODEV;
>
> [Severity: High]
> Is there a use-after-free risk if open() races with driver unbind?
>
> When the module unbinds, se_if_probe_cleanup() calls misc_deregister(),
> which does not fully synchronize with active open() calls. If the unbind
> thread drops the final reference to priv in se_if_priv_release(),
> se_if_open_gate_put() frees the gate object. A concurrent se_if_fops_open()
> might then attempt to access the refcount of this already freed gate pointer.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com?part=5
