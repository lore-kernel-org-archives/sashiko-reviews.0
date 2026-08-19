Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6EF44A724;
	Wed, 19 Aug 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140173; cv=fail; b=Wkc58NLSFTbwIvA7nWxPZarRLJ8UYLOm5cSn5CuWsne/+9fLVkekmYgpNPczmg7i3sEhSG0aoxvY+bFCu4gt/6IvzkDle3GdqPKIIsomVCiNgx8ds5mgmv5LpXfeg0bQs29aIhLiR2AlDJgDwcMUe2pd5XwsYKtebbNTRYF8v+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140173; c=relaxed/simple;
	bh=YZHyNRpys9vBxlwo/VY4EfB6o7q+oEv3ib8Sz0gYHnw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EIxdHO5ZqRQGqlIt0qd5QyUanG/saEiYtNkYciKvu0sdTt1c5yEyo1mTq5PjjF9gPjXnrE4wzHIshaJpaGaDpzwx6dkOhnMdNUTlUj89u/bcmIYOj9C2Ch49Y4LHYXAtWiNyfblnIaACQzbZq1MVUbLfNPzWS8KbqUe+Ae4g00w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mRimYMMf; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mRimYMMf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHUsSDbTayPK10LgazZH5Sy53bZ9CDGpMCjNmJl+C4vB9m5WDK3ocENbWDePPA0A9C1a7INUwHGJhlFGGO0L7Z8nRTczKHP4JxHx9viqXPkKCvPtXb2Prx5DqwYgrjF3vt4yuRtl9D+DXuN6WbWOWraZa1SiNXeaJ9VKgziZKXMXpSrWOBsfYU4xaCfZeZcQgTVYvY57vP/iCZsfx7hUUQ3E/YJ8Mak/8TlGiNFEJXVeh952+QbElQSB8P63mzBJhXN9eUcpvqy1JxwStWR0M/Vj//bT5A+ccP/44K4Y/6GV+ss0qdJPbKld/tMM8jxVLLR8Wpu+Zr+q3FvKJ+kP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/x8OZ+FuCHoOh+vUpXRILbCWgI7xKvpxOv0q+bbQyM=;
 b=Xafql9fl5o80XfOyWiyZxPQHdXlqV5a8IQJr/9du8WMx1T6OaZOOSf2yVsgZ16Rb4WjqLfzIaqjVx8dubcxHx7c8EjfblvwoqYMygtUYNompFpttH+jOMa42MWYHJwsULYRGpnxaMrwbJV+hgQ2PYL6vPg5ZYpxvJGO8DDqylYjwlvVYR3B9JQKUuLtKMUd962d///8Zl6rrk+q0eB4dJoExx6H58Fdb+n8daAwjaw48R9OLxolSfZcolx9DoXmheRSkppB9jSJZeQyR+M7soveqTMYG5LGUMi48cC2MFXSf30j3RfyYCc+X0811F3WGLCt5ZCr6XkewXhakMw0S5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/x8OZ+FuCHoOh+vUpXRILbCWgI7xKvpxOv0q+bbQyM=;
 b=mRimYMMfwG7yYrFJ+oJQ3N2hb4P5rFNxDLmL7u5epgYHog6oh6vGA/lou9FT+mB1pXu68ymsgK7nAYnONvEghDvtbHWqjY4s3sXgzubVDC5JlSCEM3qnq2OvE7wN5Rt7g1uUKSaWSVgtsbVn8smzN0b/sXfRCxvrC70H08XT8BeWhKIl0eztWYA92DKU4BrYzpny/pg3ydAXB93EcoY34pOsLCc6RWnVuw95dIRuNacwiXUP4aAUzb/+Yy3TnG+an4MqHS0HWaFw2z3rvM2SRnXQdW3Zh5e4JbU0NZ00dWer9PRPjByfAjidBMT0vaRJMqmIYRtpwsI1AFlapabPEg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 11:49:23 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 11:49:23 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v37 5/7] firmware: imx: adds miscdev
