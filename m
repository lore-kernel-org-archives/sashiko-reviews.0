Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0581D233958;
	Mon, 17 Aug 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786991843; cv=fail; b=oZRG4gLZKhA6IdtX/niu9aEKxjRnwzU3jwXL5quQX8hog6vsRbKsEjjmroogJPT0KiQsjXBM2DpIlRUynarK0KXM0vn4s1tXcqMuxnLv8s+Evt9cLHEVUAyXYdMBxZrkbOo2lDQ9gVF5rrW+RBU/nlJAK95Q1ZodXRCpu+CgOlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786991843; c=relaxed/simple;
	bh=6jBIvz0yCNB0pgCKtncVSyRbm70z7RblCZeGL8dqZ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P1AucnCpgUyVl3WujwX+v/wz0Rl65jvsUd2K0cLSXeEW4OEtowNzVf8owEiw6KKjSp7ceGy4iImVAEqemSlE54f0P3S5xqTVEiotNcT3hZGTVLxY26vKcc02ErbUu4BNboM6XeSTKSdAN0trgwzyBC9M1qqyG6fugpaaRXiMya8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FUjdPMG9 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FUjdPMG9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0+XPx2LKwHy/H3zrq1YUzfskAX0N8eQUj61SApdrWmYAYID/TqVrRdmzt4pI+fpT8yHPGV1XQiN+VwQM/Rw7BoJ4T8N3Q1+QGCuADudtu4Ozd0PzOcDZDh0F4a5QcE3309wsHs/5C3HwJ+F9in4uHdwJ022QSAEGoNibgN89iXeDlw/IlW63fIQUbzj8pwMYOS0So8aGDqu6k14REUb0DkAlmfbmOmSIhoI58E/xGxbtBKS0LCasdiSURbSbkkIAuz4US4GWbtBvDJ4+4CQqR1UFrgs7I1GthRDTjq93cjPvwYXzA7/Dx3MeATtBUB2wKFuOmzRJ+4+1HSFD0BEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxPgDxXkGFMjYNEk8QPb6vi388kVz8kOXQOscpOhcy4=;
 b=JQX50BW/sUYA9/3ZRLXC6xeffYUaUQaV0qarRpBTINdpUhAkEVDXcEN37c2RoohPRO08g9Vzxr69l6ZbXkNEK5aY1gmxbeTNMDS7TVax057jF9iAUR1+5u0SdY4OFykKWk+j79dEu2jJm6yZjIxRz6yAMoLsw/okZS1ahnijTG48yAgXb9X1eDBgPSacmdyOYyTE9zEYWTeEnzDnNzHOJwfROfYYDH3PEZO0PygRnDRnQEHH6TiWTTmxZ/nPZQfr9tV4QZH1aXe84yLYI0xm8mofduYya4UezDiraPa4MXgsFQgueuTegnzyjS8PMUZnG7HOQGdS/t/m1aL+GJW72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxPgDxXkGFMjYNEk8QPb6vi388kVz8kOXQOscpOhcy4=;
 b=FUjdPMG9nujrX6NCgvPPJrq9QD3w67Qq/9+19ykiOvtsjHEqyVxEJUbiZJIRF5ArZiJ9+SgB5jMAcTAgfMkLMN/6/qgI+xRxYEBA4SW7dF3/Pdtletj5SicvirE347vZKVjcsBpGwyLXWEjlrIXukYSKGHN0T7jcswRDD1dOw7JOcMRoV9oqRk6ScLYaERO6c1fsXTjuo3Otialdj4x6zCvjrJYg06Y1Gr6Pgm7zkP50BUsw4TwFNo9Oh/5NSz2MpRcyQGI38Qi/12ELkQTrD3JRpC04s45PmAei2z+KPBdgpks6kAka2hfB/SAIpDsQCP0o8lFOmH1DgGsvPknoiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6910.eurprd04.prod.outlook.com (2603:10a6:803:135::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:37:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 18:37:17 +0000
Date: Mon, 17 Aug 2026 13:37:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v36 5/7] firmware: imx: adds miscdev
Message-ID: <aoNU08NYpe1rK6Bz@SMW015318>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-5-45c42847bfd8@oss.nxp.com>
 <20260817084938.C2B541F00A3D@smtp.kernel.org>
 <GV2PR04MB12271867DDFC25782A7B688C595A72@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB12271867DDFC25782A7B688C595A72@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA0PR11CA0111.namprd11.prod.outlook.com
 (2603:10b6:806:d1::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 354ebd5d-24d3-4f9f-b9b7-08defc8e907f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|3023799007|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	wE4BWibkPL4gtGv3CsKKYpTZbOAeEklDlOj6IX2vw2ZqV3O0uRsJKPbPRmKk7/npi6TqArm+VAIPSK17Fdmuqb9VyTn9YvqaLvGT/oMqWxaTkI37D7A8TVBOAMwGUVepLSneYO5+4ozlSd1sY8dYgK12CUA0URBnsD/X4yIWIquZYfmsvVTZru03mc+soIN/DblDJFWXeHB0DRYMo0cvGiWOJjDA24UqEJ/SF8DfYpMu4n5mvUcUMRAdUpIzWzcmU5eiB4kTZL+VPKhi2DWxF00t8q2CpHhIzAzrbJNFFTbAHDHZO4um/VXSBsFThLjXmwQiXIvD36bm55UTNCLZn163SZd3vpLdCWOHiTSUYm8JfPw8EQh5qTscz5yuaSmjOZH9ZSYONzVwXI1DgeJby9rU9GDDDIJAspUB0G1AtlP1hVgSjQl2EjMOJx3bWdIOu2tp+goP/MB3joEND7vlDd0lXr/B4YH1R5bw4mU/yyu6bVCt250L4NKaBWFW9oaa7LJC905JAGdsSUww1TCxbKprQRpCUtYoo+Fq5FcZo9t+OzOZIBmi2cg8k/JKPOSpCv65IvZyVIfThc/IYT/x2/bR4lI1wg3Q29zvZehn0MY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?z5DE6aL+BwNNW4G6LPQAVGiiUZx10ATrJrN0RNtjvO7Y2SVtxtti5QhJ7U?=
 =?iso-8859-1?Q?Jm885X5SDd/2R/NJ9NCNuSdtEf7E6X1G+U21VEjY6756WB1YTuRoJxDCWj?=
 =?iso-8859-1?Q?yynH8DVw5IRo6Ug3u22HRM3L27cLXCTW8ibF1U/nhx+SOsN92wVUwG29yt?=
 =?iso-8859-1?Q?tgtJLAdLcWFCje+jZMhx5faSVMnQr851PSeA8OfyHRHPdVc9lgBP/LErXl?=
 =?iso-8859-1?Q?LZ+hbrLxDZDRlbMAhGrQQJQM8afiqfUZ4SI7tbkl/hqajwHZ+r66RIl3gN?=
 =?iso-8859-1?Q?SUtK1WIpp6S9RoW0kGh5ahpY9pzfsBh9lJr4uXITNmgvVRmcLcry+6sUQ+?=
 =?iso-8859-1?Q?3UQqHsyxcgYvNSP+eooPAUn68K6c8Cr797RxdLv6JGNMsx7ukY9TMzG+yA?=
 =?iso-8859-1?Q?2ZM/LT1Z6Hdd+ZMJP+IqVpmlYevbMqccczMDYD0gmBxDnMrjEILbr3dSjH?=
 =?iso-8859-1?Q?tH/CT771TeX9eUg0uPezGGk2AEbaHeNXU3Y8YtPwsdWYrshFopC017a1v7?=
 =?iso-8859-1?Q?MGzNONfE5yV6zR5kaW6hUDVohCRI9hDVMUivOpfSBf4Rk3b+NIkZj67Iwl?=
 =?iso-8859-1?Q?80ATO7e0oFvDNL1sM9/lJllmXiu4aABlsq5zSqbnzIIHnNaHZLt1rXeJLS?=
 =?iso-8859-1?Q?fpYTwPOP41Y/R4sN7A9EFlb14d9Rm1deaWOGFV0K0QVBYhBtBvRRAnZIQG?=
 =?iso-8859-1?Q?D3KEhHTb63eNm+eqp+kLjzw6C3SjSI6Pe2vTMO2g6u6jm6HJle/YFbKMZD?=
 =?iso-8859-1?Q?U0Y61BiKiGxjsZTKbEjrwXw5UI9g2tN6T1GwD8Llp9u0g996Ujp7Jpblik?=
 =?iso-8859-1?Q?6vTqqXVK0B0A7roaWRn+4ynvCjqOD/8Hu/sbNCvNyo2NNBA0JBjsTiTX9E?=
 =?iso-8859-1?Q?2+sWy1cHzG0bEmxwBOTECiWzi/76jCV2I9DWw5vN1uXrbuqMmChdRKBj28?=
 =?iso-8859-1?Q?4p9pMMJt0zySgdmZ2iIq0ymbHsUQvaydisetPpCDoJYH7TmA2M6WTDhUwD?=
 =?iso-8859-1?Q?v+LO7WF+ihg9A5W5zrJ6lqiPcO8vGLp7qGAaQp7xe1r4ZDP7JTN/gGxief?=
 =?iso-8859-1?Q?sZOZXOX5Mzdoos3ysT1wopfKS1dz5lJfOWtPeZWO45tALvLom8gatFCWKb?=
 =?iso-8859-1?Q?onAmqx28VN3hQgtp53JPzOkyqqoZJ7eEVjOzC4Itexdxvo0VGhNF05ptdD?=
 =?iso-8859-1?Q?Bv5EH8w4+OIEFTmXaNdlCEcYszqZ+K6gx5jl+f56u3D5mSck/fAP0dg7zQ?=
 =?iso-8859-1?Q?7KgyI7B30uNAacOsu+QE+rYdx7w+4X4GOxmeZqV9EhuE+UX3yIe+4cj89J?=
 =?iso-8859-1?Q?ajtttnUe1nTtS12CWD66QsgNW+KUCSxgYERh+nKOubgAvu5TS/zIDLJQaU?=
 =?iso-8859-1?Q?9SI8TcM3w+yVe2r59Ji66rCWvJFPhOmiDPbsNcPtj1JH1Z8Aemmr5bHGzW?=
 =?iso-8859-1?Q?3q7flCwKEf+0JReEc5LvY7iPW3/rznXusSo2svukMloh7GpmHsqtwSlsNi?=
 =?iso-8859-1?Q?l1JG7yXknxWEbcrgoPNDmt1Z3EVlPlk9FSlIK39YRlgjWvvFuPLK/rUoyz?=
 =?iso-8859-1?Q?v84/SR9i/5tcKSpvoI354wgvwWmP3J5HKg88gkTOauoOEOlm4BtRn+X0+i?=
 =?iso-8859-1?Q?1063lAQ5Hj7NvDnLwF2qoR8Ie1uQ96NQYkJsxxOCyQI+BGrpt8s+SOO9VG?=
 =?iso-8859-1?Q?/Pt8sCoXRXC8/Jwag+qVtjPCEyyYnS+9Ljh6yvDQTzdCscYZHgUkNE11La?=
 =?iso-8859-1?Q?5oXUY9GBzLSV1Xl/spgzsCN0Efcb2z4ExK/9KwTO7KYyWN7CySR3gT7u+5?=
 =?iso-8859-1?Q?hyccCKZff+WyR+ecqgOI9k0NYhdFZMMs+hfHpXu9tTsjbPTNp84+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ebd5d-24d3-4f9f-b9b7-08defc8e907f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:37:17.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzKYGwbfXSQytq9NEjj091P3l0Zd/pNQuNc5wzCpXJdJQ12Q/j+D667gyBTJh89J6/JJ3l6531NT1ebkfpUEz5ffYaXbzusximh9POp06CnqN5X2gAet6LSArTl0kdFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6910

On Mon, Aug 17, 2026 at 06:03:01PM +0000, Pankaj Gupta (OSS) wrote:
> > > --- a/drivers/firmware/imx/ele_common.c
> > > +++ b/drivers/firmware/imx/ele_common.c
> > > @@ -101,15 +101,15 @@ int se_val_cmd_addrs(struct se_if_device_ctx
> > > *dev_ctx, struct se_api_msg *msg,
> > >
> > >             addr = msg->data[f->lsb_idx];
> > >             if (f->has_msb)
> > >                     addr |= (u64)msg->data[f->msb_idx] << 32;
> > >
> > >             /* Zero marks an absent optional buffer. */
> > >             if (!addr)
> > >                     continue;
> > >
> > >             if (addr < base || addr >= end)
> > >                     return -EACCES;
> > >
> > >             /*
> > >              * When the message also carries this buffer's length, the
> > whole
> > >              * buffer [addr, addr + len) must fit inside the window, not
> > just
> >
> > [Severity: High]
> > Does this code prevent firmware from reading outside the shared memory
> > window when the command lacks an explicit buffer size?
> >
> > For commands like ELE_OEM_AUTH_CONTAINER_REQ that use
> > SE_CMD_ADDR_NO_SIZE with no buf_size, only the start address is checked
> > against the bounds. If a caller provides a start address at the very end of the
> > window (e.g., end - 1), could the firmware read the payload out-of-bounds
> > into adjacent physical memory?
>
> - Not a bug - by design.
> - The existing comment explicitly documents the rationale:
>    -- this is a read-only input buffer
>        --- (firmware copies the container header into its own internal memory for authentication; no DMA write-back through this address).
>    -- A rogue caller can at most cause firmware to read within the shared-memory window it already owns.
> - Output buffers must be fully bounded;
> - Input-only buffers are safe with addr-only checks.

Why? at lease addr should include payload size?

Frank

> - This is an input buffer. No fix needed.
>
> >
> > [ ... ]
> >
> > > @@ -290,16 +290,16 @@ int ele_msg_rcv(struct se_if_device_ctx
> > *dev_ctx, struct se_clbk_handle *se_clbk
> > >                      * before the fatal signal: se_if_rx_callback() has
> > already
> > >                      * copied it and set rx_delivered under the same lock,
> > so the
> > >                      * enclave is done with the buffer. Report it as a
> > normal
> > >                      * receive (rx_msg_sz) so the handle it carries is still
> > >                      * recorded and later closed, rather than leaked.
> > >                      */
> > >                     if (is_rsp_wait_with_timeout) {
> > >                             spin_lock_irqsave(&se_clbk_hdl-
> > >clbk_rx_lock, flags);
> > >                             if (se_clbk_hdl->rx_delivered) {
> > >                                     ret = se_clbk_hdl->rx_msg_sz;
> > >                                     spin_unlock_irqrestore(&se_clbk_hdl-
> > >clbk_rx_lock, flags);
> > >                                     break;
> > >                             }
> > >                             if (se_clbk_hdl->rx_msg) {
> > >                                     se_clbk_hdl->rx_msg = NULL;
> > >                                     if (!completion_done(&se_clbk_hdl-
> > >done))
> > >                                             se_mark_fw_busy(dev_ctx);
> > >                             }
> > >                             spin_unlock_irqrestore(&se_clbk_hdl-
> > >clbk_rx_lock, flags);
> >
> > [Severity: High]
> > Can a concurrent fatal signal and driver unbind bypass the firmware-busy
> > circuit breaker here?
> >
> > If a process blocking in ele_msg_rcv() receives a fatal signal at the exact
> > moment se_if_probe_cleanup() executes and calls complete_all(), the wait
> > completes. The signal path wakes up, and completion_done() evaluates to
> > true.
> > This causes the signal path to skip calling se_mark_fw_busy().
> >
> > Could this lead to teardown freeing the DMA buffer via
> > cleanup_se_shared_mem(..., true) while the firmware is still busy and writing
> > into the freed memory?
>
> Accepted. Will call se_mark_fw_busy() un-conditionally in this path, to prevent UAF.
>
> >
> > > --- a/drivers/firmware/imx/ele_fw_api.c
> > > +++ b/drivers/firmware/imx/ele_fw_api.c
> > > @@ -180,14 +180,14 @@ void fw_api_specific_ops(struct se_if_device_ctx
> > *dev_ctx, struct se_api_msg *rx
> > >     case ELE_STORAGE_OPEN_REQ: {
> > >             int rc = 0;
> > >
> > >             /*
> > >              * Record the storage handle before registering as command
> > >              * receiver. FW has already allocated the handle; if we
> > assigned
> > >              * it only after a successful registration, a failing
> > >              * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would
> > leave
> > >              * strg_hdl at 0 while the ioctl still returns success to
> > >              * userspace. The kernel would then never close the handle
> > on
> > >              * teardown, leaking it in FW. Storing it first guarantees
> > >              * cleanup_dev_ctx() closes it regardless of registration.
> > >              */
> > >             dev_ctx->strg_hdl = rx_msg->data[1];
> > >
> > >             rc = set_dev_ctx_as_command_receiver(dev_ctx);
> > >             if (rc)
> > >                     dev_err(priv->dev,
> > >                             "Failed to register %s as CMD-
> > Receiver: %d\n",
> > >                             dev_ctx->devname, rc);
> > >             break;
> > >     }
> >
> > [Severity: High]
> > Does this silently ignore a registration failure and leave the state out of sync?
> >
> > If process A already opened a storage session and is the command receiver,
> > and process B calls ELE_STORAGE_OPEN_REQ,
> > set_dev_ctx_as_command_receiver() will return -EBUSY. However, the error is
> > only logged, and dev_ctx->strg_hdl remains set.
> >
> > Could this trick the firmware into sending NVM callbacks for process B's
> > storage session that then get routed to process A?
> >
>
> Accepted. Will add preventive check.
>
> > > --- a/drivers/firmware/imx/ele_msg_addr_field.c
> > > +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> > > @@ -568,10 +568,10 @@ static const struct se_cmd_addr_field
> > ele_rng_get_random_addr_fields[] = {
> > >     /*
> > >      * PSA_COMPLIANT get-random payload. reserved/flags is data[0];
> > > rnd_addr
> >
> > [ ... ]
> >
> > >  static struct se_cmd_addr_field ele_storage_master_export_addr_fields[] =
> > {
> > >     { .lsb_idx = 2, .flag_idx = SE_CMD_ADDR_ALWAYS,
> > >       .size_idx = SE_CMD_ADDR_NO_SIZE, .buf_size = 0 },     /*
> > key_store_export_address */
> > >  };
> >
> > [ ... ]
> >
> > >  void ele_set_sz_in_field_addr(u8 cmd, u32 size)  {
> > >     switch (cmd) {
> > >     case ELE_STORAGE_MASTER_EXPORT_REQ:
> > >             ele_storage_master_export_addr_fields[0].buf_size = size;
> > >             break;
> > >     case ELE_STORAGE_CHUNK_EXPORT_REQ:
> > >             ele_storage_chunk_export_addr_fields[0].buf_size = size;
> > >             break;
> > >     }
> > >  }
> >
> > [Severity: High]
> > Can concurrent operations cause a race condition when storing transaction
> > sizes in these global static arrays?
> >
> > If two callers concurrently trigger ELE_STORAGE_MASTER_EXPORT_REQ,
> > fw_api_specific_ops() calls ele_set_sz_in_field_addr() which mutates the
> > shared global array ele_storage_master_export_addr_fields without
> > synchronization.
> >
> > If a context requiring a large buffer is overwritten by a context supplying a
> > small size, could se_val_cmd_addrs() use the clobbered small size, pass the
> > bounds check, and allow the firmware to write the large export out-of-
> > bounds?
> >
> - The command-receiver is a slave to the FW.
> - FW sends commands to its slave to fetch information from command receiver,
> that are required by FW to process a command request initiated by the waiting dev-context
> while holding the mutex se_if_cmd_lock (via ele_msg_send_rcv()).
> - ELE FW processes commands sequentially in FIFO order.
> - There is never more than one concurrent in-flight export transaction, so ele_set_sz_in_field_addr() is never called concurrently.
> - No fix needed
>
>
> > > --- a/drivers/firmware/imx/se_ctrl.c
> > > +++ b/drivers/firmware/imx/se_ctrl.c
> > > @@ -1727,14 +1727,14 @@ static int
> > se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> > >      * ioctl reports plain success; the firmware status is conveyed to
> > >      * userspace inside the response buffer itself.
> > >      */
> > >     cmd_snd_rcv_rsp_info.rx_buf_sz = err;
> > >     err = 0;
> > >
> > >     dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
> > >             "message received, start transmit to user");
> > >
> > >     rsp_status_err =
> > >             se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg-
> > >header.command,
> > >                                     cmd_snd_rcv_rsp_info.rx_buf_sz,
> > >                                     tx_msg->header.ver == priv->if_defs-
> > >base_api_ver);
> > >
> > >     if (!rsp_status_err) {
> > >             /*
> > >              * The response is well formed and fully fits the caller's
> > >              * buffer, so any FW-allocated session/storage handle it
> > carries
> > >              * (data[1]) has been delivered. Record it now, before the
> > >              * copy-out steps below. The FW has already committed the
> > handle;
> > >              * running fw_api_specific_ops() only after a successful
> > >              * se_dev_ctx_cpy_out_data()/copy_to_user() would leave
> > the
> > >              * handle untracked - and so never closed on teardown,
> > leaking it
> > >              * in FW - whenever the caller supplied a bad output pointer.
> > >              */
> > >             fw_api_specific_ops(dev_ctx, rx_msg);
> > >
> > >             err = se_dev_ctx_cpy_out_data(dev_ctx);
> >
> > [Severity: Medium]
> > Does a short rx_buf_sz from userspace bypass handle recording and cause a
> > resource leak?
> >
> > If a caller issues ELE_SESSION_OPEN_REQ but specifies an artificially small
> > rx_buf_sz (e.g., 4 bytes), se_val_rsp_hdr_n_status() will return -EINVAL
> > because the returned buffer size is smaller than the firmware's header length.
> >
> > Because rsp_status_err is set, the call to fw_api_specific_ops() is skipped.
> > Will the successfully allocated handle be permanently leaked since it is never
> > recorded in dev_ctx->sess_hdl for teardown?
> >
> Accepted. Will fix this in v37, by checking the rx_msg_sz for control messages ELE_OPEN_SESSION and ELE_OPEN_STORAGE only.
>
> > [ ... ]
> >
> > > @@ -1849,21 +1849,21 @@ static ssize_t se_if_fops_read(struct file *fp,
> > char __user *buf, size_t size,
> > >     /*
> > >      * Snapshot rx_msg pointer under clbk_rx_lock before releasing it.
> > >      * unset_dev_ctx_as_command_receiver() can acquire the lock, NULL
> > out
> > >      * rx_msg, and free the buffer at any time after the unlock; using a
> > >      * stale pointer from the shared field after the unlock is a UAF.
> > >      */
> > >     scoped_guard(mutex, &priv->modify_lock) {
> > >             spin_lock_irqsave(&priv-
> > >cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> > >             if (priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx ||
> > >                 !priv->cmd_receiver_clbk_hdl.rx_msg ||
> > >                 !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
> > >                     spin_unlock_irqrestore(&priv-
> > >cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> > >                     mutex_unlock(&dev_ctx->fops_lock);
> > >                     return -ENODEV;
> > >             }
> > >             /* Taking snapshot is enough for the one common pre-
> > allocated buffer. */
> > >             copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
> > >             memcpy(rx_msg_snap, priv->cmd_receiver_clbk_hdl.rx_msg,
> > copy_len);
> > >             priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> > >             spin_unlock_irqrestore(&priv-
> > >cmd_receiver_clbk_hdl.clbk_rx_lock,
> > > flags);
> > >
> > >             /* We may need to copy the output data to user before
> > >              * delivering the completion message.
> > >              */
> > >             err = se_dev_ctx_cpy_out_data(dev_ctx);
> > >             if (err < 0) {
> > >                     se_dev_ctx_shared_mem_cleanup(dev_ctx);
> > >                     mutex_unlock(&dev_ctx->fops_lock);
> > >                     return err;
> > >             }
> > >             /* Copy data from the buffer using the snapshot taken under
> > the lock. */
> > >             print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4,
> > 4,
> > >                                  rx_msg_snap, copy_len, false);
> > >
> > >             fw_api_specific_ops(dev_ctx, (struct se_api_msg
> > *)rx_msg_snap);
> >
> > [Severity: High]
> > Can this sequence read uninitialized stack memory if the user provides a short
> > length?
> >
> > If a user acting as the command receiver calls read() with a short length (e.g.,
> > 4 bytes), se_if_fops_read() copies only 4 bytes into the 256-byte stack array
> > rx_msg_snap.
> >
> > It then unconditionally calls fw_api_specific_ops() with this partially
> > uninitialized buffer. If the command is ELE_STORAGE_MASTER_EXPORT_REQ,
> > fw_api_specific_ops() reads rx_msg->data[1], which now contains garbage
> > stack memory. Could this update the expected buffer size with an invalid
> > value and break DMA bounds checking?
> >
> Accepted. Will fix this in v37, by initializing the rx_msg_snap = {};
>
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260817-imx-se-if-v36-0-
> > 45c42847bfd8@oss.nxp.com?part=5
>
> NXP Confidential
