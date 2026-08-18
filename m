Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE63905F0;
	Tue, 18 Aug 2026 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043908; cv=fail; b=f3gqrulMCbX6rNAR1GwZQfZUR6qjEsvs6zdzJa/6yIMTgDrwwBPa/9K+wTuRFJWhE6R5CmE1uqCkkG+TMQIn2Kf8AxuBw4GjD6xdIwxy9KCnE+xDdcoLnwF0XhEfoW0eaXZdpWty9aiGF7xRInrv/Zg6hZu3dTi3z4HsFaE+b+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043908; c=relaxed/simple;
	bh=OYJcuGHXaTH6bunsvdS1IBEm6+5Avs+sTWD8SFOP+e0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rTnjLTqwV17jF/dZK+zkCZHCWjs7uwD/fGrp9gu5b/Fjnu2uYjxsGK6vLG0ZKpGCWtDHHkLiSgGn5onCoMfnFOlyUEL/vE/2IA99fW4SE5JY0l9ZeLPHTEcqEEFGQI8Sw1vBXAZVAZdL4GFa5GKYyVokFMzmOwKfWVRRpBP4+B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iK85KdzU; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iK85KdzU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYGZtmBi3QEGNxNkvQWeI9qGx8jVjgNQxuAVe7w0LKB7TvnSa8Y0V3LuMzy0rfBxfDZpGY9VtEUMVybsKLua4Pa1p1bnzWQRDzdl107UmEbb9bKZgZpIpfVelsCx8vM72uID8qlQcVc0jAVQTUY4mR1n6M1jiRL9DekAVIMXOo5BnAeKQBVokQ3GFXbOzK7MwWBYqpGLoEdnypmW9WAjfDTPLP24tPR7zJdmCdC55anjwYpiCKfYcFDV8UrIeKlHhDqcluYQUdHn5wUZIiuuRriHll0n/QCSI+8avsB55Q94PqKsr9Gd0+vQCUiCAp96uWIJ8dB5E7KVBxALaxKNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/2ENFBJlbdX9JllqoRhMkmVZjqYS0zPskTSYzOssp8=;
 b=AvkQYgB4t8lak2SjLSZHEHXhBEde26cwXT763fGI0Xf4n2zGiDy6jmqjNnQGZ2fupCEEfAVKXnEMi7GmyBMzD9WlTcwfaozju5sZgJNYUlE9j6FKQ86tKRo2JIwOANS7deTe14VfTuBNi6AVG4PcVczFkzRA6HcqD83wOC0OFEGQE/LzJ2nkvTuyeRR9gc++TwGDm+1ndwVSfLDAibNAR4zI6y1wQ/EVI69UzQEfEBeZJo5n5vqG2Ap3Zk2l+nzt3a1aMdMdDMRG6OOtwtiuiFagbloIqA1of3TlGFGTe+IBK5XVpO1Tba/MPIBpj1HfQ8cMvxKOvVBrECe0l6izwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/2ENFBJlbdX9JllqoRhMkmVZjqYS0zPskTSYzOssp8=;
 b=iK85KdzUkymwGRAfE6MA1GezSgZTJw44r0XyyuSbyxYYxS5dYI3c+2UbCflGaV2dEObASOHEG4OvesLV1TZPT8qC4o8qWOBtTPzLnhNHkih5le5e9vG8DT8rVq7XfcCZZw7uO47K1hZPn87lyXebAYSmbDInF13kpHfHNv35+3rIEo/KlMBEibtjY11VBTzflcV/E720LFvI9AnVmA6/CO8rOItPKwwfeVaA9P8iyNXsi8DhJuFblRa507khQdw+j9vgQT8oWtvZeoRcCZaY7chbVTPLyJdqDAn3GckGiubM3WbJHzdpjUewzkqBUms2t5dTP3wuUrb6DQ0ZY4w/mg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 09:04:59 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 09:04:59 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Pankaj Gupta (OSS)"
	<pankaj.gupta@oss.nxp.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v36 5/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v36 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdLnKkzSxW1Pvp90KVhk6UdcSNG7aiiP6AgAAJh4CAAO1LQA==
Date: Tue, 18 Aug 2026 09:04:59 +0000
Message-ID:
 <GV2PR04MB122715C58E176CB3BAF1E77AF95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-5-45c42847bfd8@oss.nxp.com>
 <20260817084938.C2B541F00A3D@smtp.kernel.org>
 <GV2PR04MB12271867DDFC25782A7B688C595A72@GV2PR04MB12271.eurprd04.prod.outlook.com>
 <aoNU08NYpe1rK6Bz@SMW015318>
