Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CC478865;
	Thu,  6 Aug 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032499; cv=fail; b=bXrD6bP8o+UpH9Q19N02HzNo4VhprQ3utB5T5zgR34HMdcHH4sYcBPCOFHW3bpufzlPcM4VP3qsE1ViOR0MG46vP8/CeYPxK93lL6nkaGgd0iHmuEljqGN3PyVxwjR/tT8ySO3e7KX6GGZ6/3gE1/kuCy71jD8pUb6szohL9SIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032499; c=relaxed/simple;
	bh=gHZtJaPfbx7kwCbx5WBe61mR5FU65oB9IOAZyF5GTdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FIYWzRdd0R3fWIGguLCbMcy1Jb12sn4LlbniWCptta9wP7/+JMRq86bn8mbfDLJz7braI9ri0rbAgq3DwdgpXoh7aPDzxJymyU/NWyYhst4TzIte3LFlRyC4o+r07XC/u0/qoqZNu7gusTz8B+YNcvsDqWDo5mn+QO9dwf/9ntg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OHYspa1f reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OHYspa1f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPpl1P5/pqowz54HBsEyeR5Jif6hofADaYmf135XT7sMPU9HDYfwli3VnX7NME547dydHGgKRoTg2zvHHZJr9pE5XSzQj1stRYfGcH+esiNquSnpOjNCFzmekklVvcZL7TGgHw6yPOAYrhXyu/mreskUa5NEgORTPjUP8q2iEJBIPu4B5e49vAO5rcOjU9QH3C0nDWvpMXOZ+7vmxW2EFHWi9H+W0l+pqyOr+NmcB/ioeopRD3AoK6r1SUIpfWBK2TeOE4Q83BqgzG3ayscBX2MDMC1RRMKKhu4aqN8zQydn68XWVJ+AOLJ7y+9tm6+SxCz0JwJb3h4O0+ezzE0HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+dZ6FFnp5BWziFpM6x84pHwMPVY9mXeh5pu546du+g=;
 b=rqvcVUUV0Cy/zfUN9SZIfE12Y/lhoEfnuJHZVzR2CdvKGxlHy1bC1Vr7icrZhieCYkogm/TYB/icLEB1Ae9QVCtU6Sd2plpX8R2FdWVNhl5GR35bboI50vQGOS3XhsRKkR2kHrAahT4FAev0ARbhQC2eaMtFzQiPf/09THD8fvdlHeUtgx8dE8BhEyqNJH7alJHVNVdeSl7PwPqXEf0z7Nk+hPvqkSYQ2Hez1cWIJKW+yF46bwUGNH8XpBIJ5URXqq1XSNeE3dsLJmeKyfPPxmD2xVvUWcOzjLtzZkR95ldbznxY0Zh4M4lu9k8lVC6QcmITvzhTR+CBIW5w4A5cSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+dZ6FFnp5BWziFpM6x84pHwMPVY9mXeh5pu546du+g=;
 b=OHYspa1fKh3qk+0TtahmYnggdXKyR3Maxjv33tGjT3XTSJ35cNXPJlnmZ7x3bdIy1TfSL+QpgO9kInOYDHVCSp3i/SgQ13P9sr4I47CUbd4J0q8IZexYczfYego9J5FyTb3+odMQ7IrXUTrMN3dLn/h2c+gZjB/L1/E7DpgkEteTAaiSR3TJzPm3BfouAXqqLVgxTmw0RN7qKjgnvtCKlSzo9J/4niZYPY9p1XKssY5GQwGi31e5/fU/vACRu6c63s+E4LPOROvKNlNUw0HIa6R5AfTTS5m+6z65WdRcTJ9sYrHfT1qAePrcec+la9PTXuRpUgklHdRrDaKOJ5uVMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8148.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 16:08:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 16:08:14 +0000