Thread-Topic: [EXT] Re: [PATCH v37 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdL6PVONFoLZ2DZk2svzv1aAY9Sbak+aQA
Date: Wed, 19 Aug 2026 11:49:23 +0000
Message-ID:
 <GV2PR04MB122719EFBA06616A1CFEA19C295A52@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
 <20260819-imx-se-if-v37-5-5ef5de9ff1dc@nxp.com>
 <20260819062729.129E21F000E9@smtp.kernel.org>
In-Reply-To: <20260819062729.129E21F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-19T07:29:25.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|PAXPR04MB8366:EE_
x-ms-office365-filtering-correlation-id: 0f49c47b-e577-4ed3-d066-08defde7e9dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|38070700021|6133799003|3023799007|4133799003|56012099006|10067099003|11063799006|4143699003|5023799004|18002099003|22082099003;
x-microsoft-antispam-message-info:
 OUxfiyhtsL4rTIrXiAPwucJMhHSmXV1BXIlzsdOvPlJHyaosApFRDOMQAUGqfSNXCnP8sPfSyMjOVI2Bjt2aFBNW6p2a/pfrkfR2jVk2GeGWokd4/dCxKc8c5bvS2CA82YoA8fWCA0TLYb4kQcDnJXnfIfYgHfYh3iQbQzjUCG8Wz8q7RlEq+d0RSutR6hOPzJr8Rg4HycKseZQen1McrtWOW4kAcB8hrbvyIUhrDKtSlelcsPiO0IjW+/HQdr10DOvhb16t0YgbfY+ihpwqabX5abNmmEN8P/Ri7imaPa2i60cCElCcsjgL1flku3yXkPilC9UaIss1ckMkAbpmuugoji5VKuSsKP9dYXOsCpEU2uk3PsmgEk5+6ql98cawXUytYDtjJK+f+9+U76W09RVhcMHKJ37X6tViBvzgUoNlav7BnHyfeSgFVvBTbtAHB6ClGa7/S6eB3AXtoHYpV/e8JcA99emP4RM29UG9Fsoz0R19j4R6PThu7PhySGuxjPC/HEksA6xhhTZ/zTE0aVejNMRVOwY9aprEFodMTu5tEQ8D188ZGI7hb0/gV9B7Sb4p/qe2I/5XkJoqjCYkXkN47Fhvs6cBntO7apNgShuWq5iphFm+130pSS8t8VJb2orOJ6ByWsFs7MCNJq17hvDaxndhYcKUnJ4TjG1wVoU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(38070700021)(6133799003)(3023799007)(4133799003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CC4wHSPpgr526gvSZWZhLdeFxEdJaJwgPgGFyoZ/aUbd7RGvzIG9C2ZW684J?=
 =?us-ascii?Q?9s9y8kQbLNEXf7UgqKCpjEc2HoXbOLDtY6Xvytlg/VvEZOdcO+kxIa73o/Zo?=
 =?us-ascii?Q?OgWpaIVLf/Bo6/LPsmTfQUrxqHpCSVrTDMTofwNVHGTcV1fs8Dx40ot2Cv7X?=
 =?us-ascii?Q?TuQqQtr7bkKlCG4QQ4qTUg8bN87D/7mWNoSOnTlACWF3NVH7AkrS2lbyJLx7?=
 =?us-ascii?Q?CALq5zz8Iyn3fi2eRoe1bdkc0+eMF2u13HEU3kdSv8vtuIYp6Js9cFwjHP1K?=
 =?us-ascii?Q?nySWsoQOMxVPjW1mf1WfOfE+i6MXnywgd9Kou6RWT4B97peY5OMNORTksaU9?=
 =?us-ascii?Q?B01/T+FUjgR21aMZm5OB8EVOhdGKS2/CUHt1/4QzugVm5mcedzIQG43j35UI?=
 =?us-ascii?Q?DUydhFHrkakxRj7E7FPqkT4AeDCgPf0ILLZ7be2nbqsy3d3rFe4AHeszz0by?=
 =?us-ascii?Q?nxzC8VZNc1Ol08VK/gg4HkXtMS8QsyiKvwZAksuPobcqKfzb2Xb9oQ6T0lIQ?=
 =?us-ascii?Q?ZniXDyu3aQQ0MD6alFtboaHosE/MgVAbCfXVoXuvNY7F0VoLHIiCwReTcmaS?=
 =?us-ascii?Q?/b/tDzcIXW/NiIgz84o2qX45Fo2V0VWoDJBG41HGsQ5l3VIQu2CJut9L/uxF?=
 =?us-ascii?Q?M8nF+0esum7pAx1MMnKIDsY4ivBuOBV0aigapMGq8d4lNUzbUsWISX3QkIRZ?=
 =?us-ascii?Q?K4hH47JSULxH7TXj2nNgsYf4QrH75laNe3r9IVLU4lmMac72L7IxdgKKkt/n?=
 =?us-ascii?Q?3veTnF4ni6i73N/4sBP4KDuEYCvQd/x+epX41tUNM4CLQbxLkEyKBkmRanxP?=
 =?us-ascii?Q?QnWmlGQ0mAypoem4x18IAbNdk1CxO7OVlX/9QudmSRmX09mKBpKynCRF5E8G?=
 =?us-ascii?Q?pJEnI6l3op9jSwkl4Q6x+0gY43fmlNOZ/5GRiEW1dqk11+ItuZlxd4Wzqlnh?=
 =?us-ascii?Q?PclrnIqZ3x6mXedbVl0Yt7VSAHRuLqRrE+dYweqU6F2Emf1QnEzfXbEanjnt?=
 =?us-ascii?Q?dkMYKUNHUIR6LYkBDJsP4OTnmLWklgL8+kKwyQEDM2iRgbDxGlz6qQ+axia/?=
 =?us-ascii?Q?g93SghJuvpQl7vglAa5Ue7kq2w4nICZdiCElP1BJHNCFJ9byp5M7TFXpN9WY?=
 =?us-ascii?Q?xPzdLsBwNJ6L/GPjszfQV0jTkN4skaU1q/5CvGwL3MpfzTO31NIoowzr19pN?=
 =?us-ascii?Q?495ih59NwES/DUtbHh7UB3uNtjuKi1dbpeR1yhmOl4jvLCsYkM7balHlc/S0?=
 =?us-ascii?Q?jpaMHRX8zRsqYipG9gdZHXsNJw9omZmQgWzev5MCKmr3lT8kS0Amw6Uon7Df?=
 =?us-ascii?Q?fK/f0AuGU2cNf0NnH6SJLHzIewdtCyhS6om17ZpDkb8/AA244O4H9QY2NJDT?=
 =?us-ascii?Q?cca3OdBktjFsxeEG5eL9CdBiWKMMauci15MdesoyIodvthZ7ct08Nl0WdKts?=
 =?us-ascii?Q?mFNqiCAfvVp3udZcziDGlvlXqLSXYVjfNT9I1pIHDs6TsdJncD2TrMRcVZ2W?=
 =?us-ascii?Q?mqbLPA8n5niamHgWqWoeBsMlFKgwYC6of2dPexG7P4QCgR6rb1o/jg6ee1S7?=
 =?us-ascii?Q?fuITbrpyc1NYTIomQUb49CRMAPTegY2DB0Dgcdb8d9DaIUsP6/kujbBTa5VB?=
 =?us-ascii?Q?A1U2jnyiio1aQO66ssM6I+4yC4TVxYRF1SUjK3RI+d3QZ7O0P6VaWyiS8NYb?=
 =?us-ascii?Q?U+UbAETublFI/9seuB5DXfE/wyi5hkKN6j2/lkztaaGPCEPg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f49c47b-e577-4ed3-d066-08defde7e9dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 11:49:23.5900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXdpY4M2Kw4XFjuo9qyAwWloYdxUQrTjcXU0MQA9DWhzTK9E4Wx7Lg2W0BKr86VpCxlpsOb7rzGpNDlnQQ+1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366

> > @@ -110,6 +110,9 @@ int se_val_cmd_addrs(struct se_if_device_ctx
> *dev_ctx, struct se_api_msg *msg,
> >               /* Zero marks an absent optional buffer. */
> >               if (!addr)
> >                       continue;
> >
> >               if (addr < base || addr >=3D end)
> >                       return -EACCES;
> >
> >               /*
> >                * When the message also carries this buffer's length,
> > the whole
>
> [Severity: High]
> Does this validation allow out-of-bounds DMA reads? For input-only buffer=
s like
> ELE_OEM_AUTH_CONTAINER_REQ in ele_common.c, the size_idx is set to
> SE_CMD_ADDR_NO_SIZE and buf_size to 0. This bypasses the end-boundary
> check entirely. Could an attacker place the start address near the end of=
 the
> shared memory window and provide a large embedded length in the payload,
> forcing the firmware to read past the DMA window into adjacent physical
> memory?
>
> >                * buffer [addr, addr + len) must fit inside the window, =
not just
> >                * its start. addr is already >=3D base and < end here, s=
o end - addr
> >                * is a positive value and the comparison cannot overflow=
.
> >                */
>
Not a bug.
The existing comment in ele_msg_addr_field.c explicitly documents the ratio=
nale for the message ELE_OEM_AUTH_CONTAINER_REQ.
- The firmware reads the container.
- Any accidental over-read would occur within firmware's own address space.
- The over-read contents are not returned to the caller.
- The caller has no visibility into firmware internal memory.
- The firmware does not write back through the supplied address.
Therefore, there is no obvious confidentiality or integrity impact visible =
to the attacker.

> [ ... ]
>
> > @@ -133,6 +133,6 @@ int se_val_cmd_addrs(struct se_if_device_ctx
> *dev_ctx, struct se_api_msg *msg,
> >               } else if (f->buf_size) {
> >                       /* buf_size: literal byte count
> >                        *           (FW-defined constant or saved at run=
time).
> >                        */
> >                       if ((u64)f->buf_size > end - addr)
> >                               return -EACCES;
> >               }
>
> [Severity: High]
> Could this be bypassed if buf_size is dynamically set to zero? If a malic=
ious
> command receiver provides a small size to se_if_fops_read() in se_ctrl.c,=
 the
> message could be truncated, leaving rx_msg_snap zero-padded.
> fw_api_specific_ops() would then read data[1] as 0 and pass it to
> ele_set_sz_in_field_addr(), setting buf_size to 0. This would bypass the =
end-
> bound check entirely in se_val_cmd_addrs(), potentially allowing out-of-b=
ounds
> DMA.
>
> >       }
> >
> >       return 0;
> >  }

Accepted. Will fix this in v38.

>

> [ ... ]
>
> > @@ -230,8 +230,8 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
> struct se_clbk_handle *se_clbk
> >                       if (time_after_eq(now, deadline_jiffies)) {
> >                               /* Deadline hit: fence hung FW, like the =
ret=3D=3D0 path. */
> >                               spin_lock_irqsave(&se_clbk_hdl->clbk_rx_l=
ock, flags);
> >                               se_clbk_hdl->rx_msg =3D NULL;
> >                               if (!completion_done(&se_clbk_hdl->done))
> >                                       se_mark_fw_busy(dev_ctx);
> >
> > spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>
> [Severity: High]
> Is it possible for this path to suffer from the same DMA-after-free regre=
ssion that
> was fixed in the signal interruption path? The time_after_eq deadline hit=
 path
> and the ret =3D=3D 0 timeout path in ele_msg_rcv() still use
> completion_done() instead of checking rx_delivered. If a timeout races wi=
th
> teardown, could the circuit breaker fail to arm, causing the DMA buffer t=
o be
> freed while firmware is still writing to it?
>
> >                               ret =3D -ETIMEDOUT;
> >                               break;
> >                       }
>
Accepted. Will be fixed v38.

> > diff --git a/drivers/firmware/imx/ele_fw_api.c
> > b/drivers/firmware/imx/ele_fw_api.c
> > new file mode 100644
> > index 0000000000000..0c4c6f7de0205
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_fw_api.c
> > @@ -0,0 +1,361 @@
>
> [ ... ]
>
> > +static int se_cmd_receiver_allowed_cmd(struct se_if_device_ctx *dev_ct=
x,
> > +                                    struct se_api_msg *msg, u32
> > +tx_msg_sz) {
> > +     u8 cmd =3D msg->header.command;
> > +
> > +     switch (cmd) {
> > +     case ELE_SESSION_CLOSE_REQ:
> > +     case ELE_STORAGE_CLOSE_REQ:
> > +             return 0;
>
> [Severity: High]
> Does this allow the command receiver to bypass strict session ownership c=
hecks?
> By returning 0 unconditionally for ELE_SESSION_CLOSE_REQ and
> ELE_STORAGE_CLOSE_REQ in se_cmd_receiver_allowed_cmd(), it seems a
> malicious command receiver could spoof handles and close arbitrary sessio=
ns
> belonging to other processes.

Not an issue.
Ownership enforced by design: Only the registered cmd_receiver gets NVM cal=
lbacks;
handle values come from FW responses already in `dev_ctx`.

>
> [ ... ]
>
> > +     case ELE_STORAGE_OPEN_REQ:
> > +             /* Might be cleared as part of tear down. */
> > +             if (dev_ctx->strg_hdl) {
> > +                     ret =3D -EEXIST;
> > +                     break;
> > +             }
> > +             /*
> > +              * Reject the storage-open request when another context i=
s
> > +              * already registered as the command receiver. If we let =
the
> > +              * command through, FW would allocate a new storage handl=
e and
> > +              * start sending NVM callbacks for it; those callbacks wo=
uld be
> > +              * routed to the existing receiver (process A), not to th=
e
> > +              * caller (process B). This would let process A observe a=
nd
> > +              * tamper with process B's NVM traffic. Reject early, bef=
ore
> > +              * the command reaches FW, so no handle is allocated and =
the
> > +              * state stays consistent.
> > +              */
> > +             scoped_guard(mutex, &priv->modify_lock)
> > +                     if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> > +                         priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_=
ctx)
> > +                             ret =3D -EBUSY;
>
> [Severity: High]
> Is there a race condition here since modify_lock is dropped before the co=
mmand
> is sent to firmware? Could another process hijack the command receiver sl=
ot via
> SE_IOCTL_ENABLE_CMD_RCV during this window, causing the NVM traffic for
> this storage session to be routed to the attacker instead?

Accepted. Will fix it in v38.
Will rename the purpose SE_IOCTL_ENABLE_CMD_RCV to
SE_IOCTL_ENABLE_CMD_RCV_STATUS.
This ioctl will not enable the command receiver. It will return the status =
of
enablement done as part of successful response to ELE_STORAGE_OPEN_REQ.


>
> > +     case ELE_STORAGE_OPEN_REQ: {
> > +             int rc =3D 0;
> > +
> > +             /*
> > +              * Record the storage handle before registering as comman=
d
> > +              * receiver. FW has already allocated the handle; if we a=
ssigned
> > +              * it only after a successful registration, a failing
> > +              * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would =
leave
> > +              * strg_hdl at 0 while the ioctl still returns success to
> > +              * userspace. The kernel would then never close the handl=
e on
> > +              * teardown, leaking it in FW. Storing it first guarantee=
s
> > +              * cleanup_dev_ctx() closes it regardless of registration=
.
> > +              */
> > +             dev_ctx->strg_hdl =3D rx_msg->data[1];
> > +
> > +             rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
> > +             if (rc)
> > +                     dev_err(priv->dev,
> > +                             "Failed to register %s as CMD-Receiver: %=
d\n",
> > +                             dev_ctx->devname, rc);
>
> [Severity: High]
> If set_dev_ctx_as_command_receiver() fails and returns -EBUSY, the error =
is
> logged but execution continues in fw_api_specific_ops(). Could this leave=
 the
> storage handle assigned to the caller while the actual NVM traffic gets r=
outed to
> an attacker who won the race to become the command receiver?
>
> > +             break;
> > +     }
>
Not an issue, once ioctl SE_IOCTL_ENABLE_CMD_RCV is re-purposed to SE_IOCTL=
_ENABLE_CMD_RCV_STATUS.
Function fw_api_specific_ops() now stores `strg_hdl` before calling functio=
n set_dev_ctx_as_command_receiver(),
so function cleanup_dev_ctx() can always close the handle in FW even if reg=
istration fails.
A `dev_err` log is emitted on failure.
Despite failure in executing function set_dev_ctx_as_command_receiver(), th=
e successful response to Userspace is correct.
As Userspace must fetch the status via ioctl `SE_IOCTL_ENABLE_CMD_RCV_STATU=
S`, to know the enablement status of the
command receiver.

 > > diff --git a/drivers/firmware/imx/ele_msg_addr_field.c
> > b/drivers/firmware/imx/ele_msg_addr_field.c
> > new file mode 100644
> > index 0000000000000..1da6583b6c312
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> > @@ -0,0 +1,654 @@
>
> [ ... ]
>
> > +void ele_set_sz_in_field_addr(u8 cmd, u32 size) {
> > +     switch (cmd) {
> > +     case ELE_STORAGE_MASTER_EXPORT_REQ:
> > +             ele_storage_master_export_addr_fields[0].buf_size =3D siz=
e;
> > +             break;
>
> [Severity: High]
> Is it safe to mutate the buf_size of a global static array here? If multi=
ple sessions
> or devices handle concurrent export commands, could this create a data ra=
ce in
> ele_set_sz_in_field_addr() where one operation overwrites the expected bu=
ffer
> size of another, potentially leading to out-of-bounds DMA?
>
> > +     case ELE_STORAGE_CHUNK_EXPORT_REQ:
> > +             ele_storage_chunk_export_addr_fields[0].buf_size =3D size=
;
> > +             break;
> > +     }
> > +}
>
Not an issue.
FW sends these commands.
FW is sequential (FIFO); `se_if_cmd_lock` held by `ele_msg_send_rcv()` ensu=
res only one export is ever in-flight.
No concurrent writer possible.

> [ ... ]
>
> > diff --git a/drivers/firmware/imx/se_ctrl.c
> > b/drivers/firmware/imx/se_ctrl.c index a8974eef190b6..56a4e53be37b8
> > 100644
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
>
> [ ... ]
>
> > +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx) {
> > +     struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D &dev_ctx-
> >se_shared_mem_mgmt;
> > +     struct se_if_priv *priv =3D dev_ctx->priv;
> > +
> > +     INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
> > +     INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
> > +
> > +     if (priv->mem_pool)
> > +             INIT_LIST_HEAD(&se_shared_mem_mgmt->mem_pool_buf_list);
> > +
> > +     se_shared_mem_mgmt->non_secure_mem.ptr =3D
> > +                     dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_U=
SER,
> > +                                        &se_shared_mem_mgmt->non_secur=
e_mem.dma_addr,
> > +                                        GFP_KERNEL);
>
> [Severity: High]
> Does this unconditionally allocate 128KB of contiguous DMA memory every
> time a user opens the device? Without tracking total allocations or limit=
ing the
> number of open file descriptors in se_if_fops_open(), could a malicious u=
ser
> open the device in a loop and quickly exhaust the CMA/DMA memory pools,
> causing a system-wide denial of service?
>
> > +     if (!se_shared_mem_mgmt->non_secure_mem.ptr)
> > +             return -ENOMEM;
>
Not an issue.
`dma_alloc_coherent()` returns NULL on exhaustion; open fails gracefully.
Kernel fd limits and OOM killer provide adequate protection.

> [ ... ]
>
> > @@ -540,6 +540,6 @@ void se_if_rx_callback(...)
> >               se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz,
> MAX_NVM_MSG_LEN);
> >               devname =3D se_clbk_hdl->dev_ctx->devname;
> >               memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> >               complete(&se_clbk_hdl->done);
> >               spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags)=
;
> >               if (sz_mismatch)
> >                       dev_err(dev,
> >                               "%s: CMD-RCVER NVM: hdr(0x%x) with differ=
ent
> sz(%d !=3D %d).\n",
> >                               devname, *(u32 *)header,
>
> [Severity: High]
> Is it safe to dereference devname after releasing the clbk_rx_lock? Since
> complete() is called before the lock is dropped in se_if_rx_callback(), c=
ould a user
> process wake up, close the file descriptor, and free dev_ctx and its devn=
ame
> before dev_err() is executed, resulting in a use-after-free?
> This also appears to happen in the rsp_tag path below.
>
> >                               (header->size << 2), rx_msg_sz);
> >       } else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
>
Accepted, will be fixed in v38.