In-Reply-To: <aoNU08NYpe1rK6Bz@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-18T08:46:25.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|VI0PR04MB10854:EE_
x-ms-office365-filtering-correlation-id: 3337dde6-c29e-4446-7ddf-08defd07c7cf
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|10067099003|56012099006|6133799003|3023799007|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 rtzNN6fs4fx6N+viJ97dn3YU273P4+J+aOMmsFOXrk9RfsvETAL+SF+ietlC0Xu4TN/Hz1TkX3ea5tOBC1fspUej8iSYMlWQ/qCTuVsdUMGj4GYuD2K4gFUpeREXjNgrJOoll/vKXyfTF4g4ajOkiIz2Qr3HfZyKmYddy/Zao+QAjcvKFbgmT4H6bi18NqnnLzAcG43dmnQc/zzoCLjp0+40qgWBG9ng0IioUn+TE3B1gp2hCMKC+BpZ7p3vs94XIl6FdK+g6BDfRh0mDAduexLlQFAj2DFWDS+ZnbR9tCWx8lli/wREtwdV6a5M8EdE6jy9pkh8shaRZ9/lKqn3UDJ4P2lF7MlQLT6tYa/1jNEdOOWrSlbIktHScnXnn53lif4VlZlOP/C4QAT9UkbPndSh7bDWTkKed+FhmlTZGs/i9CTfNLKBtPSWpuMzqxs8hyrFv1ADuxtjlQYmWPBrfkWOo5rH3S+DTasXUXxG1utUNamBpYRpW9rQ0r2DiO2/DjYRAAXUvJ90q6HZFAlrDcVLuIT6Gov4p6ZnAagci8Frln1xH6Ha+fLmOEGJVhTZde31anxuDXVCpZ/AD0r9S5PxaAKm3rr8GoHjv1+Ck9j/BFPZgkme4iimIsrs1lKteeGAdUOqgOsbgLP/ZFr+PiywqJs+FntqMZsZE1pYVCza9Iz4hPUdI6e5hbc/Eg5Prrh+DDLNxVVSg8FJB8QDM/zYnANEqc2SGKfVaG+0wCo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hsYsmHeqYDoeexK1GC7M0NacQ7VqabKSWKb1RoSUXI2TilDRQOyWDcB8Zn38?=
 =?us-ascii?Q?u7pNP8TbThJcS7TzLluolMJA3t9mqG/G5bbcDqxqqZvmgCn0N0R83IzZzMIa?=
 =?us-ascii?Q?1a9ZsSLjCwwr6z0lQ9X88wHLBCKczj1cpTkV76DlQAJ+eHp21lcZjZcDdCh0?=
 =?us-ascii?Q?ljWsLCA+tPYZ9axcKay4O701p1VixuOqFkhU90eKulENKLNFtXG53w4jhTdP?=
 =?us-ascii?Q?4AOAEO9s09H49qy2s77ITC66MIjWikPr1BEab+nDxxlgemQsSw47fMsg8u82?=
 =?us-ascii?Q?tt/O/CDYB5Lf9lj6N8T+VXzuuhkR8So0jQAO7Tr5Uvfru7MZ6pUOaqKeixhr?=
 =?us-ascii?Q?Ri4SKq/LP7sXrlCf6PClSVh/JMnZRrlHLKbhmTs0GFtczWzIfb2ESEzFqXfF?=
 =?us-ascii?Q?dqyUozUBVfFjYqZgs38zxU/pxwh5howBMDen4sb1MSEOl47IZWjRRgCphwMf?=
 =?us-ascii?Q?AW/il35O84YgcMjsizYmtjUWCENLBUHmSuGpjXQUQ7iYMAnRUh0LOqhynNZ2?=
 =?us-ascii?Q?5zHrBqwgGyO3py/4CbXe/kqqe7nQGZxiKh4NbA8zjZ56uDYOEn0l5IZjxSYH?=
 =?us-ascii?Q?Zogwl/wxoczd+FPX3AKtVtIixL8+PUBQDmui0DRTMrqp8suM4tx3+3X6IiHk?=
 =?us-ascii?Q?+xs1Y8cR1vqk4Ex2v8LRfGYjgX+P1wOePl15U95AXsCxb3voWBy0i3M2ZpKm?=
 =?us-ascii?Q?0zFJYM0wTVO8zAMVXVGs3WrIBEBRAd/fT0jLbcpca/V0S+ObY8hJQgYy7+ya?=
 =?us-ascii?Q?lgTYjQpX2Fenz4IuDR1fZ96s272uAlG4fO6gx+h7FDomLhCtqo7yVX89YOgc?=
 =?us-ascii?Q?00NGHOH3oamwhxrputQwr7R4QYOrvmt8BIS/NtqQXlL3QNjFhr12FSZYCW1l?=
 =?us-ascii?Q?rSi5lD67CkkTIb84kXOPMcSpTmTe3aY3I3CbLGTP3BSKzTtQ3gN8DpRm9IIh?=
 =?us-ascii?Q?CouoFNeq/mLanMOJZLjb22NltzaQfXiGClfN88IqrmbDsR46ZFTDuXgwoFSZ?=
 =?us-ascii?Q?/5FsFN+dM/KnjraCJQUoN/uiOo+svbfpkxh2/tpVh7Bld3P0omvTuKZQButN?=
 =?us-ascii?Q?Lao7RGh30GU5++BpLf2LYdh64cso1k2BA9UM7W79nvfxmJuIgmKBfieTG310?=
 =?us-ascii?Q?a8VNIYlFgNaRSevmQdeGoMUReaz2W7oS7zBlrfzNiqp6aHgK67ra+LYKA4U+?=
 =?us-ascii?Q?viVAV/seF8QUJKHPnsB6CK/UemzDp864RZPWNgghxxWcHLaaRrighMa0kM5+?=
 =?us-ascii?Q?kXdBFwbitz8OrV/v+0JdvbPYOVDjeVrxUK3d30M+TaNk1xy7TtX88IVfrOpl?=
 =?us-ascii?Q?DG2WDa7Ov6XLoIhU+kA1vzArJlqXnibJyilJDa8TaBWOVatVDcfku9AdaJEs?=
 =?us-ascii?Q?8LgBBhdHI/zwWQ6bH0U+REDw0rJ1Yl6i+GYmzSWq8/KF3NxoyrruRV0MyPtY?=
 =?us-ascii?Q?EtDDTREYQt4cmnF+yipQM+Sk+YMoBbo+0/6Ftftc2Dx8XMhWsjNuspysCq48?=
 =?us-ascii?Q?nZScUwJ1aPYzTxRagcq0e4z33GaUJl9qp3s0tHTrUTt0hMSE4YdMXEcTp1j2?=
 =?us-ascii?Q?wjX1FzrybjnQUkdq7Tw+uhCShw3goTQH1MEqmR0KMvvPxG5BS+L/SXC1LLSe?=
 =?us-ascii?Q?KvYjFZntO2FsiuxYllaUNl1kxBud/48RzRZeYA3HDib60M1az/z/5hrzQU34?=
 =?us-ascii?Q?NKgY/CwgU0DnicExbLn5od6vtySgg2GAMkXyv7jP9oDXtSJ8lBlN70DrlNEa?=
 =?us-ascii?Q?9ZUS/zeznA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3337dde6-c29e-4446-7ddf-08defd07c7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 09:04:59.1774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXcJZyELj7I6Zy5rBp80d3bfLiAHWt10PJlGTzGR7XsouIUR0oSzb6k5CPYiTp/VA7zsk7lqGqVcHW1dz/Iv3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854