Date: Thu, 6 Aug 2026 11:08:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, Frank.Li@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v35 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <anSxZxLFoybigjZ8@SMW015318>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-3-11b25bb308ef@nxp.com>
 <20260806111724.61CEE1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806111724.61CEE1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 97591e16-7ed0-4b41-da8b-08def3d4eb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|376014|5023799004|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|22082099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	KWGkxyoxHdVBmJEVGdjfXRCEAJ/2hx0hZWMLny3QW+dy7Si6WDhzUy3ME9v19Bth0mcMWYEq6jNnkPwICswlEdR10NkiG/BrD3AKSKlDbOdeY9g9B1IvWLEc8sWth3H6jgvXxKABPp6aURV5a/D53W9cpyOnDA7AnfE55nMnU33p0R8sqA7dovQi4y7HhBCeL3wiYBPDzzpiTiytbeEArx/RevqUNqFFC44KX1TF08zEp7B1EbjxK69LiORehVXVW5zw4SelJf9gAI4818whJa/rXrThjezu2oY6VZ1CIUwqZ7dq4dk90GsAtgWiyFtO16BrmK7hYV1PsKwLEWx3vQCj/pCuRdhgrG0Z4fWE5xsDmW6RGlHcpUaRV16h+/KTL2019oaghK79HV4eb8Ep26Y0gEeTIf3/A1RBG5IuVvfwPga00LakOAg1BKroAr3F4EBbhITdapZod4eaVnV5HpK0tS4PLSKILQK6AsDluI2DFoTHVY7rNOXMzyo2jh1/3zRTeKDcbCjghCdHmkTmk1db8Ml+EQVn/xwYAIzy1GVjcHuS4MXHo6Eaa5j1gOvY9AeSlcYwaD7OlMuYi2lX5Wo5gTdwfpAzmG7ESgiQ7R4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(376014)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FJ5DrSMyJwKKPGOjMRZUEdFk3io0aPZnmu/ebLLpCIpHbpHqV2vnyxGNjE?=
 =?iso-8859-1?Q?l5AGRxDuPhAm180dExEy8a3/ZMKAsBCOuIIqVv4oi6docTvZLVIgsm5OXN?=
 =?iso-8859-1?Q?QFiRo0PEzTURtMD5c2Yuay9IfIjUDw0aFM1M7RSSBZAmy2/EtrxJQljmoO?=
 =?iso-8859-1?Q?zZoqQWAP05e0/PW5Agi5Gt8T9pzrOviizIZK1Fe/HilStOU32uhzXNDmpJ?=
 =?iso-8859-1?Q?zUtwgA65pKE7peOb3WEYAtqc5gELp52hGgJbAHAVZS1E1bK51Fes/V0tAj?=
 =?iso-8859-1?Q?oYmKQoLtp7NmsQGHdxQrteTGd6605uAsjgVG9gjVs04fKNuP2/0xZiNc/6?=
 =?iso-8859-1?Q?AtuCqjGBq+7bLnpR411617TqJ7ZgHN428V8GnKtpUB5Rjjp2HJthynlFMd?=
 =?iso-8859-1?Q?EPvYViMKrw5kzVrtPnBBI9z97KlyH5xh9h4qputn3OBnmUmsRUvsEtn802?=
 =?iso-8859-1?Q?dd6MWs6aLnSshFaj2U3ucRT3WT9Gu7u2UhjpyD3qxOhUUwHm90r6FdDj2w?=
 =?iso-8859-1?Q?v9dWl6XD1JvbwAb9CpBtW6WS4WS5UkJ4BQ3+tSoRAxYrtjeys36a8P5TnA?=
 =?iso-8859-1?Q?gM9QSWgy2MkwCisHxYEVFhiv9W3xpimUKE+ajSecTks2Rh9fS0CP5uWh93?=
 =?iso-8859-1?Q?AvPrTZuviXtGXfUT/r2Gf1YEjqviEr4gJ4KcQlrH+8IfRAMXI5O0rg56k3?=
 =?iso-8859-1?Q?WGD5LqCDwNAlKp+4IVvYWz6Nefm2izb9z/VrATsvX9GsoCZBciROcC6Pbw?=
 =?iso-8859-1?Q?woHzRp24SdFeEY+mRkTtUdsGh/CM6nE06v/P2XoB9bOHw18Et7d+2rjmaD?=
 =?iso-8859-1?Q?MjmqywW3QIpVBu7wKyrPuZgxSEPl2PPsKQCsDK9JF41yndvFlyLLR4mUqi?=
 =?iso-8859-1?Q?6v2LwbGn/1yQPpGJnB20nRBs1PQW4AH3kQ5ASZEOWUMoYLRKTNPLeF3Mil?=
 =?iso-8859-1?Q?ZmNcnneIwyz7x8PC0zE2vyXFP5QUiJ5iTmRturOi4oL0s73kt/mxmJiEis?=
 =?iso-8859-1?Q?wGq8GW5mi+EijxXkIle89U3zNxcAI/UfFREi+OrTPYEOgixw660iyHIQDk?=
 =?iso-8859-1?Q?UBMpDY/NDLGDV/nsbCodq+TH/KdVCtHxQgM08QNxerlNp11Rp2xfYgE59R?=
 =?iso-8859-1?Q?bMrelBmvoa44xQeEiqArBAaIuhcDxsECvmaHpH3ikTtXV8aY8091g4w4LS?=
 =?iso-8859-1?Q?013FgG7BG43JRBqSL8EVaV2vgfKZMeoBRmOAi0pGO8R5sTU3wXjBa3b5b/?=
 =?iso-8859-1?Q?XT12OxcTEdQwY3789vFC/7+6haB1wmGbC0wN9MudVRd3eEhbza3wyHSVXF?=
 =?iso-8859-1?Q?Gqi0RO/ViZXATvfB2S98pvQQ0cYImqMbhI4vJH3lyJQ0SLQXDT+2cOE2E+?=
 =?iso-8859-1?Q?2wLnd3YqQI5dLU37V7hTEqZCl5L2CzGh6nCQtBxsbvKl7ekK4vWnTHsllj?=
 =?iso-8859-1?Q?cvmwkBWdczWHxequw1bnysnZxfTXLssknldipPOp8Snb9NzZv8TsKwQcVK?=
 =?iso-8859-1?Q?7Xx/0vBsRbdHLhZlOMooYew9G1frzABi5c7fx57OW3vV2YPzaCWpkJkPcK?=
 =?iso-8859-1?Q?9G3yZQMZOclCpiU0oD/UxBtcQ2FkD8j2bawd1gVFo/KFvQXb2JQmzZqtUo?=
 =?iso-8859-1?Q?tOiswbnks+yntvnYjwOeV0vMzCuBL97z/pzdc7BeEAd0oOmkeekM+41RYX?=
 =?iso-8859-1?Q?4NBgmUKRKTcS2p6wlXIoaegXYe+Ex3xAIV2a8FLNlSzzp/hpiauZBBIQn6?=
 =?iso-8859-1?Q?7RWweQx+bflhLKYS/a2OpbrqC4Ba4aD82DXOh0GgWzM1TLD19t53bZM549?=
 =?iso-8859-1?Q?IdLfGjNLOqA1rJS0LuavCHcg6LzBfbEyvLA4QLUV/lPD9P0tO/H3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97591e16-7ed0-4b41-da8b-08def3d4eb88
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:08:14.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWVo5oIn+IEvn1TAVLSSb7gqwIxEBaFSlQwEiU/HrY4TB/wUhyPVyS+o4WALZvfTKSxVsurKuQBLRlr8THsYMaY9zXs8Gtl2c7ZnOxskwXCsjjrhfUgITNDkgA5sBT4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8148