> [ ... ]
>
> > +static void se_clear_fw_busy(struct se_if_priv *priv) {
> > +     struct se_if_device_ctx *dev_ctx =3D NULL;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&priv->fw_busy_lock, flags);
> > +     dev_ctx =3D priv->fw_busy_dev_ctx;
> > +     priv->fw_busy_dev_ctx =3D NULL;
> > +     atomic_set(&priv->fw_busy, 0);
> > +     spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
> > +
> > +     if (!dev_ctx)
> > +             return;
>
> [ ... ]
>
> > +     scoped_guard(mutex, &dev_ctx->fops_lock) {
> > +             if (atomic_read(&priv->going_away)) {
> > +                     /*
> > +                      * Fatal, but deliberately non-panic: the enclave=
 is
> > +                      * unresponsive at unbind with a transaction stil=
l in
> > +                      * flight. Both the coherent staging buffer and a=
ny
> > +                      * gen_pool buffers this context owns are abandon=
ed
> > +                      * (host descriptors freed, DMA-visible memory le=
aked)
> > +                      * to avoid a DMA-after-free while the enclave ma=
y still
> > +                      * be writing. Emit one headline error here rathe=
r than
> > +                      * per-buffer so the count of faulted contexts is=
 clear.
> > +                      * Do not use WARN/BUG: this path is recoverable =
and
> > +                      * panic_on_warn kernels must not be brought down=
 by it.
> > +                      */
> > +                     dev_err(priv->dev,
> > +                             "%s: FATAL: enclave stuck at unbind, DMA =
leaked.\n",
> > +                             dev_ctx->devname);
> > +                     cleanup_se_shared_mem(dev_ctx, false);
> > +             } else if (dev_ctx->cleanup_done) {
> > +                     cleanup_se_shared_mem(dev_ctx, true);
> > +             }
> > +     }
>
> [Severity: High]
> Could this permanently leak the 128KB shared memory slot for priv_dev_ctx=
 if a
