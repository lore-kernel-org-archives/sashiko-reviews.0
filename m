Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403A38332E
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936103; cv=fail; b=oKWAwducqgYPWJYtOUxGCCHtkhSUlmOYTt9nj+toRVB+jKcOV4qjTBVM46qSeoPhpuHsjlniaHOwhKH7a1vv4hUpH+AGo6kAXKvOpY8b2pLsu00z6Ehhl4WBBiibS5RSXhA0y83HXEdMAna2mF5hjG/fNGpVJzcTyzLdcugS1JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936103; c=relaxed/simple;
	bh=ST7irYiLCHBGJm/KVl2mnx5JAv9hql4bgdhsIVYaW5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H57qVQt+2LnZ7kVkFkbmik0YlCfyVy9HArXxNZdGFuv+ZaeMkWQzJAbEv/hl4VPVAF2O6aNMnR3vRCIoFyNq3MPMS/igK2ZiD9dmGuV3XobzbObs0so9SIOzoImbL7wkUnVOl82J0CGCT7qdjP46PKPqzZX+gqVI+OIw52akbso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mbLGQJKo reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mbLGQJKo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yO2VB94CqZA6sVMvq2iQjo762MduqVkordI2U47SkbeHbnZUcGuAIIW+PTjD645nqE+lK5XMlZh+VXux+zExjeT9irLJxInazhrfoDYKTyvKf521M0jpXVKP24XsD31uTgv4WydZNxaRp1IEdOezYyJKEdKMghkFdyyVJX5WeUKpu2Dirg3AIM7xK+6cqS9xoyvoHCv/QG2m7Tx8Ea/ZXKyHjgMXdBbmYvSZtRHF3MSzLwrL1k+A/Uif7oTZdNVT5X80zfMwxOqKRY8vo56tyEdWHYKJU+TbiGPEtsMn43c4jTY93HkOs4wQDs/bGeGXoaHYieM/W2XZVlrprQOAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiug1I3j7v/B1a8wBqlHkvXtECkfV3ZX28AwReSwKT8=;
 b=SLzYu7MISCoCjkv8hr5z9o/Q3UP8pvrw+MBEb4qeqlLMTsOcr5xThw1APu7jdN0fyiuxIsS2fw2wY8lr/ARSahJ6Mai+ldLlVeMPdYYT0+bwLw8kpJUEWinvs9W9Ee0eP1+11fiDwj2Cxmi4QgDupIdDRWEj9mk7Ip44kua0++VCfGF+nATEtksL6AesY+1uP2VrtAvOwn1ZjSt2/MK4YVBkkPQPJ/N733RonS9YbR9B1kUYKL+HEG/vv+r4z0klhCUtW6s+PQUXZVWlJhThISNHu5D/1KlfRI64Jchpg7O6TENOb+/JTzaCe1uBlVJ+7tRnYTcPVCv/9yf9cs/49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiug1I3j7v/B1a8wBqlHkvXtECkfV3ZX28AwReSwKT8=;
 b=mbLGQJKociGxed2p+O9nut2UYeLWAWilY6PDJRvO3gOITXfirO0EQgZHH4p6tWHM2EAMakwtMQImrHFgq2LIzy/2Gp5Fz4dGs2BLZq4L5DQf6QX43RFS52FOLJFnKRJu72Zh7IijiwEmzMqCq8cW1etXveeQZNTgoATSQn5H6fh8rDbYipAGd3XGtTYQ/qt3eK7afTPjlMZ+ZfnZjQnSCJxD9BUN3EM4CKTP6+6bXCClz11Mbb6AsSikM+c19f1wma0Gof9W+4HlTIclD/akEBlToUM3QiBLVHd3KUJlBU7p2j0Lear2HwBB03VdLC8XaH8E2+tYc8JZJuGEdhD46g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8795.eurprd04.prod.outlook.com (2603:10a6:20b:40a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 20:01:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 20:01:39 +0000
Date: Wed, 1 Jul 2026 16:01:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, robh@kernel.org
Subject: Re: [PATCH v13 7/7] i3c: hub: p3h2x4x: Add SMBus slave mode support
Message-ID: <akVyHVAY6UUgUaoK@lizhi-Precision-Tower-5810>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-8-lakshay.piplani@nxp.com>
 <20260701072101.17E8F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701072101.17E8F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b1a265-9b83-43ee-a95f-08ded7ab8ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|11063799006|56012099006|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nafpxS1v5YoFyZGLGNKMYyrXJqJUqBo7WPvLDBBc9VfgzW5HYFgv+6Hb7ZHGJNfn4WPTMADk2OuIOiVF4I2KSOvFVdbQQbcZaOkVrxCu3/N+YqUU5dYkNfn/SeoqPDR4tEC5DqlpR6ID5Zxf6XvLGFvcmdBKl1P8lmYOZ/PK8gGihkqMAbEZ/vgmbYpYnUy87/pnHcjzjc8fYMfAmTRvaSS5b9xLRzkJOPKzmHsqL0A+U7MWczCnZInyjDFnK3IXLk4M/8UYnyMbixRNSQ37pyjQ0IdtMTcg1Qpo7klmd2yzADw8hWrfS4op+czdYxYkBrLDEdwvyX1DcYAtj4P0h95Fsq+iJKg9A8pdR86I8Pu91CpFH7DL/uNOjNr/NwgNXVciCJHNHXX7sLi9UYDRQ8tYNMFzXJl8ORMG9aG16obgQswoRsxsg47yB1MhjVgIvigNpbUwZEA8G80e2DhwLHNvjzGwRsNYb4yYytk5ktJBMCwAZw4mGi0796ydHdBmnyEpOqS0WiL93HsIBIQ2oDIVIAdgP3xp2Gu441nfD5uq6/dnVxqqe+GcffjL9WJwojmFRmoWe3WY9318OplJB/gnMYj1khhZEH12IFikt+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?a1Vl3gVmC9mRju4y6r/Ua2vp+xLMp0J0+FM2L3Jz+6hgz/MbX0A4SpqPp4?=
 =?iso-8859-1?Q?XhhoyXjkgJRVhqZXySWnpAK1WVTuG7U+K59XZKXjHzYPz8mAHEkqPEm3O0?=
 =?iso-8859-1?Q?U2s6E3nDjOrgFHlLxWAg3a3ZtJ40wZnDEYkzPPuy9Bm7echdtGiNyRYVWP?=
 =?iso-8859-1?Q?tswzkvD+onzaa8+MZUWdL9um6dnx7kJeCESijIXyCpK+fRcYMM9M2Djct+?=
 =?iso-8859-1?Q?Q/jgnofS/oVzX0/MIH42gyi+oIY3TFqsNe6TCeYvNO9pHewntpI2b+BXMv?=
 =?iso-8859-1?Q?qrR/2aJrPJW6FtRUx5gleI7BPJ6shqrXr5ROw9ntfKiapw+9jwNCOFwx0z?=
 =?iso-8859-1?Q?b6EssIkT9a/o0/PUEby26otVBo1/Y6w1LLao2V0Y7QTxLLOvf+S1/+EsS+?=
 =?iso-8859-1?Q?X5eanlPuXjOZATZHn+kml4z53fEZf1Ma7kYFV/HNofSpN8SgHY7EksYrtl?=
 =?iso-8859-1?Q?5/EZErMDCENADigKGNjSFUSmJwZpntXi0w2Mef5xfGZSbbAJJRfjwD0Hrd?=
 =?iso-8859-1?Q?oe1xpkTU6udjixqLV8g7ogPjNSmsgLF6CSNBF9FgA5UGl0Ha79gcmDHxvv?=
 =?iso-8859-1?Q?vE08NkBUPOZrhnRqToOSRfq+1Bu/0+Qa0nDis3bHkaojtgAzA5K1+Ro3eu?=
 =?iso-8859-1?Q?XHX2IxRNpF5EjagEko1/Cz+gAYs4GVmcCbcN5RtLXsL2jL2z3prr6qbOAa?=
 =?iso-8859-1?Q?5XOTnPEMjcLRHPiBIrOHUv0qivtVYRcGk7z/uoXoGFlGd6KcqvysnfSKLh?=
 =?iso-8859-1?Q?1b+r/JyYk1Vyt+PtsLoZV3eMmzzoPpsJyHXHBOPuKg6aRERCevo9zi2PC3?=
 =?iso-8859-1?Q?4mod4a5J3DRdQ66ciidY1n1mTE0ufmxBWfyyIPv8dSmknktZo7nkmsduCh?=
 =?iso-8859-1?Q?WMptPSETPk/IOv3RuchHWdAOBcJIKyFpa0fncL7lB9tKnlVDY68bW0XPgd?=
 =?iso-8859-1?Q?yBPLOLSBOgexHSGyWIbhCR30Fe7pUAymoxjHIiBckUTsN5XQEFHRsrgFS/?=
 =?iso-8859-1?Q?fmPvuD88LLZIip86WW+2B6Z/7IDnFpjgxsmasaYWfUOQ7WVDqigp4o3VMg?=
 =?iso-8859-1?Q?b3XZKm0HphjiUILbWDDjCPUbgzBLT0LJoKLE+IUS8GZtcau8m2EjIAbVnI?=
 =?iso-8859-1?Q?xXHHzk8l89jYxJ7kXGGCimSamPeUuKyUKzW7TNXEBcLdOsl1pBSGCNXJK8?=
 =?iso-8859-1?Q?10FtCw8T9Qz6hkMOQemMehobZzYbcCj+1i5xxn08+jfYa5DRLotMc//DAh?=
 =?iso-8859-1?Q?NGC4x26sVIbpaaedwr+Ane0D9dhO1UNvv7J5+er/QhTxbaJ8HBlv4NzvYp?=
 =?iso-8859-1?Q?8YWmIRYQRLkjDKDlIZ+Xr4cj0tM7UD+FyUP730cjSp9dbvbiEqjRl51gK4?=
 =?iso-8859-1?Q?NNNdfJmJBIz/4E/xrCsPGONRkTWB/zdNsYEEWx0s4I3K/9KXmokf+lpfm2?=
 =?iso-8859-1?Q?4bCKJHXXhHqL70tGdWKPxoli/QQvUfs+APewOXPvmPsX7tIl4LWVC0kFt8?=
 =?iso-8859-1?Q?uJB9IcbxbIYOH6vxZ8niIsH1c/rklDpUOW/5UPyekVTuArd2s1uvlA+pS4?=
 =?iso-8859-1?Q?m2BzHsEAJfNdtkLbvPE9hpog7x3moDrZy5qJpi312/h1Db/Zb29i+pShU1?=
 =?iso-8859-1?Q?dkqzWUYze7pa8sZ4pN4sbQ2+PZYMtdcotENy1D58RqqG+e8c/0mDB3q7lr?=
 =?iso-8859-1?Q?SvXDcQ6BbbxZeYkksIAi9a4hd9HGQi6QV4rcSZSOqIcSc7faud0YbQlZGI?=
 =?iso-8859-1?Q?t7wl+RBGG/tNb0di9gZZOBBf/QtHkOXNSb9ziMi1TQ8KNIkWwzp35Q/rws?=
 =?iso-8859-1?Q?W9cTHb9zPaKKCzm+wujLKNcxjqdMoS78TxKwFMjtM/XouaQgKCYd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b1a265-9b83-43ee-a95f-08ded7ab8ff7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 20:01:38.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFvFW8y8iuu9GnH88AE51coSWXd9Z4jmVQDZR1UomSHxo2mKCjrNoRwbApAwp7bY465E7hvsdmR+5OEEnFPTab2fVOnqUpV6dnEw3Zmc/wWjAnD2zGSBttJaHiGmSRtw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8795

On Wed, Jul 01, 2026 at 07:21:00AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Early error paths in `p3h2x4x_read_smbus_agent_rx_buf` fail to clear the hardware buffer receive flag, resulting in an infinite In-Band Interrupt (IBI) storm.
> - [High] Hardware IBI configuration is unconditionally overwritten after exposing I2C adapters, potentially silently disabling slave interrupts.
> - [Medium] The `P3H2X4X_TARGET_BUF_CA_TF` case in the IBI handler is unreachable because its value is masked out by the switch expression.
> --
>
> commit f1791953bf7e067a7ec560f25d66e9566565ed9b
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> i3c: hub: p3h2x4x: Add SMBus slave mode support
>
> This commit adds SMBus slave mode support for the P3H2x4x hub target ports.
> It allows the hub SMBus slave agent to receive downstream payloads and
> report receive events through In-Band Interrupts (IBI). The payloads are
> then forwarded to the registered I2C slave client.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > index fd000ff635077..f752cbe35c482 100644
> > --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > @@ -15,6 +15,157 @@ enum p3h2x4x_smbus_desc_idx {
> [ ... ]
> > +static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
> > +					    enum p3h2x4x_tp tp, bool is_of)
> > +{
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = i3cdev_get_drvdata(i3cdev);
> > +	u8 slave_rx_buffer[P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE] = { 0 };
> > +	u8 target_buffer_page, flag_clear = 0, temp = 0, i, addr;
> > +	u32 packet_len, slave_address, ret;
> > +	struct i2c_client *client;
> [ ... ]
> > +	/* read buffer length */
> > +	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH, &packet_len);
> > +	if (ret)
> > +		goto ibi_err;
> > +
> > +	if (packet_len)
> > +		packet_len = packet_len - 1;
> > +
> > +	if (packet_len > P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE) {
> > +		dev_err(&i3cdev->dev, "Received message too big for p3h2x4x buffer\n");
> > +		goto ibi_err;
>
> [Severity: High]
> Since flag_clear is initialized to 0, if an error path like this one jumps
> to the ibi_err label early, will it skip setting flag_clear entirely?
>
> If flag_clear remains 0, the cleanup code below won't write to the
> P3H2X4X_TP0_SMBUS_AGNT_STS register to clear the hardware interrupt buffer
> receive flag. Could this cause the unserviced buffer status to remain active
> in the hardware and result in an continuous IBI interrupt storm?

Is it true?

>
> > +	}
> [ ... ]
> > +ibi_err:
> > +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
> > +
> > +	if (flag_clear)
> > +		regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, flag_clear);
> > +}
> [ ... ]
> > +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> > +			 const struct i3c_ibi_payload *payload)
> > +{
> [ ... ]
> > +		ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> > +				  &target_port_status);
> > +		if (ret) {
> > +			dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
> > +			continue;
> > +		}
> > +
> > +		/* process data receive buffer */
> > +		switch (target_port_status & BUF_RECEIVED_FLAG_MASK) {
> > +		case P3H2X4X_TARGET_BUF_CA_TF:
>
> [Severity: Medium]
> Is this case reachable?
>
> If BUF_RECEIVED_FLAG_MASK is defined as 0xE (GENMASK(3, 1)) and
> P3H2X4X_TARGET_BUF_CA_TF is defined as 0x1 (BIT(0)), a bitwise AND with 0xE
> will always clear bit 0.
>
> Will the switch expression ever evaluate to 0x1, or does this unintentionally
> fall through to the default case which clears all bits by writing
> BUF_RECEIVED_FLAG_TF_MASK?

Make sense, please check, look like need use FIELD_GET()

Frank
>
> > +			break;
> > +		case P3H2X4X_TARGET_BUF_0_RECEIVE:
> [ ... ]
> > +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
> > +{
> > +	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
> > +	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
> > +	int ret;
> > +
> > +	guard(mutex)(&hub->etx_mutex);
> > +
> > +	if (!hub->i3cdev || !hub->ibi_ready)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (bus->tp_smbus_client)
> > +		return -EBUSY;
> > +
> > +	ret = regmap_set_bits(hub->regmap,
> > +			      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> > +			      bus->tp_mask);
> > +	if (ret)
> > +		return ret;
> > +
> > +	bus->tp_smbus_client = slave;
> > +	hub->hub_config.tp_config[bus->tp_port].ibi_en = true;
> > +
> > +	return 0;
> > +}
>
> [Severity: High]
> When p3h2x4x_tp_smbus_algo() loops over target ports and exposes I2C adapters
> via i2c_add_adapter(), this can trigger synchronous driver binding. A slave
> driver probing could call i2c_slave_register(), which calls this function to
> enable its IBI by setting a bit in P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG.
>
> However, if p3h2x4x_tp_smbus_algo() unconditionally writes
> P3H2X4X_IBI_DISABLED (0) to P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG after the adapter
> registration loop finishes, will this silently overwrite and clear the
> interrupt configurations just set by any concurrently probing slave drivers?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260701065755.2067793-1-lakshay.piplani@nxp.com?part=7
