Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEB21A317D;
	Tue, 19 May 2026 03:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161390; cv=fail; b=gCMxay7ggF76K9Jgw/HBGgIGZs6l1vLGMRg8xE98NIO0ICMC3HwIoFM3am0UP1v176tNWSI3Ok+Wml4GWHjUXC6+0DzRS4khfMzCtUKz8J8c4+BcjBMKQv1DMZ9K4C9FZQqjEKr6WoERCjPORjBh4f43jvZEmNOnR/lGsq4jpdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161390; c=relaxed/simple;
	bh=z4lgW7t4viYFGoOGMvZ0bhmlUysvpVWT9uPm578//f0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8Fkkp54cu7v8vdQJeZWbwub27vQ3G2R4P0pUYZbemhyAEes8BbnEeUenYwFqKg/Lk0AietWBpx5kQD0zxnsF74coln2Rby+gn7BBCeTo0MufpmbOvjVOl48wNzkjDmsHP562hVEebxfFShAC50AAA6HwLfVi4bwKXw39nZUa+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fIFyup1G; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fIFyup1G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTxTL4sdeDCfDs72/hITVV9KBtU/YQKIxTEta7Cz5ya43Y/GKl60ai3FBg5snbtOmuQBUhMbwaU/3arHDbO0PegapnQVdyDwxI4YfBgAbWdgLdlg5g2JA9abwJOHdC/mtyNEitKRrKVKFluuKXNrUBbdeZflMEFnwwMr1uA7WjRB90af0kKVFa851SPYGPmyJL0Ze+YDVVSs939trDr3iyoYxCnFnN1WfEwix0vTBuDlrronUuL/cBDuuPBrxqoBEiyh6S4vRg9ke2PHkOJDyyMF3zGDg+Rv8t982XQs2pXT54o2lvoRIply8wcEbnX90pv3k4PbmD26GAU9XKrfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bWxCRpUmUPasYvdXmqeEEY2nGrwsQvD1UINnVeg9kI=;
 b=uIG67WvFT71bah7Waw+0VpUlJSVsovh8Ge7jCDP87wEuXn8gtmELXwGP551ugvVA5rsFSVcnZ0ssaNSMRcTLID6U4mS45+tw4ZCztvdKQOUqZgZ6VHDXgpr267JjVnu7qsparVOud6hJDrU+vc1rURNrdE5zv0A+vMT7iacvru+KhIF3aJpuX0dr7AT3K+9xoIyOxXR/cMBJJ/2ErH+mgcG49xBRmhdzU7WixM/5fjsSSIbbWd5k3fi+rkEMl+ghAi+BNjGi9uyu6fYI7MWKOAIdCMHCgrL4RvsETvBiUmvNC0E4/oYhdzqQmm3Ozz17ZaVDQygYFO7tmYpUNwCyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bWxCRpUmUPasYvdXmqeEEY2nGrwsQvD1UINnVeg9kI=;
 b=fIFyup1GPeOkdV03xo5uyxIV5juEF42X8haEwFlbAakHA1TgksdXJO9geLKBWQeQtYU2+L8yFRjUr+NTBz/3F0KfY8G2ZJQNckJISo+ZdZfPxyfy+9D3Sww+I1cajJ9T4Ywb7spLWnkuxXL4ZDjSvsauc0SVT3SKS20KKjViRecl0tkrNOp7XjyOHrDuNRNXRhzKe8WBreoGnnqhiArunhDAcvfduwhUkdevhXp3eoTl7VZlHutQ2OVoQh/LUVFxRzexZm8dNbir1aSAbYCgMG+Qwea8Uegc87L0F+tYpTdz6wWhaAm9EEHoRVzXwBjFgAXy7IposyaZozcgGpGDQQ==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 03:29:44 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 03:29:44 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v2 net 6/9] net: enetc: fix DMA write to freed memory in
 enetc_msg_free_mbx()
Thread-Topic: [PATCH v2 net 6/9] net: enetc: fix DMA write to freed memory in
 enetc_msg_free_mbx()
Thread-Index: AQHc5nLkR7ztlu/ZUES1GoacGXsUa7YUq3IAgAAGA4A=
Date: Tue, 19 May 2026 03:29:44 +0000
Message-ID:
 <DBBPR04MB750031213CC74766AD9277FE88002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518030535.1057228-7-wei.fang@nxp.com>
 <20260519030414.A81F5C2BCB7@smtp.kernel.org>
