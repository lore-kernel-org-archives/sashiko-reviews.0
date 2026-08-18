Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8B3290B9;
	Tue, 18 Aug 2026 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077311; cv=fail; b=QhlPwXBkCEAUlEz+8tUSriPlUhcA47+WXibbSRzTNmLkJ077E/m43YPCrkjoYQDYyvN5j/S3Bv85sxaBaNlspHuOLARGLxONxhyVUQQwz5SgsErxNPS0uCIAkCUizaktqohKDEsniyxG1T6amsio0mrtRq4dVeccYo9/YPoxeHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077311; c=relaxed/simple;
	bh=6biZ16XXuuGLDBGHRbVGXF3fcvVvRh4R0U06E1z1QGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LVDdY/KkaQIoqn10ysGO/h5NnEHuHmyESo3si5tPhi6vA8OCQcIzHrlfGkl/vfLrBMRJqljgRVIOkP9su5CnnH5wgMNHoENXvl9IElx7WHFQHmNzgCJ/yxY7jw1ou7UQZ43bBYAleyUWTll9TePgK8wU+97ejJrkdwNNhE1Ew9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=snHLUVfD; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="snHLUVfD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTjMNy+Eg6qr5NggNm35hPdVQWMhJn5jlBY6Bwe2yBThoD0cuQLCdLXbETVE/EkHNsJAfzuDsP9sCTVGn3+HOVlQW+zsYEdgARqCAxlyYk5uOLDJCjpeo+cxhBRYogxQ8/zg9oD4bK+vMa+jdpmrmGykOZ13A+rKiuHuPkUU5Oh+ZH5WM2S3IclD9Uertzh6aq8sktyNWGLyQq5LVloFsuYVqHr1i4yU6tL2EocgpIil2BRU6mnJ73QkemHRxUojCIBVUrPJwsonLQK1pBUDbB90Rt0ie/cDRn4tPGUfEbLRGF5YId+Ik7aJ5jWjF0fhT/cPARVLrp7s4nC9GzqjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4xAZEYmL6VYz81iTftxKZsYOntc2OMpRbaToiwdhZc=;
 b=UIub0V8/i7/OveVXcAK1XCx56Vb8Tsa+gge1uDRIaBZ/+aACOlZOZTwH55lEuGbiYRppQHlOy3gS0Ts4J7onfAko6jrEzR8w3nmutHoeZyg4LWKYK6jcBfrJNTdsJZZ4TznMwYloDyxTGqBef+sqtaTu98YU8TtBFHzPcUN1znVb01MeH/dfdiv4MdxbXzJgeAI6YK9lGOy42/nMY4qZSbJObYwPlsZBnBA8BqetqGmEokRbIW9AA5QX2TQYpqRzrwS9+qrFpseLVjJoE7ZngCLvlWqLb/CCVlMQyQxkgg8UsvML4G1PMjmSKck0O6KnSH/VhIg9zk0sWon9fRQvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4xAZEYmL6VYz81iTftxKZsYOntc2OMpRbaToiwdhZc=;
 b=snHLUVfD0wAbCovh5k2mJ5U0aLXD+lNn7nC7DZ2auVDD60s9oZ7B7Xel/owRdHOBJeFHI9VUXij0auTh8jjyBzc0Og9CNh3ndqgmhypBy7TR5X069DmqKXRJ4pRMx5ZPxli1gx9IEYw1rEDAzBohV73cILirT3iCdhMDikO+PcQl89YSJCS4CkZoCHa6dp8IKp+sRUAztcZQuTKOjyTIH9d/+VhjLCppedaEX4GiG+hkIPTXJIG1Yun5EczqVYmF/SiebkWOkoAlplCWg7WziDY/Qr9SCg0Xp0SD/aoPfc4Dz2ivu3FBm7on1v+9RoLH9Dk2ofUJaD1NuIqyuzVA+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AMCPR04MB12624.eurprd04.prod.outlook.com (2603:10a6:20b:76e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 18:21:47 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 18:21:47 +0000
Date: Tue, 18 Aug 2026 13:21:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v36 5/7] firmware: imx: adds miscdev
Message-ID: <aoSirE2DdlF39Jpx@SMW015318>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-5-45c42847bfd8@oss.nxp.com>
 <20260817084938.C2B541F00A3D@smtp.kernel.org>
 <GV2PR04MB12271867DDFC25782A7B688C595A72@GV2PR04MB12271.eurprd04.prod.outlook.com>
 <aoNU08NYpe1rK6Bz@SMW015318>
 <GV2PR04MB122715C58E176CB3BAF1E77AF95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR04MB122715C58E176CB3BAF1E77AF95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7P220CA0176.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::29) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AMCPR04MB12624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7d1d66-74e7-4878-85ed-08defd558f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|376014|366016|11063799006|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EpcrlW+XnkTZXGAGjafDHLg6Bqi2VNElfs72fuJHE/TBl3/BXHkhZfm4JJdqxkIUCAXh2gv9kitCVFxDWcwg9Jed/yiYnimvoYaj02B4P/R0tDeymJr9fhYquqzwQs/mRcWeaYxbniNS1TiBKk4N3HJCvv0R85PoivrxFwikmnO0vDeMm9IzSIX5L/4fIjMJW25TaEf0noupyTu9w5VqGwN+yQQqLy2IKf3fgL40BgLh55fO9m2fXiwBvoz0TRFoPKwLmd5x/POd5xDmnVIOGSzpcWET7qtTZ3cXpBJxI/UvdVymViYrKZfsDl24epoqaRwImE8oL+1XNpX2BX9flQALDHOG70asxL63UNgx16MZ3ph12F8Qsl3z2O7IGGv4hS5vpXs4VVf0rBXykBRp5f2Su3hjZ3/RxO+6opxCtgYmmL9F3fPkXi8JxPxHeLmvAkP/9nBGVyNZJFco2lDhTrQoH8cAqUfNyZKscKJJJ0CGeIcZUzbhVsloggSp+vdV5/aMHgYI5XkXrZu2w14tq7IyrCFANsk6Gj4/NfpRYuPPgN2tLVP20yh2NAjtp2h+aZwO9OTk+udiyj/b1AhsP5/Vi+SfTXnY59EwpMQqVDbCyPkaRc8bE2R/jAqaHqmJcIRWtMInSa//7eSFks0CBaQF2HvlUNsLFVtyR/E6yGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(376014)(366016)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IYRIxrT2ylG6XX3ucetUuUUXLuPcKxsmDiUDs4nCefCFQ8evim8XRLt45H9E?=
 =?us-ascii?Q?9o5NcrVHUl4qmkHu4fuMHUS0r/Xbhsq+J2YH6F5wnTtKP+KdG5CUT0XAYxlw?=
 =?us-ascii?Q?1tBFiD95n5EZH08SNltK3bBIRDLQobfLO2kryBlB883c3Fsie0xKK+w1KdR0?=
 =?us-ascii?Q?kC9ycfyNsKL9Vi8jw5Ur0WCuQwvf98u+TJHkW8dp4AJhVD0PebqQbFfIOGhL?=
 =?us-ascii?Q?WT2/rZ+ckyFNY8oHLKiwe+ScoseA8A2iuYvcHstqeTwN3gvpUlxI+Lt9KqnK?=
 =?us-ascii?Q?YXVIG8WSdKp3UClBybPiexISW42Wjg2aE7e7gU0l5VoKdJfMvpOZWFceNJIe?=
 =?us-ascii?Q?g6kU90PHuwtI2lKimceaWQypavZKlLZBioGuG8d+grNMuElChUcYbfUPCCNg?=
 =?us-ascii?Q?w8VmwKR8UaJKdfvpkZfmIY+sO9L5/ke7Zvq6RVTIK4Tbw+Xb69OKHFx4U04+?=
 =?us-ascii?Q?Mh+TIeFIjFxPY1l/vHXhx9RTt+TpYtzHwe8pDDr15Nioa13JXZviAM5xusqR?=
 =?us-ascii?Q?t4Ix5IZVSbwNrvgZFFeJV4lz5BGDxKJnii6w8mjJL6kKQuLFQL36FPh0gkB4?=
 =?us-ascii?Q?IY6CZymSly83Timamr3FsLxTAphGYcXU9Gzvj8SIl7Soe7Vlgqn15ZTcsgMQ?=
 =?us-ascii?Q?4lorXwy1pC9k8kRtN/5ha8I3JonmXtmla1/0/dWmecmdMKH/cLYNJvj6K7Ms?=
 =?us-ascii?Q?JHwcLxmpLlBuAif2w2WIX3D3ZTkrkFv3nxjDFgBdszKU2Ka8Y7nAoyl7rGek?=
 =?us-ascii?Q?tyGtXn8/FuEYLxk3BIhOl6xA6066v6GY+vaudJhZIcrbsyxTLrQORnR8BKEf?=
 =?us-ascii?Q?ZvPX9REHmEWb3CafHX31lJph8X46vJGWkAcu4kqygocvjBUKor0ZWqHAxSTd?=
 =?us-ascii?Q?rUNq7eX/jq7hzQAHq/5CrlayM9FQdZoR4ByvsGt/0FCbJ1FJyHkpWSa8veg9?=
 =?us-ascii?Q?kPdzWNnW4hWJ5PxjoWf+YsV0TabE8WbqidpVavbp6O5E7mVr12kl5zyKNra+?=
 =?us-ascii?Q?ZiR36cBgIM9TVohWnQQ7aZ80ChlTC8BE1+B5n9Bgl/WgfvRakNpXf/zFeo32?=
 =?us-ascii?Q?lwNHBpZw9o9MYAy4uQiA+tROea/ragHMf8w/H/tqVMPagIJtDRqfIPR73hI3?=
 =?us-ascii?Q?Qrh46+NS8hu1iFq3CXVD1j26kyGRfKWyLSbjRDbkugbKCXIt/Yd7GRN6956k?=
 =?us-ascii?Q?XpNHzfHEjFXWKk3uS16W0DC4/5CPbMz766oFLhYtI1zHyjpa8NQpIg/1azTF?=
 =?us-ascii?Q?3IPQFCco7PMzM7OpZtOPRVsz6vLft4txzuSngBrjWnyaF7tCOqUgvnIF+aSQ?=
 =?us-ascii?Q?LBNmWY19ObF5VE/8eL224GDGCiOQStXan9lKHrbj/UcD5FroiAZ/dgJEjwTC?=
 =?us-ascii?Q?UuC2ybyEi5XMxkaPBGq8WfeQNGvEN4GYobPRH4OogXPkEkqlwzQqYh2l+IB0?=
 =?us-ascii?Q?5cnrdRaZP1vWIUVXSpyGkv+CkwCF1Pkn53nEsBtk1e2HoM9n23dqBH0EDytx?=
 =?us-ascii?Q?BggIVNJOQ7CzoqXLaIZlcOB4oAIeuta3Rrsy2kMPIA9MoVonrZHf5mzZTA+G?=
 =?us-ascii?Q?9LO/eCydfyM1fpeYCXEo8COI4n5UlEV842MT0N8ViVjul0LM/vjgVMff4R4Y?=
 =?us-ascii?Q?20gy6OAb6UMWCMdEXgNIpun9rDPwxbDER1dMD5/wR1DPcShujyybbh7DA/sj?=
 =?us-ascii?Q?TbEfV5VxyDhmMq2w3o2j1JciRdQVJ4B3d+tabrWPU9TqWbLH9ZbGAefB23eH?=
 =?us-ascii?Q?hzZ32sXXQLVHdYZkbXeXdgtNwcOt/iRf3xA64hxG0723UlAyaFRC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7d1d66-74e7-4878-85ed-08defd558f57
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:21:46.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGICOBBQzTxGTC7kFiFzGntAYlggmtByEcbSmnJNjz+XDb7++1mzH8wIPqw4jJ9FYUn6HjLw6GmvKGBlgmT1MDnL6aUke/Q5d32qyYsyM+76qRmypf10lNkZeuRQr8Dd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12624