> > > > --- a/drivers/firmware/imx/ele_common.c
> > > > +++ b/drivers/firmware/imx/ele_common.c
> > > > @@ -101,15 +101,15 @@ int se_val_cmd_addrs(struct se_if_device_ctx
> > > > *dev_ctx, struct se_api_msg *msg,
> > > >
> > > >             addr =3D msg->data[f->lsb_idx];
> > > >             if (f->has_msb)
> > > >                     addr |=3D (u64)msg->data[f->msb_idx] << 32;
> > > >
> > > >             /* Zero marks an absent optional buffer. */
> > > >             if (!addr)
> > > >                     continue;
> > > >
> > > >             if (addr < base || addr >=3D end)
> > > >                     return -EACCES;
> > > >
> > > >             /*
> > > >              * When the message also carries this buffer's length,
> > > > the
> > > whole
> > > >              * buffer [addr, addr + len) must fit inside the
> > > > window, not
> > > just
> > >
> > > [Severity: High]
> > > Does this code prevent firmware from reading outside the shared
> > > memory window when the command lacks an explicit buffer size?
> > >
> > > For commands like ELE_OEM_AUTH_CONTAINER_REQ that use
> > > SE_CMD_ADDR_NO_SIZE with no buf_size, only the start address is
> > > checked against the bounds. If a caller provides a start address at
> > > the very end of the window (e.g., end - 1), could the firmware read
> > > the payload out-of-bounds into adjacent physical memory?
> >
> > - Not a bug - by design.
> > - The existing comment explicitly documents the rationale:
> >    -- this is a read-only input buffer
> >        --- (firmware copies the container header into its own internal =
memory
> for authentication; no DMA write-back through this address).
> >    -- A rogue caller can at most cause firmware to read within the shar=
ed-
> memory window it already owns.
> > - Output buffers must be fully bounded;
> > - Input-only buffers are safe with addr-only checks.
>
> Why? at lease addr should include payload size?
>
> Frank

Payload size is encoded inside the OEM Authentication Container itself.
For ELE_OEM_AUTH_CONTAINER_REQ, the API only passes the start address of th=
e container to firmware.

The kernel cannot validate the full container size because determining the =
actual payload size requires parsing the container header, and that header =
is interpreted by firmware using information and keys that are not availabl=
e outside the secure firmware.

Therefore, for this command, only the container start address is validated =
against the shared-memory region.
The firmware then reads and processes the container contents as part of the=
 authentication flow.

Also note that this is a read-only input buffer.
Firmware does not perform any write-back through this address.
A malicious caller can only provide invalid input data for authentication,
which would cause the authentication operation to fail.
It does not provide a mechanism for arbitrary memory corruption or privileg=
e escalation from the kernel side.

The trust model for this command assumes that the firmware is responsible f=
or validating and parsing the container format after receiving the start ad=
dress. Since the container length is not available to the kernel, enforcing=
 an addr + size check in the driver is not possible for this request type. =
Any bounds validation based on the authenticated container structure must t=
herefore be performed by the firmware itself.

Regards
Pankaj

NXP Confidential