In-Reply-To: <20260519030414.A81F5C2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|DBBPR04MB7804:EE_
x-ms-office365-filtering-correlation-id: 265e0bcf-8039-426f-e049-08deb556df21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|38070700021|11063799003|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 1f+K+1UANxYiPN2lQstskqAp3371Fw8Ty4zwEMF9G5AcZQHNT2MLqKRXjZa+Jej3zuFaBZWsV8hBlj8v+uFx5DA5yu489/uXfGOJIdglga7glVCnSAwGrPl8lGc/ajb9Q3YclCnp9lzqhUbw6sezKtZEsUCpX/gGaJvs+Fip9XM1n50dULtROz9YQM31w9l37y+iUCDuQ8MyQF36UI4SMwLKS3mYZqNJslKSS/GNIaBpgCTBB7mXiYzcu5LtYv3R0CvUdYzQiKZ/SHy1DrUfEm3Csz0uqaPtANGrjWBZA49ww3JTi78M/4P0u8syIEj5vMJw0muK5R+ShiHoDFtGG1u6GMxMa936PBVZsUZcmpxvKjrPmfeR3slmhLZQzaNqk6452k0KjOQJYG4/tsk9bqohWhNntfgPFfKUyfK1LNgjPdeTKVd6ObzL4jsJfnaJNNTuvfJ3GEy5gFeU0P+36HFVp6dY3h5VU4kHY+dOGOn4F4ylMX2ybwXMNo/kzHMBr1awmwxMg4LhRWT2mx3az0Z0qWYglbnRIz8wYD6EatAiT8kJM571+YLuxReN76TsqKp4YHhKTJjFFV5GdyGhk+ubeeI53gtA5h+IJs8sc6Amaa0ASzHxogdbKPc7hR21AjsIlqlszrR/oyNMR0S8Nf8rZhVfGhiyfuDgac+N4HgSrvFnuSPwO6i52Ou20kt8fDENNhvRIVQNCuRNMNWPM5WHMjxgGyEze4gDCuziLLTilG4djK5mu5l+klsZC01r
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(38070700021)(11063799003)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XHMyQfoOpYxX0K3h/37TmOvY0GtUaMy+5DRQpNFEryDRZCMSrFxSMtXhGuCz?=
 =?us-ascii?Q?aZ8AW3mc2yZlJWpgOUki++kk9bSvEIKkaYUZpWCCN7YzziOLYhp3R9lvuWKA?=
 =?us-ascii?Q?f3fZaN4bkl4tPBcY7ccTUVFbE03tnkRMw/8jyUp7BVkwCrptkWXw4g32KdFB?=
 =?us-ascii?Q?7lFe0HVIJFq2CQ8sHGCMq8wG7ErAhwaS9Klut6FlyJsSTNNs10Wlr5R/YcX9?=
 =?us-ascii?Q?+E/ZvcZegY8vigbxDxoyyCq5XCqUfu2Sq9qHq+Chu6okofG1qqqjN8E0LpMz?=
 =?us-ascii?Q?ijuEKbEF8PMici6fpEcYqwoqWwFN+cBZbfWiMmf8FZfE3tO2udjAmDvak18E?=
 =?us-ascii?Q?eRylfhcOlgs24Bn9OnwBZioZi8RL9ardNw43DmgrjznGTSMQcISBr/l/Hu/a?=
 =?us-ascii?Q?q64UFrOYAA/7Ag3lRkTDOm7KySmvLqZeOYs2zRwnV/ObwSF86VsinM7RvHz+?=
 =?us-ascii?Q?ZBrikWRgG0q8mozDyUPsracT9zMDwCXz/GsoHDorNpoFYjpxdy8Iyo1KGvno?=
 =?us-ascii?Q?56P8glHBZD7uwLFwEnT3Enb4hOeup9HgJEwuILlkq2IS740mnp/4ahQzm8vs?=
 =?us-ascii?Q?mzLAT1tqpsgx6Mfwvly56tMr46AbQaDeTP5ZKZX/nAgluIuvYEnT6gQaM2UL?=
 =?us-ascii?Q?UMKsuxR0/IBsyvJ8x0b5NGZRnSlYlpk68msTmFtyaWNSkHu5AAvPPLxguErS?=
 =?us-ascii?Q?tWswgOoJtCz2yYvnf++sWTGsc8FkzT9owzxXV/65SdR0ApevaRzHEdKfUJ4e?=
 =?us-ascii?Q?SGFszrqS3N9N69WtOvGTwqAWx/tFiZg2/t67GM5BwmZURIm4XG9x7xfWXlc7?=
 =?us-ascii?Q?YzIu66F8BmBW4EGyxeymPx6d43Lg/kF+fT1B5Jx237YKqCpwAxvHc2r3STlC?=
 =?us-ascii?Q?kADYQsp9+J7KdUZnV9wzhDHxHpMfICWMk4Ml+TgzDwvpb9t53VtDa/X7ltpY?=
 =?us-ascii?Q?nOpX6F8Qukg74L+jxwflonyC70zSnyIv6JPIckat3oqyKHB/390MXsgnW/Dq?=
 =?us-ascii?Q?CZKOnzL5rmiR4nK4J63tS8Lz9Zqy3YEZhkK3XEEAsPQxtSJ6oLxorzk26qj/?=
 =?us-ascii?Q?K3dQWz1gH6KSBVsk5mWHs7AhYqe9nxPB6nKACrxRHMjYZGHV6YRHIdNm3QfO?=
 =?us-ascii?Q?IDxXZP1uxts8v6C6pLZ727jm2TBS1fm/qgwD5QXIITuLt4Qq5Vx81mMYiWb9?=
 =?us-ascii?Q?nDfdJrYEx5dw/aqcMUzQwE3pbr2bLXcbalQtkC5FjcP7/yU/U3G1EI3IjbSM?=
 =?us-ascii?Q?nNdmfQcgwPE72nzEbRDXcA8SeQV3Edxeo1hQbwsoB9iRcAiI3EiPbwHmZmoE?=
 =?us-ascii?Q?5AGEsLIG6ifeM3DjK3Qhy+A469S2eCR/S8kkRm/TasLnso6sjBoa6uKao+D5?=
 =?us-ascii?Q?fU6GJMWA8XcLtDuFXbjv1kpOjGxWGjpgwq1KSOPzV6Jzs84TBCxTJ+H0EjOA?=
 =?us-ascii?Q?zgSzIVf46oLXUo09tOXhlGnK4b21TpzIhMoOlMKLtKUTcwxzlfq1tTTZ1u/r?=
 =?us-ascii?Q?uar5g2rySr7zfZOBsyiDic6kd7OXVLRhoRwjt1TXGdQwz/vF/CXjAF0l2xd+?=
 =?us-ascii?Q?2e1G6Nw+pHkgcNZoxs03FpqXjEaERB6HHUl2vNukaTts0O9f0sa9pmSEiWC+?=
 =?us-ascii?Q?oIgUWqY0DmUiKCVFtFW2Wj5NME9Mg90DQGodCcet2rAOt82Vz5QCME9QrqSe?=
 =?us-ascii?Q?Ml34OeAqdde2+7CkRONYYIJ0ZDux5HtO6heXUNLlP+ckcxTU?=
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
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265e0bcf-8039-426f-e049-08deb556df21
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 03:29:44.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJV/kxFE970vso7XI5x10khYyZoMefEmYNuJNBTw8nxnmCTgaLxW6HN+UzCNp99bat2uPqstRKTEqf5XEOHgrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804

> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > index 40d22ebe9224f..b4d7457097e60 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > @@ -96,12 +96,12 @@ static void enetc_msg_free_mbx(struct enetc_si *si,
> int idx)
> >  	struct enetc_hw *hw =3D &si->hw;
> >  	struct enetc_msg_swbd *msg;
> >
> > +	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
> > +	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
>=20
> Since enetc_wr() performs a posted memory-mapped I/O write over PCIe, doe=
s
> it
> need a dummy read-back (such as enetc_rd()) to flush the writes?
>=20
> Without a read-back, could dma_free_coherent() execute and unmap the
> memory
> while the write is still buffered in the PCIe hierarchy? This might leave=
 a
> window where an incoming DMA could still write to the memory being freed.
>=20
> Could writing 0 to the DMA address registers here cause memory corruption=
 at
> physical address 0x0?
>=20
> Since VFs are still fully active at this point in the teardown sequence
> (before pci_disable_sriov() is called), an active VF might send a message
> right after these registers are zeroed, causing the PF hardware to perfor=
m
> a DMA write to physical address 0x0.
>=20
> I noticed this is fixed later in the patch series by commit 675d55bcc7801
> (net: enetc: avoid VF->PF mailbox timeout during SR-IOV teardown).

These patches are part of a series and are all designed to address issues
introduced by commit beb74ac878c8 ("enetc: Add vf to pf messaging
support"). If subsequent patches have already resolved the issue you're
reporting, please refrain from reporting it again; it's pointless and a was=
te
of time.

>=20
> > +
> >  	msg =3D &pf->rxmsg[idx];
> >  	dma_free_coherent(&si->pdev->dev, msg->size, msg->vaddr, msg->dma);
> >  	memset(msg, 0, sizeof(*msg));
> > -
> > -	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
> > -	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
> >  }
>=20
> Regarding the teardown sequence in enetc_msg_psi_free(), is there a race
> condition that could cause a regression like a NULL pointer dereference o=
r
> use-after-free?
>=20
> If cancel_work_sync(&pf->msg_task) is called before
> enetc_msg_disable_mr_int()
> and free_irq(), an interrupt could fire immediately after cancel_work_syn=
c()
> returns. The IRQ handler (enetc_msg_psi_msix) would execute and
> unconditionally call schedule_work(&pf->msg_task), re-queuing the work.
>=20
> Then enetc_msg_free_mbx() frees the DMA buffer and zeros out the msg_swbd
> structure. When the mistakenly re-queued worker task executes
> enetc_msg_handle_rxmsg(), it would attempt to read from the nullified
> msg_swbd->vaddr or freed memory.
>=20
> I noticed this is fixed later in the patch series by commit 915d29ad4ee42
> (net: enetc: fix initialization order to prevent use of uninitialized res=
ources).

Likewise.