> firmware timeout occurs? Since priv_dev_ctx->cleanup_done is false until
> module unload, se_clear_fw_busy() skips the cleanup pass when a late resp=
onse
> arrives. Because se_dev_ctx_shared_mem_cleanup() won't reset pos while th=
e
> context is marked busy, the allocation is never reclaimed.
Accepted will fix in v38.
When `!going_away` and `!cleanup_done`, `fw_busy` has already been atomical=
ly cleared at the top of `se_clear_fw_busy()`,
so `se_dev_ctx_shared_mem_cleanup()` can safely run.
The fix is to call it unconditionally in the non-teardown path:

>
> > +
> > +     kref_put(&dev_ctx->refcount, se_if_dev_ctx_release); }
>
> [ ... ]
>
> > +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size=
_t size,
> > +                            loff_t *ppos) {
> > +     struct se_if_device_ctx *dev_ctx =3D fp->private_data;
> > +     u8 rx_msg_snap[MAX_NVM_MSG_LEN] =3D {};
>
> [ ... ]
>
> > +             /* We may need to copy the output data to user before
> > +              * delivering the completion message.
> > +              */
> > +             err =3D se_dev_ctx_cpy_out_data(dev_ctx);
> > +             if (err < 0) {
> > +                     se_dev_ctx_shared_mem_cleanup(dev_ctx);
> > +                     mutex_unlock(&dev_ctx->fops_lock);
> > +                     return err;
> > +             }
> > +             /* Copy data from the buffer using the snapshot taken und=
er the lock.
> */
> > +             print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4=
,
> > +                                  rx_msg_snap, copy_len, false);
> > +
> > +             fw_api_specific_ops(dev_ctx, (struct se_api_msg *)rx_msg_=
snap);
> > +             err =3D copy_len;
>
> [Severity: Medium]
> Can this lead to a self-deadlock? se_if_fops_read() holds priv->modify_lo=
ck
> when it calls fw_api_specific_ops(). If the firmware sends a command like
> ELE_STORAGE_OPEN_REQ or ELE_STORAGE_CLOSE_REQ, fw_api_specific_ops()
> will attempt to re-acquire priv->modify_lock either directly or via
> set_dev_ctx_as_command_receiver(), causing a deadlock.
>
> > +             if (copy_to_user(buf, rx_msg_snap, copy_len))
> > +                     err =3D -EFAULT;
> > +
> > +             se_dev_ctx_shared_mem_cleanup(dev_ctx);
> > +             mutex_unlock(&dev_ctx->fops_lock);
> > +     }
> > +
> > +     return err;
> > +}
>
func se_if_fops_read() is called by command receiver only.
But fw_api_specific_ops(), is called by both the functions se_if_fops_read(=
) &
se_ioctl_cmd_snd_rcv_rsp_handler().
Fix this by splitting the function fw_api_specific_ops() to create cmd_rece=
iver_specific_ops()
Which check do thing if command id matches ELE_STORAGE_MASTER_EXPORT_REQ or
ELE_STORAGE_CHUNK_EXPORT_REQ.



> --
> Sashiko AI
> review * https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2F
> sashiko.dev%2F%23%2Fpatchset%2F20260819-imx-se-if-v37-0-
> 5ef5de9ff1dc%40nxp.com%3Fpart%3D5&data=3D05%7C02%7Cpankaj.gupta%40
> nxp.com%7C96eee7ca659c40ee378808defdbaf292%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C639227176597863159%7CUnknown%7CTWF
> pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D7UAS819b
> %2BvXWVh2QYDJQnMXp%2BROfVbi2OWTbrrsqYco%3D&reserved=3D0

NXP Confidential