On Tue, Aug 18, 2026 at 09:04:59AM +0000, Pankaj Gupta (OSS) wrote:
> > > > > --- a/drivers/firmware/imx/ele_common.c
> > > > > +++ b/drivers/firmware/imx/ele_common.c
> > > > > @@ -101,15 +101,15 @@ int se_val_cmd_addrs(struct se_if_device_ctx
> > > > > *dev_ctx, struct se_api_msg *msg,
> > > > >
> > > > >             addr = msg->data[f->lsb_idx];
> > > > >             if (f->has_msb)
> > > > >                     addr |= (u64)msg->data[f->msb_idx] << 32;
> > > > >
> > > > >             /* Zero marks an absent optional buffer. */
> > > > >             if (!addr)
> > > > >                     continue;
> > > > >
> > > > >             if (addr < base || addr >= end)
> > > > >                     return -EACCES;
> > > > >
> > > > >             /*
> > > > >              * When the message also carries this buffer's length,
> > > > > the
> > > > whole
> > > > >              * buffer [addr, addr + len) must fit inside the
> > > > > window, not
> > > > just
> > > >
> > > > [Severity: High]
> > > > Does this code prevent firmware from reading outside the shared
> > > > memory window when the command lacks an explicit buffer size?
> > > >
> > > > For commands like ELE_OEM_AUTH_CONTAINER_REQ that use
> > > > SE_CMD_ADDR_NO_SIZE with no buf_size, only the start address is
> > > > checked against the bounds. If a caller provides a start address at
> > > > the very end of the window (e.g., end - 1), could the firmware read
> > > > the payload out-of-bounds into adjacent physical memory?
> > >
> > > - Not a bug - by design.
> > > - The existing comment explicitly documents the rationale:
> > >    -- this is a read-only input buffer
> > >        --- (firmware copies the container header into its own internal memory
> > for authentication; no DMA write-back through this address).
> > >    -- A rogue caller can at most cause firmware to read within the shared-
> > memory window it already owns.
> > > - Output buffers must be fully bounded;
> > > - Input-only buffers are safe with addr-only checks.
> >
> > Why? at lease addr should include payload size?
> >
> > Frank
>
> Payload size is encoded inside the OEM Authentication Container itself.
> For ELE_OEM_AUTH_CONTAINER_REQ, the API only passes the start address of the container to firmware.
>
> The kernel cannot validate the full container size because determining the actual payload size requires parsing the container header, and that header is interpreted by firmware using information and keys that are not available outside the secure firmware.

please wrap you reply below 80/100 chars each line.

>
> Therefore, for this command, only the container start address is validated against the shared-memory region.
> The firmware then reads and processes the container contents as part of the authentication flow.
>
> Also note that this is a read-only input buffer.
> Firmware does not perform any write-back through this address.
> A malicious caller can only provide invalid input data for authentication,
> which would cause the authentication operation to fail.
> It does not provide a mechanism for arbitrary memory corruption or privilege escalation from the kernel side.
>
> The trust model for this command assumes that the firmware is responsible for validating and parsing the container format after receiving the start address. Since the container length is not available to the kernel, enforcing an addr + size check in the driver is not possible for this request type. Any bounds validation based on the authenticated container structure must therefore be performed by the firmware itself.

You can provide comments to explain situation.

Frank

>
> Regards
> Pankaj
>
> NXP Confidential