On Thu, Aug 06, 2026 at 11:17:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] The DMA buffer used for get_info is freed prematurely upon a timeout, allowing the enclave firmware to corrupt memory when it completes the transaction.
> - [High] Allocating memory with GFP_KERNEL during the PM suspend/resume phases can cause system deadlocks.
> - [Medium] A successfully completed firmware command is incorrectly reported as interrupted (-ERESTARTSYS), introducing a replay vulnerability.
> - [Medium] se_restore_imem_state() ignores validation failure and returns success even if the IMEM state is bad.
> - [Medium] Multi-byte fields in struct dev_info are populated via DMA by little-endian hardware but are accessed as native integers by the driver.
> --
>
> --- Patch [3]: [PATCH v35 3/7] firmware: imx: add driver for NXP EdgeLock Enclave ---
> commit 357109d983ad738d0dc813242f9d555c6b2d561c
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> firmware: imx: add driver for NXP EdgeLock Enclave
>
> This commit adds the MU-based communication interface for the NXP EdgeLock
> secure enclave, enabling messaging between the Linux kernel and the enclave
> firmware on i.MX SoC platforms.
>
> Link: https://sashiko.dev/#/patchset/20260121-imx-se-if-v32-0-c5222df51cc2@nxp.com?part=3
>
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_base_msg.c
> [ ... ]
> > +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
> > +				 size_t size)
> > +{
> > +	if (priv->mem_pool)
> > +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> > +	else
> > +		dma_free_coherent(priv->dev, size, buf, d_addr);
> > +}
>
> [Severity: High]
> If the ele_msg_send_rcv() transaction times out, the hardware might still
> process the command and DMA the response payload later. Since this cleanup
> function unconditionally frees the DMA buffer back to the pool or system,
> could a delayed hardware response silently corrupt whatever kernel data is
> subsequently allocated at this physical address?
>
> [ ... ]
> > +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> > +{
> > +	dma_addr_t get_info_addr = 0;
> > +	void *get_info_data = NULL;
> > +	u32 get_info_len;
> > +	int ret = 0;
> > +
> > +	if (!priv)
> > +		return -EINVAL;
> > +
> > +	memset(s_info, 0x0, sizeof(*s_info));
> > +
> > +	struct se_api_msg *tx_msg __free(kfree) =
> > +		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
>
> [Severity: High]
> Can this allocation cause a deadlock during system suspend?
>
> During system suspend, se_suspend() calls se_save_imem_state(), which invokes
> ele_get_info(). Using GFP_KERNEL here and for the DMA buffer below can trigger
> direct memory reclaim. If the reclaim process waits on I/O or swapping while
> underlying storage devices are already suspended, will the system hang?
>
> [ ... ]
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_base_msg.h
> [ ... ]
> > +struct dev_info {
> > +	u8  cmd;
> > +	u8  ver;
> > +	u16 length;
> > +	u16 soc_id;
> > +	u16 soc_rev;
> > +	u16 lmda_val;
> > +	u8  ssm_state;
> > +	u8  dev_atts_api_ver;
> > +	u8  uid[MAX_UID_SIZE];
> > +	u8  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
> > +	u8  sha_fw[DEV_GETINFO_FW_SHA_SZ];
> > +};
>
> [Severity: Medium]
> Since these multi-byte fields are populated directly via DMA from the NXP
> enclave firmware (which uses little-endian format), will they be read
> incorrectly on big-endian architectures?
>
> For instance, get_se_soc_info() directly accesses s_info->d_info.soc_rev
> without any byte-swapping, which might yield an invalid version number on
> big-endian systems. Should these be defined as __le16 instead?
>
> [ ... ]
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> > +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> > +		     void *rx_msg, int exp_rx_msg_sz)
> > +{
> [ ... ]
> > +	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> > +
> > +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> > +		/*
> > +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> > +		 * On success report -ERESTARTSYS for the interrupted wait; the
> > +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> > +		 */
> > +		if (err > 0)
> > +			err = -ERESTARTSYS;
>
> [Severity: Medium]
> Does this unintentionally convert a successful firmware transaction into an
> error?
>
> When a wait is interrupted by a signal, ele_msg_rcv() continues waiting
> uninterruptibly. When the firmware finally responds successfully, err will
> be positive. By overwriting this success with -ERESTARTSYS, won't this
> cause the kernel to silently replay the syscall from userspace? For
> non-idempotent operations, executing the command twice could corrupt enclave
> state.
>
> [ ... ]
> > +int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> > +{
> [ ... ]
> > +	/*
> > +	 * After importing IMEM, check if IMEM state is equal to 0xCA
> > +	 * to ensure IMEM is fully loaded and
> > +	 * ELE functionality can be used.
> > +	 */
> > +	ret = ele_get_info(priv, &s_info);
> > +	if (ret) {
> > +		dev_err(priv->dev, "Failed to get info from ELE.");
> > +		return ret;
> > +	}
> > +	imem->state = s_info.d_addn_info.imem_state;
> > +
> > +	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK)
> > +		dev_dbg(priv->dev, "Successfully restored IMEM.");
> > +	else
> > +		dev_err(priv->dev, "Failed to restore IMEM.");
> > +
> > +	return ret;
> > +}
>
> [Severity: Medium]
> If the IMEM state is bad (not ELE_IMEM_STATE_OK), the code logs an error
> but still returns the success code (ret = 0) from the preceding ele_get_info()
> call. Does this hide the hardware failure from the power management subsystem
> and leave the enclave in a non-functional state after a system resume?

This one make sense, should return failure.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com?part=3
